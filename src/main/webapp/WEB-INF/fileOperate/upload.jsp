<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="ctx" value="${pageContext.request.contextPath}" />
<!DOCTYPE html  
PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN"  
"http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<title>Insert title here</title>
</head>
<body>

	<%-- <form enctype="multipart/form-data"
		action="${ctx}/background/fileOperate/upload" method="post">
		<input type="file" name="file1" /> <input type="text" name="alais" /><br />
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input
			type="file" name="file2" /> <input type="text" name="alais" /><br />
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input
			type="file" name="file3" /> <input type="text" name="alais" /><br />
		<!-- <input type="submit" value="上传" /> -->
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input
			id="submit_btn" class="btn btn-primary" type="submit" value="上传" />
 --%>
 <form enctype="multipart/form-data"
		action="${ctx}/background/fileOperate/upload" method="post">
		<div id="content">
			<div id="content-header">
				<h1>上传文件</h1>
			</div>
			<div id="breadcrumb">
				<a href="${ctx}/admin/success" title="Go to Home" class="tip-bottom"><i
					class="fa fa-home"></i> Home</a> <a href="#" class="current">Tables</a>
			</div>
			<div class="row">
				<div class="col-xs-12">

					<div class="widget-box">
						<div class="widget-title">
							<span class="icon"> <i class="fa fa-th"></i>
							</span>
							<h5>文件列表</h5>
						</div>
						<div class="widget-content nopadding">
							<table
								class="table table-bordered table-striped table-hover data-table">
								<thead>
									
										
									
								</thead>
								<tbody>
									<tr>
										<td align="right">文件一</td><td align="center"><input type="file" name="file1" /> <input
											type="text" name="alais" /></td>
									</tr>
									<tr>
										<td align="right">文件二</td><td align="center"><input type="file" name="file2" /> <input
											type="text" name="alais" /></td>
									</tr>
									<tr>
										<td align="right">文件三</td><td align="center"><input type="file" name="file3" /> <input
											type="text" name="alais" /></td>
									</tr>
									<tr>
										<td colspan="2" align="center"><input id="submit_btn" class="btn btn-primary" type="submit"
											value="上传" /></td>
									</tr>

								</tbody>
							</table>
						</div>
					</div>
				</div>
			</div>
		</div>
	</form>
</body>
</html>
