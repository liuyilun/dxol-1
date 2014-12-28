<%@ page language="java" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="shiro" uri="http://shiro.apache.org/tags" %>
<c:set var="ctx" value="${pageContext.request.contextPath}"/>


<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>在线帮助</title>
</head>
<body>
	
	<div id="wrapper">
		<div id="content">
			<div id="content-header">
				<h1>帮助文档</h1>
			</div>

			<div class="container">
				<div class="row clearfix">
					<div class="widget-box">
					<div class="widget-content ">
		            <div id="intent">
			     <h3>1:浏览器使用及目的：</h3>
			      <span>
			      <h4>1)：推荐使用IE10级别以上，或者Chrome浏览器。</h4><br> 
			            2)：借助党校学习平台，各学院组织部可以减少积极分子、预备党员课堂培训的时间;能够组织学生在线考试、在线提交学习心得提交;通过用户管理、权限分配、信息发布、在线监控等方式管理学员的在线学习活动。<br> 
				        3)：借助党校学习平台教师能够上传文档资料供学生课外学习。借助党校学习平台学生可以实现在线学习、在线提交电子档案，在线提交学习心得。 <br> 
				 </span>
		   </div>
		   <div id="introduction">
			 <h3>2:学习系统的介绍:</h3>
			 <div >
			<h4>1:进入页面，首先是各项学习的结果和个人信息的展示，让学生可以明显看到自己学习的状态。(如下图所示) </h4> 
			 <img alt="首页" src="${ctx}/static/images/index.jpg"><br>
			</div>
			<div class="widget-content ">
			<h4>2:点击在线学习，进入了课程的学习，分为必修和选修两部分，课程会同时显示该课程的当前学习进度，方便学生了解掌握整体的进度。(如下图所示)</h4>
				<img alt="课程页面" src="${ctx}/static/images/studylist.png"><br>
			</div>	
			<div id="introduction">
			<h4>3:点击选择的课程，就会进入该课程的学习页面，右边的计时器就会记录学习的时长，且在结束课程的时，一定要点击"结束本次学习"按钮，否则无法记录学习时间。(如下图所示)</h4>
			 <img alt="结束课程页面" src="${ctx}/static/images/coursestudy.png"><br>
			 <div id="introduction">
			   <h4>4:课程结束后，会在课程下方显示已经完成的进度(如下图所示)</h4>
			  <img alt="结束课程页面" src="${ctx}/static/images/DoneClass.png"><br>
			  </div>
			  <div id="introduction">
			  <h4>5:点击在线考试，就会进入课程的考试页面，如果没学完规定的课时，则无法考试。(如下图所示)</h4>
			  <img alt="学习页面" src="${ctx}/static/images/coursestudy.png"><br>
			  </div>
			  <div id="introduction">
			  <h4>6:如果完成所有学业课时，则会出现以下页面进行考试。(如下图所示)</h4>
			  <img alt="学习页面" src="${ctx}/static/images/examing.jpg"><br>
			  </div>
			  <div id="introduction">
			   <h4>7:考试完毕之后，会有相应的得分和剩余考试次数！(如下图所示)</h4>
			  <img alt="学习页面" src="${ctx}/static/images/ExamResult.png"><br>
			  </div>
			   <div id="introduction">
			   <h4>8:在完成一定的学习和考试，会显示如下的页面！(如下图所示)</h4>
			  <img alt="学习页面" src="${ctx}/static/images/someStudy.png"><br>
			  </div>
		         </div>
	            </div>
				</div>
			</div>
		</div>	
	</div>
</div>
</body>
</html>