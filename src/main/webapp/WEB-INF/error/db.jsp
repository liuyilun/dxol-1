<%@ page contentType="text/html;charset=UTF-8" isErrorPage="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="org.slf4j.Logger,org.slf4j.LoggerFactory"%>
<c:set var="ctx" value="${pageContext.request.contextPath}" />
<%
	//设置返回码200，避免浏览器自带的错误页面
	response.setStatus(200);
	//记录日志
	Logger logger = LoggerFactory.getLogger("500.jsp");
	logger.error(exception.getMessage(), exception);
%>

<!DOCTYPE html>
<html>
<head>
<title>非法数据</title>
</head>

<body data-color="grey" class="flat">
	<div id="content">
		<div id="content-header">
			<h1>非法数据！</h1>
		</div>
		<div class="row">
			<div class="col-xs-12">
				<h4>
					<strong>导入失败！</strong> 请检查您的数据： <br> 1.是否严格按照<strong>
						<a href=\"${ctx}/admin/help\">使用说明</a>
					</strong>中要求的格式填写 <br> 2.是否重复导入数据
				</h4>
				<br>
				<a href="${ctx}/"> 返回首页 </a>
			</div>
		</div>
		<hr />
	</div>
</body>
</html>
