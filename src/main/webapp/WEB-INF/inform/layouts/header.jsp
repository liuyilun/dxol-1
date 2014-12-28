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
           <shiro:guest>  
               <li class="btn"><a title="" href="${ctx }/login"> <span class="text">登录</span></a></li>
			</shiro:guest>
			<shiro:user>  
               <li class="btn"><a title="" href="#"><i class="fa fa-user"></i> <span class="text">个人信息</span></a></li>
               <li class="btn"><a title="" href="${ctx}/logout"><i class="fa fa-share"></i> <span class="text">安全退出</span></a></li>
            </shiro:user>
           </ul>
    </div>
    <div id="sidebar">
		<ul>
			<li class="info_tab"><a href="${ctx}/inform"><i class="fa fa-info-circle"></i> <span>通知</span></a></li>
			<li class="help_tab"><a href="${ctx}/help"><i class="fa fa-question-circle"></i> <span>使用帮助</span></a></li>
		</ul>
	</div>
    
    