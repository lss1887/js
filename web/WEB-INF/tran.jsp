<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>转换</title>
</head>
<body>

<%request.setAttribute("username","tom_request");

<select class="form-control" id="auditStatus" name="auditStatus">

    <option value="">全部</option>
        <option value="${auditStatus}">
            ${auditStatus}
        </option>

</select>
</body>
</html>