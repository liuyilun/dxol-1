<%@page import="dxol.entity.Student"%>
<%@ page contentType="text/html;charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="tags" tagdir="/WEB-INF/tags"%>
<%@ taglib prefix="shiro" uri="http://shiro.apache.org/tags"%>
<c:set var="ctx" value="${pageContext.request.contextPath}" />
<head>
<%-- <script src="${ctx}/static/unicorn/js/jquery.min.js"></script> --%>
<script src="${ctx}/static/unicorn/js/jquery.metadata.js"></script>
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
					remote : "${ctx}/admin/student/checkUserName",
					rangelength : [ 6, 20 ]
					
				}, 
			
				plainPassword : {
					required : true,
					minlength : 6
				},
				name : {
					required : true
				},
				depart : {
					required : true
				},
				sex:{
					required:true,
					min:0
				},
			 	role:{
					required:true,
					equalTo:"#std"
				}, 
				school_id:{
					required:true,
					min:1
				},
				identity_id:{
					required:true,
					min:1
				}
				/* repassword: {required:true,equalTo:"#password"}, */
			},
			messages : {
				username:{required:"用户名不能为空!"  ,remote:"用户名已经存在!",rangelength:jQuery.format("用户名位数必须在{0}到{1}字符之间!")}, 
				plainPassword: {required:"密码不能为空!",minlength:jQuery.format("密码位数必须大于等于6个字符!")},
				depart:{required:"专业不能为空!"},
				name:{required:"姓名不能为空!"},
				sex:{min:"性别不能为空，请选择"},
			    role:{equalTo:"角色不能为空，且只能选择学生，请选择"}, 
				school_id:{min:"学院不能为空，请选择"},
				identity_id:{min:"身份不能为空，请选择"}
				/*repassword: {required:"确认密码不能为空！",equalTo:"确认密码和密码不一致 */
			},
			errorClass: "help-inline"
		});
	});
</script>
</head>

<body data-color="grey" class="flat">
	<div id="content">
		<div id="content-header">
			<c:if test="${student.id==null}">
				<h1>添加学生</h1>
			</c:if>
			<c:if test="${student.id!=null}">
				<h1>修改学生</h1>
			</c:if>
		</div>
		<div id="breadcrumb">
			<a href="${ctx}/admin/success" title="Go to Home" class="tip-bottom"><i
				class="fa fa-home"></i> Home</a>
			<c:if test="${student.id==null}">
				<a href="#" class="current">添加学生</a>
			</c:if>
			<c:if test="${student.id!=null}">
				<a href="#" class="current">修改学生</a>
			</c:if>
		</div>
		<div class="row">
			<div class="col-xs-12">
				<div class="widget-box">
					<div class="widget-title">
						<span class="icon"> <i class="fa fa-align-justify"></i>
						</span>
						<h5>学生信息</h5>
						<!-- <span class="label label-danger">48 notices</span> -->
					</div>
					<div class="widget-content nopadding">
						<form id="inputForm"
							action="${ctx}/admin/student/save/${student.id}" method="post"
							class="form-horizontal">
							<input type="hidden" name="id" value="${student.id}" />
							<div class="form-group">
								<label class="col-sm-3 col-md-3 col-lg-2 control-label">用户名(学号)</label>
								<div class="col-sm-9 col-md-9 col-lg-10">
									<c:if test="${student.id==null}">
										<input type="text" class="form-control input-sm"	
											name="username" id="username" value="${student.username}">
									</c:if>
									<c:if test="${student.id!=null}">
										<td><input type="text" class="form-control input-sm" id="username1" name="username1"
											readonly="readonly" value="${student.username}" /></td>
									</c:if>
								</div>
							</div>
							
								
								<c:if test="${student.id==null}">
								<div class="form-group">
								<label class="col-sm-3 col-md-3 col-lg-2 control-label">密码</label>
								<div class="col-sm-9 col-md-9 col-lg-10">
									<input type="text" class="form-control input-sm"
										name="plainPassword" id="plainPassword"
										value="${student.plainPassword}">
								</div>
								</div>
								</c:if>
								
							
							<div class="form-group">
								<label class="col-sm-3 col-md-3 col-lg-2 control-label">姓名</label>
								<div class="col-sm-9 col-md-9 col-lg-10">
									<input type="text" class="form-control input-sm" name="name"
										id="name" value="${student.name}">

								</div>
							</div>
							<div class="form-group">
								<label class="col-sm-3 col-md-3 col-lg-2 control-label">性别</label>
								<div class="col-sm-9 col-md-9 col-lg-10">
									<!-- <input type="text" class="form-control input-sm" name="url"
										id="url"> -->
									<span style="font-size: 18px;"><select id="sex"
										name="sex">
											<option value="-1">======请选择性别======</option>
											<option value="1" <c:if test="${student.sex==1}">selected="selected"</c:if>>男</option>
											<option value="0" <c:if test="${student.sex==0}">selected="selected"</c:if>>女</option>
									</select> <script>
										form.sex.value = '${student.sex}';
									</script></span>
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
											<option id="std" value="student" <c:if test="${student.role=='student'}">selected="selected"</c:if>>学生</option>
											<option value="admin" <c:if test="${student.role=='admin'}">selected="selected"</c:if>>管理员</option>
									</select> <script>
										form.role.value = '${student.role}';
									</script></span>
								</div>
							</div>
							<div class="form-group">
								<label class="col-sm-3 col-md-3 col-lg-2 control-label">学院</label>
								<div class="col-sm-9 col-md-9 col-lg-10">
									<span style="font-size: 18px;"> <select id="school_id"
										name="school_id">
										<option value="-1">======请选择学院======</option>
											<c:forEach items="${schools}" var="school">
												<option value="${school.id }"
													<c:if test="${student.school.id==school.id}">
																<c:out value="selected"/>
																</c:if>>
													${school.name}</option>
											</c:forEach>
									</select></span>
								</div>
							</div>
							<div class="form-group">
								<label class="col-sm-3 col-md-3 col-lg-2 control-label">专业</label>
								<div class="col-sm-9 col-md-9 col-lg-10">
									<input type="text" class="form-control input-sm" name="depart"
										id="depart" value="${student.depart}">
								</div>
							</div>
							<div class="form-group">
								<label class="col-sm-3 col-md-3 col-lg-2 control-label">身份</label>
								<div class="col-sm-9 col-md-9 col-lg-10">
									<span style="font-size: 18px;"> <select id="identity_id"
										name="identity_id">
										<option value="-1">======请选择身份======</option>
											<c:forEach items="${identities}" var="identity">
												<option value="${identity.id }"
													<c:if test="${student.identity.id==identity.id}">
																<c:out value="selected"/>
																</c:if>>
													${identity.identityName}</option>
											</c:forEach>
									</select></span>
								</div>
							</div>

							<div class="form-actions">
								<!-- <input type="submit" value="Validate" class="btn btn-primary"> -->
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
