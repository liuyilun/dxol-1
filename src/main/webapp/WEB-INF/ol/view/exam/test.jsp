<%@ page contentType="text/html;charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="ctx" value="${pageContext.request.contextPath}" />
<html>

<head>
<title>在线考试</title>

<link href="${ctx}/static/ol/css/plugins/jquery.circliful.css"
	rel="stylesheet">
 <link href="http://libs.baidu.com/bootstrap/3.0.3/css/bootstrap.min.css"
	rel="stylesheet">
<script src="http://libs.baidu.com/jquery/2.0.0/jquery.min.js"></script>
<script src="http://libs.baidu.com/bootstrap/3.0.3/js/bootstrap.min.js"></script> 
<script src="${ctx}/static/unicorn/js/bootbox.min.js"></script> 
<style>
.exam{
color:red;
}
</style>
</head>

<body>
	<div id="wrapper">
		<div id="page-wrapper">
			<div class="row">
				<div class="col-lg-12">
					<h1 class="page-header">在线考试</h1>
				</div>
				<!-- /.col-lg-12 -->
				<div class="row">
					<div class="col-lg-8">
						<div class="panel panel-default">
							<div class="panel-heading">
								<h3><i class="exam">很抱歉，您的课程还没有学习完，暂时不能参加考试哦!</i></h3>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>

</body>
</html>
