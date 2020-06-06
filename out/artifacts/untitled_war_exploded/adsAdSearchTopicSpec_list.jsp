<%@ page pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<c:set var="ctx" value="${pageContext.request.contextPath}" />
<jsp:useBean id="date" class="java.util.Date" />
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="utf-8" />
<title>专题配置</title>
<%@ include file="/assets/basic/resource_basic.jsp"%>
<link type="text/css" href="<%=request.getContextPath()%>/assets/css/jquery-ui-1.8.17.custom.css" rel="stylesheet" />
    <link type="text/css" href="<%=request.getContextPath()%>/assets/css/jquery-ui-timepicker-addon.css" rel="stylesheet" />
    <script type="text/javascript" src="<%=request.getContextPath()%>/assets/js/jquery-1.7.1.min.js"></script>
	<script type="text/javascript" src="<%=request.getContextPath()%>/assets/js/jquery-ui-1.8.17.custom.min.js"></script>
	<script type="text/javascript" src="<%=request.getContextPath()%>/assets/js/jquery-ui-timepicker-addon.js"></script>
    <script type="text/javascript" src="<%=request.getContextPath()%>/assets/js/jquery-ui-timepicker-zh-CN.js"></script>
	<script type="text/javascript" src="<%=request.getContextPath()%>/assets/js/bootstrap-suggest.min.js"></script>
<script type="text/javascript"
	src="${ctx }/assets/js/jquery.ajaxfileupload.js?v=20170719"></script>
	<script src="${ctx }/js/tk.js"></script>
<style type="text/css">
	.thumbnailSpSp { 
	    display: block;
	    margin-bottom: 20px;
	    line-height: 1.42857;
	    background-color: rgb(255, 255, 255);
	    padding: 4px;
	    border-image: initial;
	    border-radius: 4px;
	    transition: border 0.2s ease-in-out;
	}
	.form-controlNew { 
	    width: 80%;
	    height: 34px;
	    padding: 6px 12px;
	    font-size: 14px;
	    line-height: 1.42857143;
	    color: #555;
	    background-color: #fff;
	    background-image: none;
	    border: 1px solid #ccc;
	    border-radius: 4px;
	    -webkit-box-shadow: inset 0 1px 1px rgba(0,0,0,.075);
	    box-shadow: inset 0 1px 1px rgba(0,0,0,.075);
	    -webkit-transition: border-color ease-in-out .15s,-webkit-box-shadow ease-in-out .15s;
	    -o-transition: border-color ease-in-out .15s,box-shadow ease-in-out .15s;
	    transition: border-color ease-in-out .15s,box-shadow ease-in-out .15s;
	}
	
	.imgright{
		display: block;
    	position: absolute;
	    top: 20px;
	    right: 200px;
	    z-index: 999;
	} 
	.spStyle{
		display:none;
	}
	.buju{
		max-width: 800px;
    	margin-left: 150px;
	}
</style>
</head>
<body>    
	<div class="modal-body">
		<form id="form-rank-specUpd" class="form-horizontal"> 
			<div class="form-group">
				<label class="col-sm-1 control-label">专题名称:</label>
				<div class="col-sm-6">
					<input type="text" class="form-control" 
					placeholder="请输入名称" id="name" name="adNameTopic">
					<span id="spadName"></span>
				</div>
			</div> 
			<div class="form-group">
				<label class="col-sm-1 control-label">专题样式:</label>
				<div class="col-sm-6">
					<select class="form-control" id="specId" name="specIdTopic">
						<option value="0">请选择样式</option>
						<c:forEach items="${topicSpecList }" var="item">
								<option itemNum="${item['subItemNum'] }"
								contentFormat='${item['mainItemFormat'] }'
								itemFormat='${item['subItemFormat'] }'
								topicFormat = '${item['topicFormat'] }'
								demoUrl="${item['demoUrl'] }"
								value="${item['specId'] }">${item['name'] }</option>
						</c:forEach>
					</select>
				</div>
			</div>  
			<div class="form-group">
				<label class="col-sm-1 control-label">开始日期:</label>
				<div class="col-sm-6">
					<div class="input-group">
						<input type="text" style="width: 100%;" class="ui_timepicker form-controlNew" value="" name="startTimeTopic" id="startTime">
					</div>
				</div>
			</div>
			<div class="form-group">
				<label class="col-sm-1 control-label">结束日期:</label>
				<div class="col-sm-6">
					<div class="input-group">
						<input type="text" style="width: 100%;" class="ui_timepicker form-controlNew" value="" name="endTimeTopic" id="endTime">
					</div>
				</div>
			</div>
			<div class="form-group">
				<label class="col-sm-1 control-label">关键词:</label>
				<div class="col-sm-6">
					<textarea rows="6" cols="70" id="keywords"
						placeholder="输入关键词,以英文逗号','隔开"
						 name="keywordsTopic"></textarea>
				</div>
			</div>
			<div id="divDemoUrl" style="display:none;">
				<div class="imgright" id="imgright">
					<img style="width:320px;" src="../images/upload.png" id="demoUrlImg">
					<p style="text-align: center;font-weight: bold;">专题demo</p>
				</div>
			</div>
			<div id="divStyle"></div>
			<div class="form-group">
				<div class="col-sm-offset-3 col-sm-9">
					<input class="btn btn-success" style="width: 160px;height: 40px;margin-left: -360px;" type="button" value="确定"
						onclick="doSpecIns()" /> 
				</div>
			</div>
		</form>
	</div>  
	<iframe name="downFrame" style="display: none;"></iframe>
	<script src="${ctx}/js/page.js"></script>
	<script type="text/javascript"> 
		$(function() { 
			$('.ui_timepicker')
				.datetimepicker({
					language : 'zh-CN',
					showSecond: true,
		            timeFormat: 'hh:mm:ss',
		            stepHour: 1,
		            stepMinute: 1,
		            stepSecond: 1
			})   
		});
		
		function showApp(j){
			var appId = $("#appId"+j).val();
			var myReg = /^(-|\+)?\d+$/;  
			if (!myReg.test(appId)) {   
			    alert("应用ID只能是数字!");  
			    return;  
			}
			
			$.ajax({
				url:'${ctx}/adsAdSearchTopic/showApp',
				type:'POST',
				data:{
					  appId:appId 
					},
				success:function(data){
					var json = eval(data);
					if(json.code==1001){
						var count = 0;
						if(json.app != null){
							$("#title"+j).val(json.app.appName);
						}
					}
				},error:function(){
					alert("系统错误,请稍后再试...");
				}
			});
		}

		function showAppName(i){
			var appId = $("#"+i).val();
			var myReg = /^(-|\+)?\d+$/;
			if (!myReg.test(appId)) {
				alert("应用ID只能是数字!");
				return;
			}
			$.ajax({
				url:'${ctx}/adsAdSearchTopic/showApp',
				type:'POST',
				data:{
					appId:appId
				},
				success:function(data){
					var json = eval(data);
					if(json.code==1001){
						var count = 0;
						if(json.app != null){
							if(json.app.accountType == 1){
								$("#sp"+i).html(json.app.appName
										+"<span style='color:red;font-weight: bold;'>(资源为抓包)</span>");
								count++;
							}
							if(json.app.status == 2){
								$("#sp"+i).html(json.app.appName
										+"<span style='color:red;font-weight: bold;'>(资源已下架)</span>");
								count++;
							}
							if(json.app.status == 10){
								$("#sp"+i).html(json.app.appName
										+"<span style='color:red;font-weight: bold;'>(资源已删除)</span>");
								count++;
							}
							if(json.app.level != 2){
								$("#sp"+i).html(json.app.appName
										+"<span style='color:red;font-weight: bold;'>(资源等级低于L2)</span>");
								count++;
							}
							if(count == 0){
								$("#sp"+i).html(json.app.appName);
							}
						}else{
							$("#spItem"+i).html("没有找到该应用");
						}
					}
					else{
						$("#spItem"+i).html("没有找到该应用");
					}

				},error:function(){
					alert("系统错误,请稍后再试...");
				}
			});
		}

		function showItemAppName(i){
			var appId = $("#"+i).val();
			var myReg = /^(-|\+)?\d+$/;  
			if (!myReg.test(appId)) {   
			    alert("应用ID只能是数字!");
			    return;  
			} 
			$.ajax({
				url:'${ctx}/adsAdSearchTopic/showApp',
				type:'POST',
				data:{
					  appId:appId 
					},
				success:function(data){
					var json = eval(data);
					if(json.code==1001){
						var count = 0;
						if(json.app != null){
							if(json.app.accountType == 1){
								$("#sp"+i).html(json.app.appName
								+"<span style='color:red;font-weight: bold;'>(资源为抓包)</span>");
								count++;
							}
							if(json.app.status == 2){
								$("#sp"+i).html(json.app.appName
								+"<span style='color:red;font-weight: bold;'>(资源已下架)</span>");
								count++;
							}
							if(json.app.status == 10){
								$("#sp"+i).html(json.app.appName
								+"<span style='color:red;font-weight: bold;'>(资源已删除)</span>");
								count++;
							}
							if(json.app.level != 2){
								$("#sp"+i).html(json.app.appName
								+"<span style='color:red;font-weight: bold;'>(资源等级低于L2)</span>");
								count++;
							}
							if(count == 0){
								$("#sp"+i).html(json.app.appName);
							}
						}else{
							$("#spItem"+i).html("没有找到该应用");
						}
					}
					else{
						$("#spItem"+i).html("没有找到该应用");
					}
					
				},error:function(){
					alert("系统错误,请稍后再试...");
				}
			});
		}
		
		$("#specId").change(function() {
			var contentFormat = $(this).find("option:selected").attr("contentFormat");
			var itemFormat = $(this).find("option:selected").attr("itemFormat");
			var topicFormat = $(this).find("option:selected").attr("topicFormat");
			var itemNum = $(this).find("option:selected").attr("itemNum");
			var demoUrl = $(this).find("option:selected").attr("demoUrl");
			if (demoUrl != null && demoUrl != "") {
				$("#demoUrlImg").attr("src", demoUrl);
				$("#divDemoUrl").show();
			}
			//专题内容
			var jsonContents = eval("(" + contentFormat + ")");
			var htmlInfo = "";
			if (jsonContents != null && jsonContents != "") {
				htmlInfo += '<h3>专题内容设置</h3>';
				$.each(jsonContents, function (i, item) {
					htmlInfo += '<div class="form-group">';
					htmlInfo += '<label class="col-sm-1 control-label">' + item.name + ':</label>';
					htmlInfo += '<div class="col-sm-6">';
					if (item.type == "text") {
						if (i == "appId") {
							htmlInfo += '<input type=' + item.type + ' onchange="showAppName(\'' + i + '\')" class="form-controlNew" id=' + i + ' name="' + i + 'Topic">';
							htmlInfo += '<span id="sp' + i + '"></span>';
						} else {
							htmlInfo += '<input type=' + item.type + ' class="form-controlNew" id=' + i + ' name="' + i + 'Topic">';
						}
						if (item.max != null) {
							if (item.min != null) {
								htmlInfo += '<span>(限制在' + item.min + '~' + item.max + '个字以内)</span>';
							} else {
								htmlInfo += '<span>(限制在' + item.max + '个字以内)</span>';
							}
						}
					} else if (item.type == "img") {
						htmlInfo += '<input type="hidden" value=""  id="hdContent' + i + '" name="' + i + 'TopicHd">';
						htmlInfo += '<img id="imgContent' + i + '" width="240px" height="240px"  src="../images/upload.png" alt="...">';
						htmlInfo += '<input type="file" name="fileContent" id="fileContent' + i + '" style="margin-top: 10px;">';
						htmlInfo += '<p><input type="button" value="上传素材" style="margin-top: 10px;" class="btn btn-primary" onclick="doImgContentIns(\'' + i + '\')"></p>';
						htmlInfo += '<p>素材要求:<br />素材格式:' + item.format + '<br />素材尺寸:' + item.width + '*' + item.height + '<br />素材大小<' + item.size + 'KB</p>';
					}
					htmlInfo += '</div>';
					htmlInfo += '</div>';
				});
			}

			//专题内容
			var jsonTopicFormat = eval("(" + topicFormat + ")");
			if (jsonTopicFormat != null && jsonTopicFormat != "") {
				$.each(jsonTopicFormat, function (i, item) {
					if (i != "adName") {
						htmlInfo += '<div class="form-group">';
						htmlInfo += '<label class="col-sm-1 control-label">' + item.name + ':</label>';
						htmlInfo += '<div class="col-sm-6">';
						if (item.type == "text") {
							if (i == "appId") {
								htmlInfo += '<input type=' + item.type + ' onchange="showAppName(\'' + i + '\')" class="form-controlNew" id=' + i + ' name="' + i + 'Topic">';
								htmlInfo += '<span id="sp' + i + '"></span>';
							} else {
								htmlInfo += '<input type=' + item.type + ' class="form-controlNew" id=' + i + ' name="' + i + 'Topic">';
							}
							if (item.max != null) {
								if (item.min != null) {
									htmlInfo += '<span>(限制在' + item.min + '~' + item.max + '个字以内)</span>';
								} else {
									htmlInfo += '<span>(限制在' + item.max + '个字以内)</span>';
								}
							}
						} else if (item.type == "img") {
							htmlInfo += '<input type="hidden" value=""  id="hdContent' + i + '" name="' + i + 'TopicHd">';
							htmlInfo += '<img id="imgContent' + i + '" width="240px" height="240px"  src="../images/upload.png" alt="...">';
							htmlInfo += '<input type="file" name="fileContent" id="fileContent' + i + '" style="margin-top: 10px;">';
							htmlInfo += '<p><input type="button" value="上传素材" style="margin-top: 10px;" class="btn btn-primary" onclick="doImgContentIns(\'' + i + '\')"></p>';
							htmlInfo += '<p>素材要求:<br />素材格式:' + item.format + '<br />素材尺寸:' + item.width + '*' + item.height + '<br />素材大小<' + item.size + 'KB</p>';
						} else if (item.type == "int") {
							htmlInfo += '<input type="text" class="form-controlNew" id=' + i + ' name="' + i + 'Topic">';
							if (item.max != null) {
								if (item.min != null) {
									htmlInfo += '<span>(限制' + item.min + '~' + item.max + '以内(正整数))</span>';
								} else {
									htmlInfo += '<span>(限制' + item.max + '以内(正整数))</span>';
								}
							}
						} else if (item.type == "enum") {
							if (item.enumSet != null) {
								$.each(item.enumSet, function (m, setEnum) {
									htmlInfo += '<input type="checkbox" style="height: 20px;margin-right: 20px;"  name="' + i + 'Topic" value=' + setEnum + '>' + setEnum + '&nbsp;&nbsp;';
								});
							}
						}
						htmlInfo += '</div>';
						htmlInfo += '</div>';
					} else {
						var spHtml = "";
						if (item.max != null) {
							if (item.min != null) {
								spHtml = '<span>(限制在' + item.min + '~' + item.max + '个字以内)</span>';
							} else {
								spHtml = '<span>(限制在' + item.max + '个字以内)</span>';
							}
						}
						$("#spadName").html(spHtml);
					}
				});
			}

			//栏目
			var jsonItem = eval("(" + itemFormat + ")");
			if (jsonItem != null && jsonItem != "") {
				if (itemNum == 16) {
					htmlInfo += '<div class="row">';
					for (var j = 0; j < itemNum; j++) {
						htmlInfo += '<div class="col-sm-3 ">';
						htmlInfo += '<div class="thumbnail">';
						htmlInfo += '<h3>栏目' + (j + 1) + '</h3>';
						htmlInfo += '<div class="caption">';
						var idNmae = "";
						$.each(jsonItem, function (i, item) {
							idNmae = i + j;
							if (item.type == "int") {
								htmlInfo += '<p>' + item.name + '</p>';
								htmlInfo += '<input type="text" onchange="showApp(\'' + j + '\')" class="form-controlNew" style="width:208.75px " id=' + idNmae + ' name="itemShow[' + j + '].' + i + 'Item" >';
							}
							if (item.type == "text") {
								htmlInfo += '<div><div class="input-group">';
								htmlInfo += '<p>' + item.name + '</p>';
								htmlInfo += '<input type=' + item.type + ' class="form-control"  style="margin-left:1px" onkeyup="showAppId(\'' + j + '\')"  id=' + idNmae + ' name="itemShow[' + j + '].' + i + 'Item" >';
								htmlInfo += '<div class="input-group-btn"><ul class="dropdown-menu dropdown-menu-right" role="menu"></ul></div></div></div>';
								htmlInfo += '</div></div></div>';
							}
						});
						htmlInfo += '</div>';
					}

				} else {
					htmlInfo += '<div class="row">';
					for (var j = 0; j < itemNum; j++) {
						htmlInfo += '<div class="col-sm-6 col-md-8" style="width: 58.6667%;">';
						htmlInfo += '<div class="thumbnail">';
						htmlInfo += '<h3>栏目' + (j + 1) + '</h3>';
						htmlInfo += '<div class="caption">';
						var idNmae = "";
						$.each(jsonItem, function (i, item) {
							idNmae = i + j;
							if (item.type == "int") {
								htmlInfo += '<p>' + item.name + '</p><p>';
								htmlInfo += '<input type="text" onchange="showApp(\'' + j + '\')" class="form-controlNew" id=' + idNmae + ' name="itemShow[' + j + '].' + i + 'Item" >';
							}
							if (item.type == "text") {
								htmlInfo += '<p>' + item.name + '</p><p>';
								if (i == "appId") {
									htmlInfo += '<input type=' + item.type + ' onchange="showItemAppName(\'' + idNmae + '\')"  class="form-controlNew" id=' + idNmae + ' name="itemShow[' + j + '].' + i + 'Item" >';
									htmlInfo += '<span id="spItem' + i + '"></span>';
								} else {
									htmlInfo += '<input type=' + item.type + ' form-controlNew id=' + idNmae + ' name="itemShow[' + j + '].' + i + 'Item" >';
								}
								if (item.max != null) {
									if (item.min != null) {
										htmlInfo += '<span>(限制在' + item.min + '~' + item.max + '个字以内)</span>';
									} else {
										htmlInfo += '<span>(限制在' + item.max + '个字以内)</span>';
									}
								}
								htmlInfo += '</p>';
							} else if (item.type == "img") {
								htmlInfo += '<input type="hidden" value=""  id="hd' + idNmae + '" name="itemShow[' + j + '].' + i + 'ItemHd">';
								htmlInfo += '<img id="img' + idNmae + '" width="240px" height="240px"  src="../images/upload.png" alt="...">';
								htmlInfo += '<input type="file" name="file" id="file' + idNmae + '" style="margin-top: 10px;">';
								htmlInfo += '<p><input type="button" value="上传素材" style="margin-top: 10px;" class="btn btn-primary" onclick="doImg(\'' + idNmae + '\',\'' + i + '\')"></p>';
								htmlInfo += '<p>素材要求:<br />素材格式:' + item.format + '<br />素材尺寸:' + item.width + '*' + item.height + '<br />素材大小<' + item.size + 'KB</p>';
							}
						});
						htmlInfo += '</div></div></div>';
					}
					htmlInfo += '</div>';
				}
				$("#divStyle").html(htmlInfo);
				if(itemNum == 16){
					initItem(itemNum);
				}
			}
		});

		function initItem(itemNum) {
			for(var j = 0; j < itemNum;j++){
				$("#title"+j).bsSuggest({
					allowNoKeyword: false,
					multiWord: false,
					getDataMethod: "url",
					url: '${ctx}/adsCommon/queryApp?appName=',
					fnProcessData: function (json) {
						var index, len, data = {value: []};
						if (!json || !json.code == 1001) {
							return false;
						}

						if(json.code == 1001 && json.appList != null){
							len = json.appList.length;
							for (index = 0; index < len; index++) {
								data.value.push({
									name : json.appList[index].appName,
									id: json.appList[index].appId
								});
							}
						}
						else{
							return false;
						}

						return data;
					}
				}).on('onDataRequestSuccess', function (e, result) {

				}).on('onSetSelectValue', function (e, keyword, data) {
					var n = e.target.id;
					 n= n.replace(/[^0-9]/g,"");
					$("#appId"+n).val(data.id);
				}).on('onUnsetSelectValue', function () {
				});
			}
		};



		function doImgContentIns(key){
			if($("#fileContent"+key).val() =="" || $("#fileContent"+key).val() == null){
				alert("请上传素材");
				return;
			} 
			var specId = $("#specId").val();
			var fileSuffix =  $("#fileContent"+key).val();
		
			$.ajaxFileUpload({
				url: '${ctx}/adsAdSearchTopic/uploadImgContent', //用于文件上传的服务器端请求地址
	            secureuri: false, //是否需要安全协议，一般设置为false
	            fileElementId: 'fileContent'+key, //文件上传域的ID
	            dataType: 'json', //返回值类型 一般设置为json
	            data:{
	            	fileSuffix:fileSuffix,
	            	specId:specId,
	            	key:key
	            	},
	            success : function(data) { 
	    			if (data.code == 1001) { 
	    				$("#imgContent"+key).attr("src",data.material); 
	    				$("#hdContent"+key).val(data.material); 
	    				$("#fileContent"+key).text(''); 
	    				alert(data.msg);
	    			} else {
	    				$("#imgContent"+key).attr("src","../images/upload.png");
	    				$("#hdContent"+key).val(""); 
	    				$("#fileContent"+key).text('');
	    				alert(data.msg);
	    			}
	    		},
	    		error : function() {
	    			$("#fileContent"+id).text('');
	    		}
	         });
		}

		function showAppId(j) {
		var appName	= $("#title"+j).val();
			if(appName == "" || appName == null){
				$("#appId"+j).val("");
				};
		}



		function doImg(id,key){
			if($("#file"+id).val() =="" || $("#file"+id).val() == null){
				alert("请上传素材");
				return;
			}
			var specId = $("#specId").val();
			var fileSuffix =  $("#file"+id).val();
			
			$.ajaxFileUpload({
				url: '${ctx}/adsAdSearchTopic/uploadImg', //用于文件上传的服务器端请求地址
	            secureuri: false, //是否需要安全协议，一般设置为false
	            fileElementId: 'file'+id, //文件上传域的ID
	            dataType: 'json', //返回值类型 一般设置为json
	            data:{
	            	fileSuffix:fileSuffix,
	            	specId:specId,
	            	key:key
	            	},
	            success : function(data) { 
	    			if (data.code == 1001) {
	    				$("#img"+id).attr("src",data.material);
	    				$("#hd"+id).val(data.material);
	    				$("#file"+id).text('');
	    				alert(data.msg);
	    			} else {
	    				$("#img"+id).attr("src","../images/upload.png");
	    				$("#hd"+id).val(""); 
	    				$("#file"+id).text('');
	    				alert(data.msg);
	    			}
	    		},
	    		error : function() {
	    			$("#file"+id).text('');
	    		}
	         });
		}
	
	function GetDateDiff(startTime, endTime, diffType) {
    //将xxxx-xx-xx的时间格式，转换为 xxxx/xx/xx的格式 
    startTime = startTime.replace(/\-/g, "/");
    endTime = endTime.replace(/\-/g, "/");
    //将计算间隔类性字符转换为小写
    diffType = diffType.toLowerCase();
    var sTime =new Date(startTime); //开始时间
    var eTime =new Date(endTime); //结束时间
    //作为除数的数字
    var timeType =1;
    switch (diffType) {
        case"second":
            timeType =1000;
        break;
        case"minute":
            timeType =1000*60;
        break;
        case"hour":
            timeType =1000*3600;
        break;
        case"day":
            timeType =1000*3600*24;
        break;
        default:
        break;
    }
    return parseInt((eTime.getTime() - sTime.getTime()) / parseInt(timeType));
}
	
	function doSpecIns(){
		
		var startTime = $("#startTime").val();
		var endTime = $("#endTime").val();
		
		if(startTime == null || startTime == ""){
			alert("请选择开始日期！");
			return;
		}
		
		if(endTime == null || endTime == ""){
			alert("请选择结束日期！");
			return;
		}
		
		if(endTime < startTime){
			alert("结束日期不能小于开始日期！");
			return;
		}
		
		if(GetDateDiff(startTime,endTime,"day") > 31){
		  	alert("开始时间和结束时间选择最长为31天!");
			return;
		}topicSpecList
		
		if(!confirm("确认添加专题?"))
			return;
		$.ajax({
			url:'${ctx}/adsAdSearchTopic/addTopic',
			type:'POST',
			data:$("#form-rank-specUpd").serialize(),
			success:function(data){
				var json = eval(data);
				if(json.code==1001){
					alert(json.msg);
					window.location.href="${ctx}/adsAdSearchTopicSpec/list"; 
				}
				else{
					alert(json.msg);
				}
				
			},error:function(){
				alert("系统错误,请稍后再试...");
			}
		});
	}
	
	</script>
</body>
</html>