<%@ page contentType="text/html;charset=UTF-8"%>
<%@ taglib prefix="sitemesh" uri="http://www.opensymphony.com/sitemesh/decorator" %>  
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<c:set var="ctx" value="${pageContext.request.contextPath}" />


<!DOCTYPE html>
<html>
<head>
<title>党校在线学习平台-<sitemesh:title/></title>
<meta http-equiv="Content-Type" content="text/html;charset=utf-8" />
<meta http-equiv="Cache-Control" content="no-store" />
<meta http-equiv="Pragma" content="no-cache" />
<meta http-equiv="Expires" content="0" />

<link type="image/x-icon" href="${ctx}/static/images/favicon.ico" rel="shortcut icon">
<link rel="stylesheet" type="text/css" href="${ctx}/static/unicorn/css/bootstrap.min.css" />
<link rel="stylesheet" type="text/css" href="${ctx}/static/unicorn/css/font-awesome.css" />
<link rel="stylesheet" type="text/css" href="${ctx}/static/unicorn/css/jquery-ui.css" />

<link rel="stylesheet" type="text/css" href="${ctx}/static/unicorn/css/unicorn.css" />

<script src="${ctx}/static/unicorn/js/jquery.min.js"></script>
<script src="${ctx}/static/unicorn/js/jquery-ui.custom.js"></script>

<script src="${ctx}/static/unicorn/js/jquery.nicescroll.min.js"></script>

<script src="${ctx}/static/unicorn/js/unicorn.js"></script>


<sitemesh:head/>
</head>

<body data-color="grey" class="flat">
	<div id="wrapper">

		<%@ include file="/WEB-INF/inform/layouts/header.jsp"%>
	
			<sitemesh:body/>
	
		<%@ include file="/WEB-INF/inform/layouts/footer.jsp"%>
	</div>

</body>
</html>
