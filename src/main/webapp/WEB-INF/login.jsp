<%@ page contentType="text/html;charset=UTF-8"%>
<%@ taglib prefix="sitemesh" uri="http://www.opensymphony.com/sitemesh/decorator" %>  
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<c:set var="ctx" value="${pageContext.request.contextPath}" />


<!DOCTYPE html>
<html>
    <head>
        <title>Unicorn Admin</title>
		<meta charset="UTF-8" />
        <meta name="viewport" content="width=device-width, initial-scale=1.0" />
		<link rel="stylesheet" href="${ctx}/static/unicorn/css/bootstrap.min.css" />
        <link rel="stylesheet" href="${ctx}/static/unicorn/css/font-awesome.css" />
        <link rel="stylesheet" href="${ctx}/static/unicorn/css/unicorn-login.css" />
    		<script type="text/javascript" src="${ctx}/static/unicorn/js/respond.min.js"></script>
</head>   
<body>
        <div id="container">
            <div id="logo">
                <img src="${ctx}/static/unicorn/img/logo.png" alt="" />
            </div>
         
            <div id="loginbox">            
                <form id="loginform" action="${ctx}/login" method="post">
                	<input type="text" hidden="true" name="method" id="method" value="student"/>
    				<p>请输入学生用户名和密码：</p>
                    <div class="input-group input-sm">
                        <span class="input-group-addon"><i class="fa fa-user"></i></span><input class="form-control" type="text" id="username" name="username" placeholder="Username" />
                    </div>
                    <div class="input-group">
                        <span class="input-group-addon"><i class="fa fa-lock"></i></span><input class="form-control" type="password" id="password" name="password" placeholder="Password" />
                    </div>
                    <div class="form-actions clearfix">
                        <div class="pull-left">
                            <a href="#adminform" class="flip-link to-admin grey">管理员登陆</a>
                        </div>
                        <div class="pull-right">
                            <a href="${ctx }/inform" class="blue">通知/帮助</a>
                        </div>
                        <input type="submit" class="btn btn-block btn-primary btn-default" value="登陆" />
                    </div>
                </form>

                <form id="adminform" action="${ctx}/login" method="post">
                	<input type="text" hidden="true" name="method" id="method" value="admin"/>
                    <p>请输入管理员用户名和密码：</p>
	                    <div class="input-group input-sm">
	                        <span class="input-group-addon"><i class="fa fa-user"></i></span><input class="form-control" type="text" id="username" name="username" placeholder="Username" />
	                    </div>
	                    <div class="input-group">
	                        <span class="input-group-addon"><i class="fa fa-lock"></i></span><input class="form-control" type="password" id="password" name="password" placeholder="Password" />
	                    </div>
 						<div class="form-actions clearfix">
		                    <div class="pull-left">
		                     <a href="#loginform" class="flip-link to-login grey">学生登陆</a>
		                     </div>
                        	<input type="submit" class="btn btn-block btn-success" value="登陆" />
                        </div>
                </form>
            </div>
            </div>
        </div>
        
        <script src="${ctx}/static/unicorn/js/jquery.min.js"></script>  
        <script src="${ctx}/static/unicorn/js/jquery-ui.custom.min.js"></script>
        <script src="${ctx}/static/unicorn/js/unicorn.login.js"></script> 
    </body>
</html>
