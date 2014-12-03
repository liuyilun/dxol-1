<%@ page contentType="text/html;charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="tags" tagdir="/WEB-INF/tags"%>

<c:set var="ctx" value="${pageContext.request.contextPath}" />
<head>
<style>
.help-inline{
color:red;
}
</style>
<script>
	$(document).ready(function() {
		//聚焦第一个输入框
		$("#username").focus();
		//为inputForm注册validate函数
		$("#inputForm").validate({
			rules : {
				username : {
					required : true,
					remote : "${ctx}/admin/manager/checkUserName",
					rangelength : [ 6, 20 ]
					
				},
				plainPassword : {
					required : true,
					minlength : 6
				},
				name:{
					required:true		
				},
				role:{
					equalTo:"#adm"
				},
				school_id:{
					min:1
				}
				/* repassword: {required:true,equalTo:"#password"}, */
			},
			messages : {
				username:{required:"用户名不能为空!"  ,remote:"用户名已经存在!",rangelength:jQuery.format("用户名位数必须在{0}到{1}字符之间!")},
				plainPassword: {required:"密码不能为空!",minlength:jQuery.format("密码位数必须大于等于6个字符!")},
				/*repassword: {required:"确认密码不能为空！",equalTo:"确认密码和密码不一致 */
				name:{required:"姓名不能为空!"},
				role:{equalTo:"角色不能为空，且只能选择管理员，请选择"},
				school_id:{min:"学院不能为空!"}
			},
			errorClass: "help-inline"
		});
	});
</script>
</head>

<body data-color="grey" class="flat">




	<c:if test="${not empty message}">
		success(message);
	</c:if>
	<div id="content">
		<div id="content-header">
			<c:if test="${admin.id==null}">
				<h1>添加管理员</h1>
			</c:if>
			<c:if test="${admin.id!=null}">
				<h1>修改管理员</h1>
			</c:if>
			<!-- <div class="btn-group">
				<a class="btn" title="Manage Files"><i class="fa fa-file"></i></a> <a
					class="btn" title="Manage Users"><i class="fa fa-user"></i></a> <a
					class="btn" title="Manage Comments"><i class="fa fa-comment"></i><span
					class="label label-danger">5</span></a> <a class="btn"
					title="Manage Orders"><i class="fa fa-shopping-cart"></i></a>
			</div> -->
		</div>
		<div id="breadcrumb">
			<a href="${ctx}/admin/success" title="Go to Home" class="tip-bottom"><i
				class="fa fa-home"></i> Home</a>
			<c:if test="${admin.id==null}">
				<a href="#" class="current">添加管理员</a>
			</c:if>
			<c:if test="${admin.id!=null}">
				<a href="#" class="current">修改管理员</a>
			</c:if>
		</div>
		<div class="row">
			<div class="col-xs-12">
				<div class="widget-box">
					<div class="widget-title">
						<span class="icon"> <i class="fa fa-align-justify"></i>
						</span>
						<h5>管理员信息</h5>
					</div>
					<div class="widget-content nopadding">
						<form id="inputForm" action="${ctx}/admin/manager/save/${admin.id}"
							method="post" class="form-horizontal">
							<input type="hidden" name="id" value="${admin.id}" />
							<div class="form-group">
								<label class="col-sm-3 col-md-3 col-lg-2 control-label">用户名</label>
								<div class="col-sm-9 col-md-9 col-lg-10">
								<c:if test="${admin.id==null}">
									<input type="text" class="form-control input-sm"
										name="username" id="username" value="${admin.username}">
								</c:if>
								<c:if test="${admin.id!=null}">
									<input type="text" class="form-control input-sm"
										name="username1" id="username1" value="${admin.username}" readonly="readonly">
								</c:if>
								</div>
							</div>
							
							<c:if test="${admin.id==null}">
							<div class="form-group">
								<label class="col-sm-3 col-md-3 col-lg-2 control-label">密码</label>
								<div class="col-sm-9 col-md-9 col-lg-10">
									<input type="text" class="form-control input-sm"
										name="plainPassword" id="plainPassword"
										value="${admin.plainPassword}">
								</div>
								</div>
							</c:if>
							
							<div class="form-group">
								<label class="col-sm-3 col-md-3 col-lg-2 control-label">姓名</label>
								<div class="col-sm-9 col-md-9 col-lg-10">
									<input type="text" class="form-control input-sm" name="name"
										id="name" value="${admin.name}">
								</div>
							</div>
							<div class="form-group">
								<label class="col-sm-3 col-md-3 col-lg-2 control-label">角色</label>
								<div class="col-sm-9 col-md-9 col-lg-10">
									<%-- <input type="text" class="form-control input-sm" name="name"
										id="name" value="${student.name}"> --%>
									<span style="font-size: 18px;"><select id="role"
										name="role">
											<option value="1">======请选择角色======</option>
											<option value="student" <c:if test="${admin.role=='student'}">selected="selected"</c:if>>学生</option>
											<option id="adm" value="admin" <c:if test="${admin.role=='admin'}">selected="selected"</c:if>>管理员</option>
									</select> <script>
										form.role.value = '${admin.role}';
									</script></span>
								</div>
							</div>
							<div class="form-group">
								<label class="col-sm-3 col-md-3 col-lg-2 control-label">所属学院</label>
								<div class="col-sm-9 col-md-9 col-lg-10">
									<span style="font-size: 18px;"> <select id="school_id"
										name="school_id">
										<option value="0">======请选择学院======</option>
											<c:forEach items="${schools}" var="school">
												<option value="${school.id }"
													<c:if test="${admin.school.id==school.id}">
																<c:out value="selected"/>
																</c:if>>
													${school.name}</option>
											</c:forEach>
									</select></span>
								</div>
							</div>
							<div class="form-actions">
								<input id="submit_btn" class="btn btn-primary" type="submit"
									value="保存" />&nbsp; <input id="cancel_btn" class="btn"
									type="button" value="返回" onclick="history.back()" />
							</div>
						</form>
					</div>
				</div>
			</div>
		</div>
	</div>
</body>
</html>
