<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="ctx" value="${pageContext.request.contextPath}"/>

	<head>
		<title>密码修改</title>
		
		<script type="text/javascript">
		$(document).ready(function(){
			$("#inputForm").validate();
		});
		</script>	
	</head>	
	<body >
	
			<div id="content">
				<div id="breadcrumb">
					<a href="#" title="Go to Home" class="tip-bottom"><i class="fa fa-home"></i> 首页</a>
					<a href="#" class="current">密码修改</a>
				</div>

				<div class="container-fluid">
				<div class="row">
					<div class="col-xs-12">
						<div class="widget-box">
							<div class="widget-title">
								<span class="icon">
									<i class="fa fa-pencil"></i>									
								</span>
								<h5>密码修改</h5>
							</div>
							<div class="widget-content nopadding">
								<form id= "inputForm"action="${ctx}/admin/profile" method="post" class="form-horizontal">
									<input type="hidden"name="id" value="${admin.id }"/>
									<div class="form-group">
										<label class="col-sm-3 col-md-3 col-lg-2 control-label">用户名：</label>
										<div class="col-sm-9 col-md-9 col-lg-10">
											<input type="text" disabled="disabled"class="input-large" name="title" id="title" value="${admin.username }"/>
										</div>
										<label class="col-sm-3 col-md-3 col-lg-2 control-label">新密码：</label>
										<div class="col-sm-9 col-md-9 col-lg-10">
											<input type="password" id="plainPassword" name="plainPassword" class="input-large" placeholder="...如果不修改请置空"/>
										</div>
										<div class="control-group">
										<label class="col-sm-3 col-md-3 col-lg-2 control-label">确认密码：</label>
										<div class="col-sm-9 col-md-9 col-lg-10">
											<input type="password" id="confirmPassword" name="confirmPassword" class="input-large" equalTo="#plainPassword" />
										</div>
									</div>
									<div class="form-actions">
										<button type="submit" class="btn btn-primary btn-sm">保存</button>&nbsp;&nbsp; &nbsp; <a class="text-danger" onclick="history.back()" href="#">取消</a>
									</div>
								</form>
							</div>
						</div>						
					</div>
				</div>
			</div>
			</div>
	</body>

