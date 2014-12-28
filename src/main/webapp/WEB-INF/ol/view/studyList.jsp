<%@ page contentType="text/html;charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="ctx" value="${pageContext.request.contextPath}" />
<c:set var="currentStudent" value="${sessionScope.currentStudent}" />
<!DOCTYPE html>
<html>

<head>

<link href="${ctx}/static/ol/css/plugins/jquery.circliful.css"
	rel="stylesheet">

</head>
<body>
	<div id="wrapper">
		<div id="page-wrapper">
			<div class="row">
				<div class="col-lg-12">
					<h1 class="page-header">课程列表:</h1>
				</div>
			</div>
			<div class="row">
				<div class="col-lg-9">
					<div class="panel panel-success">
						<div class="panel-heading">
							<h4>
								<strong>必修课程:</strong>
							</h4>
						</div>
						<div class="panel-body">
							<c:forEach items="${currentStudent.courses}" var="studentCourse">
								<c:if test="${studentCourse.course.reqAlt==1}">
									<ul>

										<a href="studycourse/view/${studentCourse.course.id}">
											<div>
												<p>
													<strong>${studentCourse.course.courseName}</strong> <span
														class="pull-right text-muted"><strong>${studentCourse.time }/${studentCourse.course.hour*45}</strong>
														分钟</span>
												</p>
												<div class="progress progress-striped active">
													<div class="progress-bar progress-bar-success"
														role="progressbar" aria-valuenow="40" aria-valuemin="0"
														aria-valuemax="100"
														style="width:${100*studentCourse.time/(studentCourse.course.hour*45)}%">
													</div>
												</div>
											</div>
										</a>
									</ul>
								</c:if>
							</c:forEach>
						</div>
					</div>
				</div>
			</div>
			<div class="row">
				<div class="col-lg-9">
					<div class="panel panel-info">
						<div class="panel-heading">
							<h4>
								<strong>选修课程:</strong>
							</h4>
						</div>
						<div class="panel-body">
							<c:forEach items="${currentStudent.courses}" var="studentCourse">
								<c:if test="${studentCourse.course.reqAlt==2}">
									<ul>

										<a href="studycourse/view/${studentCourse.course.id}">
											<div>
												<p>
													<strong>${studentCourse.course.courseName}</strong> <span
														class="pull-right text-muted"><strong>${studentCourse.time }/${studentCourse.course.hour*45}</strong>
														分钟</span>
												</p>
												<div class="progress progress-striped active">
													<div class="progress-bar progress-bar-info"
														role="progressbar" aria-valuenow="40" aria-valuemin="0"
														aria-valuemax="100"
														style="width:${100*studentCourse.time/(studentCourse.course.hour*45)}%">
													</div>
												</div>
											</div>
										</a>

									</ul>
								</c:if>
							</c:forEach>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</body>
</html>
