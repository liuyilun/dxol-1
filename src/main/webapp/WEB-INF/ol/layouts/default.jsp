<%@ page contentType="text/html;charset=UTF-8"%>
<%@ taglib prefix="sitemesh" uri="http://www.opensymphony.com/sitemesh/decorator" %>  
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<c:set var="ctx" value="${pageContext.request.contextPath}" />


<!DOCTYPE html>
<html>
<head>
<title>党校在线学习平台 <sitemesh:title/></title>
<meta http-equiv="Content-Type" content="text/html;charset=utf-8" />
<meta http-equiv="Cache-Control" content="no-store" />
<meta http-equiv="Pragma" content="no-cache" />
<meta http-equiv="Expires" content="0" />
<meta name="viewport" content="width=device-width, initial-scale=1">

<link type="image/x-icon" href="${ctx}/static/images/favicon.ico" rel="shortcut icon">
 <!-- Bootstrap Core CSS -->
<link href="${ctx}/static/ol/css/bootstrap.min.css" rel="stylesheet">
<!-- MetisMenu CSS -->
<link href="${ctx}/static/ol/css/plugins/metisMenu/metisMenu.min.css" rel="stylesheet">
<!-- Custom CSS -->
<link href="${ctx}/static/ol/css/sb-admin-2.css" rel="stylesheet">
<!-- Custom Fonts -->
<link href="${ctx}/static/ol/font-awesome-4.2.0/css/font-awesome.min.css" rel="stylesheet" type="text/css">

<!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
<!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
<!--[if lt IE 9]>
    <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
    <script src="https://oss.maxcdn.com/libs/respond.js/1.4.2/respond.min.js"></script>
<![endif]-->

<script src="${ctx}/static/ol/js/jquery-1.11.0.js"></script>

    <!-- Bootstrap Core JavaScript -->
    <script src="${ctx}/static/ol/js/bootstrap.min.js"></script>

    <!-- Metis Menu Plugin JavaScript -->
    <script src="${ctx}/static/ol/js/plugins/metisMenu/metisMenu.min.js"></script>

    <!-- Custom Theme JavaScript -->
    <script src="${ctx}/static/ol/js/sb-admin-2.js"></script>
    


<sitemesh:head/>
</head>
<html>
<body data-color="grey" class="flat">
	<div id="wrapper">

		<%@ include file="/WEB-INF/ol/layouts/header.jsp"%>
	
			<sitemesh:body/>
	
		<%@ include file="/WEB-INF/ol/layouts/footer.jsp"%>
	</div>

	
	
</body>
</html>
