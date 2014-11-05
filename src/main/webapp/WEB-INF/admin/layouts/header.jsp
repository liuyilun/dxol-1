<%@ page language="java" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="shiro" uri="http://shiro.apache.org/tags" %>
<c:set var="ctx" value="${pageContext.request.contextPath}"/>
<div id="header">
	<div id="header">
		<h1><a href="#">.</a></h1>	
		<a id="menu-trigger" href="#"><i class="fa fa-bars"></i></a>	
	</div>

	<div id="user-nav">
           <ul class="btn-group">
               <li class="btn" ><a title="" href="#"><i class="fa fa-user"></i> <span class="text">个人信息</span></a></li>
               <li class="btn"><a title="" href="login.html"><i class="fa fa-share"></i> <span class="text">安全退出</span></a></li>
           </ul>
    </div>
    
    <div id="sidebar">
    <div id="search">
					<input type="text" placeholder="Search here..."><button type="submit" class="tip-right" title="" data-original-title="Search"><i class="fa fa-search"></i></button>
	</div>
      <shiro:user>
			<ul>
				<li class="active"><a href="index.html"><i class="fa fa-home"></i> <span>学生管理</span></a></li>
				<shiro:hasRole name="super">
				<li><a href="tables.html"><i class="fa fa-th"></i> <span>课程管理</span></a></li>
				<li><a href="grid.html"><i class="fa fa-th-list"></i> <span>管理员管理</span></a></li>
				<li><a href="grid.html"><i class="fa fa-th-list"></i> <span>通知管理</span></a></li>
				</shiro:hasRole>	
				
			</ul>
		</shiro:user>
			
	</div>

	<!-- 
	
	<div id="title">
	    <h1><a href="${ctx}">QuickStart示例</a><small>--TodoList应用演示</small>
	    <shiro:user>
			<div class="btn-group pull-right">
				<a class="btn dropdown-toggle" data-toggle="dropdown" href="#">
					<i class="icon-user"></i> <shiro:principal property="name"/>
					<span class="caret"></span>
				</a>
			
				<ul class="dropdown-menu">
					<shiro:hasRole name="admin">
						<li><a href="${ctx}/admin/user">Admin Users</a></li>
						<li class="divider"></li>
					</shiro:hasRole>
					<li><a href="${ctx}/api">APIs</a></li>
					<li><a href="${ctx}/profile">Edit Profile</a></li>
					<li><a href="${ctx}/logout">Logout</a></li>
				</ul>
			</div>
		</shiro:user>
		</h1>
	</div>
	 -->
</div>