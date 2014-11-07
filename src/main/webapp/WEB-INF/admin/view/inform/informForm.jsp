<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="ctx" value="${pageContext.request.contextPath}"/>

	<head>
		<title>添加通知</title>
		<link rel="stylesheet" type="text/css" href="${ctx}/static/unicorn/css/bootstrap-wysihtml5.css"></link>
		<link rel="stylesheet" type="text/css" href="${ctx}/static/unicorn/css/prettify.css"></link>
		<script src="${ctx}/static/unicorn/js/wysihtml5.js"></script>
		<script src="${ctx}/static/unicorn/js/bootstrap-wysihtml5.js"></script>
		<script src="${ctx}/static/unicorn/js/bootstrap-wysihtml5.zh-CN.js"></script>
		<script type="text/javascript">
		$(document).ready(function(){
			$('#some-textarea').wysihtml5({
				"font-styles": true, //Font styling, e.g. h1, h2, etc. Default true
				"emphasis": true, //Italics, bold, etc. Default true
				"lists": true, //(Un)ordered lists, e.g. Bullets, Numbers. Default true
				"html": false, //Button which allows you to edit the generated HTML. Default false
				"link": true, //Button to insert a link. Default true
				"image": true, //Button to insert an image. Default true,
				"color": false, //Button to change color of font  
				locale: "zh-CN"
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
								<form action="#" method="get" class="form-horizontal">
									<div class="form-group">
										<label class="col-sm-3 col-md-3 col-lg-2 control-label">Normal text input</label>
										<div class="col-sm-9 col-md-9 col-lg-10">
											<input type="text" class="form-control input-sm" />
										</div>
									</div>
									
										<textarea id="some-textarea" placeholder="Enter text ..." style="width: 810px; height: 200px"></textarea>

									
									<div class="form-actions">
										<button type="submit" class="btn btn-primary btn-sm">Save</button> or <a class="text-danger" href="#">Cancel</a>
									</div>
								</form>
							</div>
						</div>						
					</div>
				</div>

				
			</div>
			</div>
	</body>

