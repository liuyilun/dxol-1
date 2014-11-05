<%@ page contentType="text/html;charset=UTF-8"%>
<%@ taglib prefix="sitemesh" uri="http://www.opensymphony.com/sitemesh/decorator" %>  
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<c:set var="ctx" value="${pageContext.request.contextPath}" />

<!DOCTYPE html>
<html>
<head>
<title>党校在线学习平台-后台管理 <sitemesh:title/></title>
<meta http-equiv="Content-Type" content="text/html;charset=utf-8" />
<meta http-equiv="Cache-Control" content="no-store" />
<meta http-equiv="Pragma" content="no-cache" />
<meta http-equiv="Expires" content="0" />

<link type="image/x-icon" href="${ctx}/static/images/favicon.ico" rel="shortcut icon">
<link rel="stylesheet" type="text/css" href="${ctx}/static/unicorn/css/bootstrap.min.css" />
<link rel="stylesheet" type="text/css" href="${ctx}/static/unicorn/css/font-awesome.css" />
<link rel="stylesheet" type="text/css" href="${ctx}/static/unicorn/css/fullcalendar.css" />
<link rel="stylesheet" type="text/css" href="${ctx}/static/unicorn/css/jquery.jscrollpane.css" />	
<link rel="stylesheet" type="text/css" href="${ctx}/static/unicorn/css/unicorn.css" />
<link href="${ctx}/static/styles/default.css" type="text/css" rel="stylesheet" />

<script src="${ctx}/static/unicorn/js/excanvas.min.js"></script>
<script src="${ctx}/static/unicorn/js/jquery.min.js"></script>
<script src="${ctx}/static/unicorn/js/jquery-ui.custom.js"></script>
<script src="${ctx}/static/unicorn/js/bootstrap.min.js"></script>
<script src="${ctx}/static/unicorn/js/jquery.flot.min.js"></script>
<script src="${ctx}/static/unicorn/js/jquery.flot.resize.min.js"></script>
<script src="${ctx}/static/unicorn/js/jquery.sparkline.min.js"></script>
<script src="${ctx}/static/unicorn/js/fullcalendar.min.js"></script>

<script src="${ctx}/static/unicorn/js/jquery.nicescroll.min.js"></script>
<script src="${ctx}/static/unicorn/js/unicorn.js"></script>
<script src="${ctx}/static/unicorn/js/unicorn.dashboard.js"></script>

<script src="${ctx}/static/unicorn/js/jquery.icheck.min.js"></script>
<script src="${ctx}/static/unicorn/js/select2.min.js"></script>
<script src="${ctx}/static/unicorn/js/jquery.validate.js"></script>
<script src="${ctx}/static/unicorn/js/unicorn.form_validation.js"></script>



<sitemesh:head/>
</head>

<body data-color="grey" class="flat">
	<div id="wrapper">

		<%@ include file="/WEB-INF/admin/layouts/header.jsp"%>
	
			<sitemesh:body/>
	
		<%@ include file="/WEB-INF/admin/layouts/footer.jsp"%>
	</div>

</body>
</html>