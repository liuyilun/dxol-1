<%@ page contentType="text/html;charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="ctx" value="${pageContext.request.contextPath}" />
<html>

<head>
<title>在线考试</title>

<link href="${ctx}/static/ol/css/plugins/TimeCircles.css"
	rel="stylesheet">
<script src="${ctx}/static/unicorn/js/bootbox.min.js"></script>
<style>
.red {
	color: red;
}
</style>
<script>
$(document).ready(function(){

setTimeout(a,"${sessionScope.warnTime}"); //2400秒后动作
function a()
{
	var message="还有5分钟了，请注意时间!"
	bootbox.alert(message);
}
});
setTimeout(autosubmit,"${sessionScope.autosmtTime}");
function autosubmit() {
	var message="时间已到，系统已经自动帮您提交!"
	alert(message);
	$("#inputForm").submit();
	
}
	function submitConfirm() {
		var message = "确定提交试卷吗？";
		bootbox.confirm(message, function(result) {
			if (result) {
				$("#inputForm").submit();
			}
		});
	}
	
	
	 
</script>
</head>
<body>
	<div class="container" id="wrapper">
		<div id="page-wrapper">
			<div class="row">
				<div class="col-lg-12" style="text-align: center;">
					<h1 class="page-header">在线考试</h1>
				</div>
			</div>
			<!-- /.col-lg-12 -->
			<div class="row">
				<div class="col-lg-8">
					<div class="panel panel-default">
						<div class="panel-heading">
							<h4>
								<strong class="red">请在规定时间内完成以下试题</strong>
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
											</p> <input type="radio" value="A" id="a_2" name="choice_<%=j%>" />&nbsp;<label
											for="a_2">A</label>&nbsp;&nbsp; <input type="radio" value="B"
											id="b_2" name="choice_<%=j%>" />&nbsp;<label for="b_2">B</label>&nbsp;&nbsp;
											<input type="radio" value="C" id="c_2" name="choice_<%=j%>" />&nbsp;<label
											for="c_2">C</label>&nbsp;&nbsp; <input type="radio" value="D"
											id="d_2" name="choice_<%=j%>" />&nbsp;<label for="d_2">D</label>&nbsp;&nbsp;</li>
										<input type="hidden" value="<%j++;%>" />
										<!-- <input type="text" id="time" name="someTimer1" value="" /> -->
									</c:forEach>
								</ul>
								<div align="center" class="form-actions">
									<input id="btnSubmit" class="btn btn-primary" type="button" onclick="submitConfirm()"
										value="交卷" />&nbsp; 
									<input id="cancel_btn" class="btn"
										type="button" value="取消" onclick="history.back()" />
								</div>
								 
							</form>

						</div>
					</div>
				</div>

			
               <section class="container">
               <div class="pinned">
				 <div class="col-lg-4">
				  	
					<div class="panel panel-success"  >
						<div class="panel-heading"><i class="fa fa-pie-chart fa-fw"></i>剩余时间</div>
							<div id="someTimer"  data-timer="${sessionScope.diffs}" style="width: 330px; margin: 0 auto;">
							</div>
					</div>
			   </div>
				</div>
			 </section>
			</div>
		</div>
	</div>
	
<script src="${ctx}/static/ol/css/plugins/TimeCircles.js"></script>
<script src="${ctx}/static/ol/js/jquery.pin.min.js"></script>
<script src="${ctx}/static/ol/js/jquery.pin.js"></script>
<script>
$(function() {
	$('.pinned').pin({
		containerSelector: ".container",
			minWidth: 940
	});
	$('#someTimer').TimeCircles({
		"animation": "smooth",
	    "bg_width": 0.2,
	    "fg_width": 0.023333333333333334,
	    "circle_bg_color": "#90989F",
	    "time": {
	        "Days": {
	            "text": "Days",
	            "color": "#40484F",
	            "show": false
	        },
	        "Hours": {
	            "text": "时",
	            "color": "#40484F",
	            "show": true
	        },
	        "Minutes": {
	            "text": "分",
	            "color": "#40484F",
	            "show": true
	        },
	        "Seconds": {
	            "text": "秒",
	            "color": "#40484F",
	            "show": true
	        }
	    }
	});
});
		
</script> 
</body>
</html>
