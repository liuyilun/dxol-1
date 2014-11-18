<%@ page contentType="text/html;charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="tags" tagdir="/WEB-INF/tags"%>

<c:set var="ctx" value="${pageContext.request.contextPath}" />
<head>
<script type="text/javascript">
	$(document).ready(function() {
		var message = "${message}" /* getUrlParam("message") */;
		if (message != null) {
			bootbox.alert(message);
		}
	})
	function getUrlParam(name) {
		var reg = new RegExp("(^|&)" + name + "=([^&]*)(&|$)"); //构造一个含有目标参数的正则表达式对象
		var r = window.location.search.substr(1).match(reg); //匹配目标参数
		if (r != null)
			return decodeURIComponent(r[2]);
		return null; //返回参数值
	}

	function deleteConfirm(id, name) {
		var message = "确认删除 <strong> " + name + "</strong> 吗？";
		bootbox.confirm(message, function(result) {
			if (result) {
				location.href = "${ctx}/student/delete/" + id;
			}
		});
		/*  	$("#alertMessage").html("确认删除 <strong> "+name+"</strong> 吗？");
		    	$("#confirmButton").attr("href","${ctx}/informAdmin/delete/"+id);
		        $('#myAlert').modal({
		    		backdrop:true,
		    		keyboard:true,
		    		show:true
				}); */
	}
	function success(message) {
		bootbox.prompt(message);

	}
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
						<!-- <span class="label label-danger">48 notices</span> -->
					</div>
					<div class="widget-content nopadding">
						<form id="basic_validate" action="${ctx}/manager/save/${admin.id}"
							method="post" class="form-horizontal" name="basic_validate"
							novalidate="novalidate">
							<input type="hidden" name="id" value="${admin.id}" />
							<div class="form-group">
								<label class="col-sm-3 col-md-3 col-lg-2 control-label">用户名</label>
								<div class="col-sm-9 col-md-9 col-lg-10">
									<input type="text" class="form-control input-sm"
										name="username" id="username" value="${admin.username}">
								</div>
							</div>
							<div class="form-group">
								<label class="col-sm-3 col-md-3 col-lg-2 control-label">密码</label>
								<div class="col-sm-9 col-md-9 col-lg-10">
									<input type="text" class="form-control input-sm"
										name="plainPassword" id="plainPassword"
										value="${admin.plainPassword}">
								</div>
							</div>
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
											<option value="student">学生</option>
											<option value="admin">管理员</option>
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




	
	<%-- <div id="content">
					<div id="content-header">
						<h1>添加管理员</h1>
					</div>
					<div id="breadcrumb">
						<a href="${ctx}/admin/success" title="Go to Home"
							class="tip-bottom"><i class="fa fa-home"></i> Home</a> <a
							href="#" class="current">添加管理员</a>
					</div>
					<div class="row">
						<div class="col-xs-12">

							<div class="widget-box">
								<div class="widget-title">
									<span class="icon"> <i class="fa fa-th"></i>
									</span>
									<h5>请输入管理员信息:</h5>
								</div>
								<div class="widget-content nopadding">
									<table
										class="table table-bordered table-striped table-hover data-table">
										<thead>
											<tr>
												<th>属性</th>
												<th align="left">内容</th>

											</tr>
										</thead>
										<tbody>
											<tr>
											
												<td align="right">用户名:</td>
												<td><input type="text" id="username" name="username"
													value="${admin.username}" /></td>
											</tr>
											<tr>
												<td align="right">密码:</td>
												<td><input type="text" id="plainPassword"
													name="plainPassword" class="input-large" value="${admin.plainPassword}"/></td>
											</tr>
											<tr>
												<td align="right">姓名:</td>
												<td><input type="text" id="name" name="name"
													value="${admin.name}" /></td>
											</tr>
											<tr>
												<td align="right">角色:</td>
												<td><span style="font-size: 18px;"><select
													id="role" name="role">
														<option value="student">学生</option>
														<option value="admin">管理员</option>
												</select> <script>
													form.role.value = '${admin.role}';
												</script></span></td>
												<td><input type="text" id="role" name="role"
													value="${admin.role}" /></td>
											</tr>
											<tr>
												<td align="right">所属学院:</td>
												<td><span style="font-size: 18px;"> <select
														id="school_id" name="school_id">
															<c:forEach items="${schools}" var="school">
																<option value="${school.id }"
																	<c:if test="${admin.school.id==school.id}">
																<c:out value="selected"/>
																</c:if>>
																	${school.name}</option>
															</c:forEach>
													</select></span></td>
												<td><input type="text" id="school" name="school.name"
													value="${admin.school.name}" /></td>
											</tr>

											<td style="width: 60%">${inform.title }</td>
											<td align="center">${inform.updateTime }</td>
											<tr>
												<td colspan=2 align="center"><input id="submit_btn"
													class="btn btn-primary" type="submit" value="保存" />&nbsp;
													<input id="cancel_btn" class="btn" type="button" value="返回"
													onclick="history.back()" /></td>
											</tr>

										</tbody>
									</table>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</fieldset>
	</form> --%>

	<script>
		/* $(document).ready(function() {
			//聚焦第一个输入框
			$("#username").focus();
			//为inputForm注册validate函数
			$("#basic_validate").validate();
		});
	 */

	<script src="${ctx}/static/unicorn/js/jquery.min.js"></script>
	<script src="${ctx}/static/unicorn/js/jquery-ui.custom.js"></script>
	<script src="${ctx}/static/unicorn/js/bootstrap.min.js"></script>
	<script src="${ctx}/static/unicorn/js/jquery.icheck.min.js"></script>
	<script src="${ctx}/static/unicorn/js/select2.min.js"></script>
	<script src="${ctx}/static/unicorn/js/jquery.validate.js"></script>
	<script src="${ctx}/static/unicorn/js/jquery.nicescroll.min.js"></script>
	<script src="${ctx}/static/unicorn/js/unicorn.js"></script>
	<script src="${ctx}/static/unicorn/js/unicorn.form_validation.js"></script>
    </script>
</body>
</html>
