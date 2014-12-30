<%@ page language="java" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="shiro" uri="http://shiro.apache.org/tags" %>
<c:set var="ctx" value="${pageContext.request.contextPath}"/>

	<div id="header">
		<h1><a href="#">.</a></h1>	
		<a id="menu-trigger" href="#"><i class="fa fa-bars"></i></a>				
	</div>

	<div id="user-nav">
           <ul class="btn-group">
               <li class="btn" ><a title="" href="${ctx}/admin/profile"><i class="fa fa-user"></i> <span class="text">个人信息</span></a></li>
               <li class="btn"><a title="" href="${ctx}/logout"><i class="fa fa-share"></i> <span class="text">安全退出</span></a></li>
           </ul>
    </div>
    
    <div id="sidebar">
	    <div id="search">
				
		</div>
			<ul>
				<li class="student_tab"><a href="${ctx}/admin/student"><i class="fa fa-home"></i> <span>学生管理</span></a></li>
    		<shiro:user>
			<shiro:hasRole name="super">
				<li class="course_tab"><a href="${ctx}/admin/course"><i
						class="fa fa-list fa-fw"></i> <span>课程管理</span></a></li>
				<li class="exams_tab"><a href="${ctx}/admin/examinfo"><i
						class="fa fa-pencil fa-fw"></i> <span>考试管理</span></a></li>
				<li class="admin_tab"><a href="${ctx}/admin/manager"><i
						class="fa fa-user fa-fw"></i> <span>管理员管理</span></a></li>
				<li class="inform_tab"><a href="${ctx}/admin/informAdmin"><i
						class="fa fa-info-circle fa-fw"></i> <span>通知管理</span></a></li>
			</shiro:hasRole>
		</shiro:user>
			</ul>
			
	</div>

	
