<%@ page contentType="text/html;charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="ctx" value="${pageContext.request.contextPath}" />
<html>

<head>
<title>考试结果</title>

<link href="${ctx}/static/ol/css/plugins/jquery.circliful.css"
	rel="stylesheet">
<link href="http://libs.baidu.com/bootstrap/3.0.3/css/bootstrap.min.css"
	rel="stylesheet">
<script src="http://libs.baidu.com/jquery/2.0.0/jquery.min.js"></script>
<script src="http://libs.baidu.com/bootstrap/3.0.3/js/bootstrap.min.js"></script>
<script src="${ctx}/static/unicorn/js/bootbox.min.js"></script>
<style>
.exam {
	color: green;
}
.red{
	color:red;
}
</style>
</head>

<body>
	<div id="wrapper">
		<div id="page-wrapper">
			<div class="row">
				<div class="col-lg-12">
					<h1 class="page-header">考试结果</h1>
				</div>
				<!-- /.col-lg-12 -->
				<div class="row">
					<div class="col-lg-8">
						<div class="panel panel-default">
							<div class="panel-heading">
							<c:if test="${grade>=90}">
							<c:if test="${examTime>0}">
								<h3>
									<i class="exam">您的得分为${grade},恭喜您通过了考试!您还有${examTime}次考试机会，可以用来刷分哦!</i>
								</h3>
							</c:if>
							<c:if test="${examTime<=0}">
							<h3>
									<i class="exam">您的得分为${grade},恭喜您通过了该阶段的考试，您的考试机会用完了，不能进行刷分了哦!</i>
								</h3>
							</c:if>
							</c:if>
							<c:if test="${grade<90}">
								<c:if test="${examTime>0}">
								<h3>
									<i class="red">您的得分为${grade},很抱歉,您未能通过考试,您还有${examTime}次考试机会,请再接再厉!</i>
								</h3>
								</c:if>
								<c:if test="${examTime<=0}">
								<h3>
									<i class="red">您的得分为${grade},很抱歉,您未能通过考试,您还有${examTime}次考试机会!</i>
								</h3>
								</c:if>
							</c:if>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>

</body>
</html>
