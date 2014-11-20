<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="ctx" value="${pageContext.request.contextPath}"/>

	<head>
		<title>添加通知</title>
		
	    <link rel="stylesheet" type="text/css" href="${ctx}/static/bootstrap3-wysihtml5-master/src/bootstrap-wysihtml5.css" />
	    <script src="${ctx}/static/bootstrap3-wysihtml5-master/lib/js/wysihtml5-0.3.0.js"></script>
   		<script src="${ctx}/static/bootstrap3-wysihtml5-master/src/bootstrap3-wysihtml5.js"></script>
   		<script src="${ctx}/static/bootstrap3-wysihtml5-master/src/locales/bootstrap-wysihtml5.zh-CN.js"></script>
		
		<script type="text/javascript">
		$(document).ready(function(){
			$('#infoContent').wysihtml5({
				"link": false, //Button to insert a link. Default true
				"image": false, //Button to insert an image. Default true,
				"color": false, //Button to change color of font  
				"locale": "zh-CN"
			});
		});
		</script>	
	</head>	
	<body >
	
			<div id="content">
				<div id="breadcrumb">
					<a href="#" title="Go to Home" class="tip-bottom"><i class="fa fa-home"></i> Home</a>
					<a href="#" class="current">Dashboard</a>
				</div>

				<div class="container-fluid">
				<div class="row">
					<div class="col-xs-12">
						<div class="widget-box">
							<div class="widget-title">
								<span class="icon">
									<i class="fa fa-pencil"></i>									
								</span>
								<h5>通知管理</h5>
							</div>
							<div class="widget-content nopadding">
								<form action="${ctx}/admin/informAdmin/${action}" method="post" class="form-horizontal">
									<input type="hidden"name="id" value="${inform.id }"/>
									<div class="form-group">
										<label class="col-sm-3 col-md-3 col-lg-2 control-label">通知题目：</label>
										<div class="col-sm-9 col-md-9 col-lg-10">
											<input type="text" class="form-control input-sm" name="title" id="title" value="${inform.title }"/>
										</div>
										<label class="col-sm-3 col-md-3 col-lg-2 control-label">通知内容：</label>
										<div class="col-sm-9 col-md-9 col-lg-10">
											<textarea id="infoContent" name="content" placeholder="在这里输入内容 ..." style="width: 810px; height: 200px">${inform.content }</textarea>
										</div>
									</div>
									

									
									<div class="form-actions">
										<button type="submit" class="btn btn-primary btn-sm">保存</button>&nbsp;&nbsp; &nbsp; <a class="text-danger" href="#">取消</a>
									</div>
								</form>
							</div>
						</div>						
					</div>
				</div>

				
			</div>
			</div>
	</body>

