<%@ page contentType="text/html;charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="ctx" value="${pageContext.request.contextPath}" />
<html>

<head>
<title>在线考试</title>

<link href="${ctx}/static/ol/css/plugins/jquery.circliful.css"
	rel="stylesheet">
	<link href="${ctx}/static/ol/css/plugins/TimeCircles.css"
	rel="stylesheet">
<link href="http://libs.baidu.com/bootstrap/3.0.3/css/bootstrap.min.css"
	rel="stylesheet">
<script src="http://libs.baidu.com/jquery/2.0.0/jquery.min.js"></script>
<script src="http://libs.baidu.com/bootstrap/3.0.3/js/bootstrap.min.js"></script>
<style>
.red {
	color: red;
}
</style>
</head>
<body>
	<div id="wrapper">
		<div id="page-wrapper">
			<div class="row">
				<div class="col-lg-12">
					<h1 class="page-header">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
						&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;在线考试</h1>
				</div>
			</div>
			<!-- /.col-lg-12 -->
			<div class="row">
				<div class="col-lg-8">
					<div class="panel panel-default">
						<div class="panel-heading">
							<h4>
								<i class="red">请在规定时间内完成以下试题</i>
							</h4>
							<form id="inputForm" action="${ctx}/ol/test/check" method="post"
								class="form-horizontal">
								<%
									int i = 0;
									int j = 0;
								%>
								<ul class="list-group">
									<c:forEach items="${list}" var="examinfo">
										<li class="list-group-item"><h4>
												<b><%=++i%>、${examinfo.questionInfo}</b>
											</h4> <br />
											<p>
												A、${examinfo.choiceA}<br />
											</p>
											<p>
												B、${examinfo.choiceB}<br />
											</p>
											<p>
												C、${examinfo.choiceC}<br />
											</p>
											<p>
												D、${examinfo.choiceD}<br />
											</p> 
											<input type="radio" value="A" id="a_2" name="choice_<%=j%>" />&nbsp;<label
											for="a_2">A</label>&nbsp;&nbsp; 
											<input type="radio" value="B"
											id="b_2" name="choice_<%=j%>" />&nbsp;<label for="b_2">B</label>&nbsp;&nbsp;
											<input type="radio" value="C" id="c_2" name="choice_<%=j%>" />&nbsp;<label
											for="c_2">C</label>&nbsp;&nbsp; 
											<input type="radio" value="D"
											id="d_2" name="choice_<%=j%>" />&nbsp;<label for="d_2">D</label>&nbsp;&nbsp;</li>
										<input type="hidden" value="<%j++;%>" />
										<input type="hidden" id="time" name="someTimer" value="" />
									</c:forEach>
								</ul>
								<div align="center" class="form-actions">
									<input id="submit_btn" class="btn btn-primary" type="submit"
										value="交卷" />&nbsp; <input id="cancel_btn" class="btn"
										type="button" value="取消" onclick="history.back()" />
								</div>

							</form>

						</div>
					</div>
				</div>

				<div class="col-lg-4">
					<div class="panel panel-default">
						<div class="panel-heading">
							<div class="someTimer" data-timer="2700"
								style="width: 330px; margin: 0 auto;">
							</div>

							<div style="text-align: center;">
								<button class="start">开始</button>
								<button class="stop">停止</button>
								<button class="destroy">清除</button>
							</div>
							<ul class="list-group">
							<i class="list-group-item"><h3 align="center"><b>剩余时间</b></h3> 
							<script src="${ctx}/static/ol/css/plugins/jquery-1.7.2.min.js">	
							</script> <script src="${ctx}/static/ol/css/plugins/TimeCircles.js"></script> <script>
										$(function() {
											$("#time").val("$('data-timer').val()")
											$('.someTimer').TimeCircles({
												time : {
													Days : {
														show : true,
														text : "天",
														color : "#FC6"
													},
													Hours : {
														show : true,
														text : "时",
														color : "#9CF"
													},
													Minutes : {
														show : true,
														text : "分",
														color : "#BFB"
													},
													Seconds : {
														show : true,
														text : "秒",
														color : "#F99"
													}
												}
											});

											$('.stop').click(
													function() {
														$('.someTimer')
																.TimeCircles()
																.stop();
													});

											$('.start').click(
													function() {
														$('.someTimer')
																.TimeCircles()
																.start();
													});

											$('.destroy').click(
													function() {
														$('.someTimer')
																.TimeCircles()
																.destroy();
													});
										});
									</script>
						

						</i>
						</ul>

					</div>
				</div>
			</div>
		</div>
	</div>
	</div>
</body>
</html>
