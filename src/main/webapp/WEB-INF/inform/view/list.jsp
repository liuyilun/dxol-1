<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="tags" tagdir="/WEB-INF/tags"%>
<c:set var="ctx" value="${pageContext.request.contextPath}" />
<html>
<head>
<title>通知</title>
</head>
<body data-color="grey" class="flat">
	<div id="wrapper">
		<div id="content">
			<div id="content-header">
				<h1>通知</h1>
			</div>
			<div id="breadcrumb">
				<a class="tip-bottom"><i class="fa fa-list-ul"></i> 通知列表</a> 
			</div>
			<div class="container">
				<div class="row clearfix">
					<div class="widget-box">
					<div class="widget-content ">
						<c:forEach items="${informs.content }" var="inform">
							
							<div class="row">
								<h2  style=" white-space: nowrap; overflow:hidden; text-overflow:ellipsis;">
									${inform.title }
								</h2>
								<div style="height:100px; overflow:hidden; text-overflow:ellipsis;"  >
									${inform.content}
								</div>
								<div>
									 <a class="btn" href="${ctx}/inform/${inform.id}">详情»</a>
								</div>
							</div>
							<hr />
						</c:forEach>
					</div>
					</div>
				</div>	
				<tags:pagination page="${informs}" paginationSize="5"/>	
		</div>
			
		</div>
	</div>

</body>
</html>