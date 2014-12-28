<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="tags" tagdir="/WEB-INF/tags"%>
<c:set var="ctx" value="${pageContext.request.contextPath}" />
<html>
<head>
<title>通知</title>
<script type="text/javascript">
$(document).ready(function(){
	$(".info_tab").addClass("active");
});
</script>
</head>
<body data-color="grey" class="flat">
	<div id="wrapper">
		<div id="content">
			<div id="content-header">
				<h1>通知</h1>
			</div>
			<div id="breadcrumb">
				<a class="tip-bottom"><i class="fa fa-list-ul"></i> 查看通知</a> 
			</div>
			<div class="container">
			<div class="row clearfix">
			<div class="col-md-2 column"></div>
				<div class="col-md-8 column">
					<div class="page-header">
						<h2 align="center">
							${inform.title }<br> <small>发布时间：${inform.updateTime}</small>
						</h2>
					</div>
				
					<p>
						${inform.content }
					</p>
					
				</div>
			</div>
		</div>
			
		</div>
	</div>

</body>
</html>