<%@ page contentType="text/html;charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="ctx" value="${pageContext.request.contextPath}" />
<html>

<head>
<title>在线考试</title>

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
						<div class="panel panel-<c:if test="${grade>=90}">success</c:if><c:if test="${grade<90}">danger</c:if>">
							<div class="panel-heading"><i class="fa  fa-info-circle fa-fw"></i>考试结果</div>
							<div class="panel-body">
							<c:if test="${grade>=90}">
								<h4>
									您的得分为${grade},恭喜您通过了考试!您的剩余考试机会为：${examTime}次!
								</h4>
							</c:if>
							<c:if test="${grade<90}">
								<h4 class="danger">
									您的得分为${grade},很抱歉,您未能通过考试,您的剩余考试机会为：${examTime}次!
								</h4>
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
