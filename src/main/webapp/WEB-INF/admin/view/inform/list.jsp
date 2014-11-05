<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="tags" tagdir="/WEB-INF/tags" %>
<c:set var="ctx" value="${pageContext.request.contextPath}"/>
<html >
	<head>
		<title></title>
	</head>	
	<body >
	
			<div id="content">
				<div id="content-header" class="mini">
					<h1>通知管理</h1>
				</div>
				<div id="breadcrumb">
					<a href="#" title="Go to Home" class="tip-bottom"><i class="fa fa-home"></i> Home</a>
					<a href="#" class="current">Dashboard</a>
				</div>
				<div class="container-fluid">
					<c:if test="${not empty message}">
						<div id="message" class="alert alert-success"><button data-dismiss="alert" class="close">×</button>${message}</div>
					</c:if>
					<div class="row">
						<div class="span4 offset7">
							<form class="form-search" action="#">
								<label>名称：</label> <input type="text" name="search_LIKE_title" class="input-medium" value="${param.search_LIKE_title}"> 
								<button type="submit" class="btn" id="search_btn">Search</button>
						    </form>
					    </div>
					    <tags:sort/>
					</div>
					
					<table id="contentTable" class="table table-striped table-bordered table-condensed">
						<thead>
							<tr>
								<th>题目</th>
								<th>添加时间</th>
							</tr>
						</thead>
						<tbody>
						<c:forEach items="${informs.content}" var="inform">
							<tr>
								<td><a href="#">${inform.title}</a></td>
								<td><a href="#">${inform.updateTime }</a></td>
							</tr>
						</c:forEach>
						</tbody>
					</table>
					
					<tags:pagination page="${informs}" paginationSize="5"/>
				
					<div><a class="btn" href="${ctx}/informAdmin/create">添加通知</a></div>
				</div>
			</div>
	</body>
</html>
