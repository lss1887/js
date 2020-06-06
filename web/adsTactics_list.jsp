<%@ page pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<c:set var="ctx" value="${pageContext.request.contextPath}" />
<jsp:useBean id="beginTime" class="java.util.Date" /> 
<jsp:useBean id="endTime" class="java.util.Date" />
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="utf-8" />
<title>策略管理</title>
<link rel="stylesheet" href="<%=request.getContextPath()%>/assets/bootstrap-daterangepicker/daterangepicker-bs3.css">
<script src="<%=request.getContextPath()%>/assets/bootstrap-daterangepicker/moment.min.js"></script>
<script src="<%=request.getContextPath()%>/assets/bootstrap-daterangepicker/daterangepicker.js"></script>
<link rel="stylesheet" href="<%=request.getContextPath()%>/assets/css/bootstrap-datetimepicker.min.css">
<script src="<%=request.getContextPath()%>/assets/js/bootstrap-datetimepicker.min.js"></script>
<script src="<%=request.getContextPath()%>/assets/js/bootstrap-datetimepicker.zh-CN.js"></script> 
<script type="text/javascript" src="${ctx }/assets/js/jquery.ajaxfileupload.js?v=20170719"></script>
<script src="${ctx }/js/tk.js"></script> 
<style type="text/css">
	.codeShow{
	    float: right;
		margin-top: -35px;
		margin-right: -100px;
	}
	.divStyle{
		border: solid 1px #999;
	}
	.hideInfo{
		display:none;
	}
	.inpCss{
		width: 18px;
   		height: 18px;
	}
	
</style>
</head>
<body style="margin: 50px;">
<form id="mainForm" class="form-inline" method="post" action="${ctx }/adsTactics/list"> 
	<div class="well">
		<div class="row">
			<div class="col-sm-12">  
				<div class="form-group">
					<label>状态:</label>
					<select class="form-control" name="effectStatus" id="effectStatus">
						<option value="">全部</option>  
						<option value="0" <c:if test="${mixStrategy.effectStatus=='0' }">selected</c:if>>未生效</option>
						<option value="1" <c:if test="${mixStrategy.effectStatus=='1' }">selected</c:if>>生效中</option>
						<option value="2" <c:if test="${mixStrategy.effectStatus=='2' }">selected</c:if>>已过期</option>
					</select>
				</div>
				<div class="form-group">
					<label>是否启用:</label>
					<select class="form-control" name="enabled" id="enabled">
						<option value="">全部</option>  
						<option value="0" <c:if test="${mixStrategy.enabled=='0' }">selected</c:if>>否</option>
						<option value="1" <c:if test="${mixStrategy.enabled=='1' }">selected</c:if>>是</option>
					</select>
				</div>
				<div class="form-group">
					<label>策略ID:</label>
					<input name="strategyId" value="${mixStrategy.strategyId }"
					onkeyup="if(this.value.length==1){this.value=this.value.replace(/[^1-9]/g,'')}else{this.value=this.value.replace(/\D/g,'')}"
					 id="strategyId" class="form-control"/>
				</div>
				<div class="form-group">
					<label>策略名称:</label>
					<input name="strategyName" value="${fn:escapeXml(mixStrategy.strategyName) }" id="strategyName" class="form-control"/>
				</div>
				<input class="btn btn-primary" type="button" value="查询" onclick="query();" />				
			</div>
		</div>
	</div> 
	<div> 
		<div style="margin-bottom: 20px;"> 
			<input class="btn btn-primary" type="button" value="新建策略" onclick="showInsert()" />
		</div>
		<c:choose>
			<c:when test="${empty result }">
				<p style="text-align: center;">无符合该条件的结果！</p>
			</c:when>
			<c:otherwise>
				<table class="table table-bordered table-striped table-condensed table-hover">
					<tr>  
						<th>排序</th>
						<th>策略ID</th>  
						<th>策略名称</th>  
						<th>是否启用</th>
						<th>状态</th>
						<th>操作</th>  
					</tr>
					<c:forEach items="${result}" var="item">
						<tr>  
							<td class="ctn">${item.priority }</td>
							<td class="ctn">${item.strategyId }</td>
							<td>${fn:escapeXml(item.strategyName)}</td>  
							<td>
							    <c:choose>
			                    	<c:when test="${item.enabled=='0' }">否</c:when>
			                    	<c:when test="${item.enabled=='1' }">是</c:when> 
		                    	</c:choose>
							</td>
							<td>
							    <c:choose>
			                    	<c:when test="${item.effectStatus=='0' }">未生效</c:when>
			                    	<c:when test="${item.effectStatus=='1' }">生效中</c:when>
			                    	<c:when test="${item.effectStatus=='2' }">已过期</c:when> 
		                    	</c:choose>
							</td>
							<td>   
								<button type="button" class="btn btn-default" onclick="showUpdate('${item.strategyId }')" >
								     <span class="glyphicon glyphicon-edit" ></span> 修改
								</button>
								<button type="button" class="btn btn-default" onclick="doDel('${item.strategyId }')" >
						     		<span class="glyphicon glyphicon-trash" ></span> 删除
								</button>
							</td>  
						</tr>
					</c:forEach>
				</table>
			</c:otherwise>
		</c:choose>
	</div>
</form> 
<div id="modal-insert" class="modal fade"> 
	<div class="modal-dialog modal-lg">
		<div class="modal-content">
			<div class="modal-header">
	        	<button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
		        <h4 class="modal-title" id="myModalLabel">创建策略</h4>
		    </div>
			<div class="modal-body" id="modalBoby">
			
			</div>
		</div>
	</div>
</div>  
 



<iframe name="downFrame" style="display: none;"></iframe>
<script src="${ctx}/js/page.js"></script> 
<script type="text/javascript"> 
	
	function showInsert(){		
		var jsonStr = [{"name":"we are family","url":"http://pic1.win4000.com/wallpaper/8/58e45272c8bb3.jpg"},{"name":"Naruto","url":"http://pic1.win4000.com/wallpaper/8/58e45274911d1.jpg"},{"name":"Gaara","url":"http://pic1.win4000.com/wallpaper/8/58e45277387cb.jpg"}]; //创建对象；
		var data = JSON.stringify(jsonStr);       //转为JSON字符串
		console.log(data);
		
		var imgHtml = "<div id='carousel-example-generic' class='carousel slide' data-ride='carousel'><ol class='carousel-indicators'><li data-target='#carousel-example-generic' data-slide-to='0' class='active'></li><li data-target='#carousel-example-generic' data-slide-to='1'></li><li data-target='#carousel-example-generic' data-slide-to='2'></li></ol>";
		imgHtml += "<div class='carousel-inner' role='listbox'>";
		
		var jsData = JSON.parse(data);
		console.log(jsData);
		
		$.each(jsData,function(index,item){
			if(index == 0){
				imgHtml += "<div class='item active'><img src='"+item.url+"' alt='"+item.name+"'><div class='carousel-caption'>"+item.name+"</div></div>"
			}else{
				imgHtml += "<div class='item'><img src='"+item.url+"' alt='mr'><div class='carousel-caption'>"+item.name+"</div></div>";
			}
		});
		
		imgHtml += "<a class='left carousel-control' href='#carousel-example-generic' role='button' data-slide='prev'><span class='glyphicon glyphicon-chevron-left' aria-hidden='true'></span><span class='sr-only'>Previous</span></a><a class='right carousel-control' href='#carousel-example-generic' role='button' data-slide='next'><span class='glyphicon glyphicon-chevron-right' aria-hidden='true'></span><span class='sr-only'>Next</span></a></div>";
		
		$("#modalBoby").html(imgHtml);
		
		$("#modal-insert").modal('show');
	}
	
	function cancelIns(){
		$("#modal-insert").modal('hide');
	}
	 
	<%--查询--%>
	function query() {
		$("#hid_page").val(1);
		doQuery();
	}
	
	function doQuery(){
		$("#mainForm").submit();
	}
	

</script>
</body>
</html>
