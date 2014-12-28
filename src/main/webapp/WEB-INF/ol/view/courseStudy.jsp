<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<c:set var="ctx" value="${pageContext.request.contextPath}" />
<html>

<head>
<title>在线考试</title>
<link href="${ctx}/static/ol/css/plugins/TimeCircles.css" rel="stylesheet">	
</head>
<body>
	<div id="wrapper">
		<div id="page-wrapper">
			<div class="row">
				<div class="col-lg-12">
					<h2 class="page-header">在线学习</h2>
				</div>
			</div>
			<!-- /.col-lg-12 -->
			<div class="row">
				<div class="col-lg-8">
					<div class="panel panel-info">
						<div class="panel-heading">
							<i class="fa fa-file-text-o fa-fw"></i>
							<strong>${currentCourse.courseName}</strong>
						</div>
						<div class="panel-body">
							<div>
								<div style="white-space:normal;">
									<strong>课程内容：</strong> <br>${currentCourse.content}
								</div>
							</div>
						</div>
					</div>
				</div>
				
				<div class="pinned">
				<div class="col-lg-4">
					<div class="panel panel-success">
						<div class="panel-heading"><i class="fa fa-clock-o fa-fw"></i>本次学习时间</div>
							<div id="someTimer"style="width: 330px; margin: 0 auto;" data-date="<fmt:formatDate value="${currenttime}" pattern="yyyy-MM-dd HH:mm:ss"/>">
						</div>
						<div style="text-align: center;">
							<button id="button" type="button" onclick="finish()">结束本次学习</button>
						</div>
						
					</div>	
					</div>
				</div>
				<%
					int i = 0;
					int j = 0;
				%>
				<div class="col-lg-8" id="none" style="display:none">
					<div class="panel panel-default">
						<div class="panel-heading">
							<h3>
								<strong>课后练习题</strong>
							</h3>
						</div>
						<div class="panel-body">
							<div>
							<form id="inputForm" action="${ctx}/ol/studycourse/check" method="post"
								class="form-horizontal">
								<div style="white-space: normal;">
									<ul class="list-group">
									 	<c:forEach items="${currentCourse.examinfos}" var="examinfo">
											<li class="list-group-item"><h4><b><%=++i%>、${examinfo.questionInfo}
											</b></h4> <br />
												<p>A、${examinfo.choiceA}<br /></p>
												<p>B、${examinfo.choiceB}<br /></p>
												<p>C、${examinfo.choiceC}<br /></p>
												<p>D、${examinfo.choiceD}<br /></p>
												<input type="radio" value="A" id="a_2" name="choice_<%=j%>" />&nbsp;<label for="a_2">A</label>&nbsp;&nbsp; 
												<input type="radio" value="B" id="b_2" name="choice_<%=j%>" />&nbsp;<label for="b_2">B</label>&nbsp;&nbsp;
												<input type="radio" value="C" id="c_2" name="choice_<%=j%>" />&nbsp;<label for="c_2">C</label>&nbsp;&nbsp; 
												<input type="radio" value="D" id="d_2" name="choice_<%=j%>" />&nbsp;<label for="d_2">D</label>&nbsp;&nbsp;</li>
												<div id="answer_<%=j%>"></div>
												<input type="hidden" value="<%j++;%>" />
										</c:forEach>
									</ul>
									<div align="center" class="form-actions">
										<input id="btnSubmit" class="btn btn-primary" type="button"
											onclick="check()" value="交卷" />&nbsp; <input
											id="cancel_btn" class="btn" type="button" value="取消"
											onclick="history.back()" />
									</div>
								</div>
							</form>
							</div>
						</div>
					</div>
				</div>
		</div>
	</div>
</div>

	<script src="${ctx}/static/ol/css/plugins/TimeCircles.js"></script>
	<script src="${ctx}/static/unicorn/js/bootbox.min.js"></script>
	<script src="${ctx}/static/ol/js/jquery.pin.js"></script>
	<script>
	$(function() {
		$(".pinned").pin();
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
	$(document).ready(updateMsg);
	function updateMsg() {
		$.get("${ctx}/ol/studycourse/update",function(res){
			if(res  == "finish"){
				bootbox.alert("本课程学习已完成，点击 OK完成课后习题，不完成习题将无法参加最后考试!"/* ,function(){
					window.location.href = "${ctx}/ol/studycourse"; 
				}*/);
				
				$("div[id=none]").css({"display":"inline"});
				/* $("#button").attr('disabled',true); */
			}
			else if(res=="allfinish")
				bootbox.alert("本课程学习已完成，课后习题也已完成，点击OK学习其他课程!",function(){
						window.location.href = "${ctx}/ol/studycourse"; 
				});
		});
	    //每隔10分钟，读取一次.
	    setTimeout('updateMsg()', 1*60*1000);
	}
	function finish(){
		location.href="${ctx}/ol/studycourse/finish";
	}
	function check(){
		/* $.get("${ctx}/ol/studycourse/check",function(res){
			if(res){
				$("div[id=answer]").append(res);
			}
		}); */
		var j=0;
		 $.ajax({
             url:"${ctx}/ol/studycourse/check",
             data:$("#inputForm").serialize(),
             type:"post",
             dataType:"json",
             success:function(res){//ajax返回的数据
            	 if(res){
            		 for(j=0;j<5;j++){
            			 if(res[j]=="错误"){
            				$("div[id=answer_"+j+"]").css({"color":"red"});
     						$("div[id=answer_"+j+"]").append(res[j]+"<div></div>"+"正确答案为："+res[j+5]);	
            			 }
            			 else{
            				 $("div[id=answer_"+j+"]").css({"color":"green"});
            				 $("div[id=answer_"+j+"]").append(res[j]);
            			 }
            		}
     			}
             }
        });     
	}

</script>
</body>
</html>
