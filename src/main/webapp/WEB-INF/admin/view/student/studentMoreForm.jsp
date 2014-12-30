<%@page import="dxol.entity.Student"%>
<%@ page contentType="text/html;charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="tags" tagdir="/WEB-INF/tags"%>
<%@ taglib prefix="shiro" uri="http://shiro.apache.org/tags"%>
<c:set var="ctx" value="${pageContext.request.contextPath}" />
<head>
<script src="${ctx}/static/unicorn/js/jquery.metadata.js"></script>
</head>

<body data-color="grey" class="flat">
	<div id="content">
		<div id="content-header">
			<h1>批量添加学生</h1>
		</div>
		<div id="breadcrumb">
			<a href="${ctx}/admin/success" class="tip-bottom"><i
				class="fa fa-home"></i> 首页</a> <a href="#" class="current">批量添加学生</a>
		</div>
		<div class="row">
			<div class="col-xs-12">
				<div class="alert alert-danger">
					<strong>请注意！ </strong> 上传文件的格式请务必严格按照<strong> <a href="${ctx}/admin/help" class="text-danger">使用说明</a> </strong>中要求的格式填写！
				</div>

				<div class="widget-box">
					<div class="widget-title">
						<span class="icon"> <i class="fa fa-align-justify"></i>
						</span>
						<h5>批量上传</h5>
						<!-- <span class="label label-danger">48 notices</span> -->
					</div>
					<div class="widget-content nopadding">
						<form id="inputForm" action="${ctx}/admin/student/saveMore"
							enctype="multipart/form-data" method="post"
							class="form-horizontal">
							<div class="form-group">
								<label class="col-sm-4 col-md-4 col-lg-3 control-label">请选择学生信息的Excel文件：</label>
								<div class="col-sm-8 col-md-8 col-lg-9">
									<input name="students" type="file">
								</div>
							</div>
							<div class="form-actions">
								<button type="submit" class="btn btn-primary btn-sm">上传</button>
								&nbsp; <a class="text-danger" href="${ctx}/">取消</a>
							</div>
						</form>
					</div>
				</div>
			</div>
		</div>
	</div>
	<script type="text/javascript">
	 $().ready(function () {  
         $("#inputForm").validate({  
             rules: {  
            	 students: {  
                     required: true,  
                     extension: 'xls|xlsx'
                 }  
             },  
             messages: {   
                 students: {  
                     required: "请选择文件",  
                     filetype: "只能上传xls,xlsx格式文件",  
                 }  
             },  
             //指定错误信息位置  
             errorPlacement: function (error, element) {  
                error.insertAfter(element);  
             },  
         });  
     }); 
	</script>
</body>
</html>
