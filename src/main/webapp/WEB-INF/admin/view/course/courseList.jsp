<%@ page contentType="text/html;charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="tags" tagdir="/WEB-INF/tags"%>

<c:set var="ctx" value="${pageContext.request.contextPath}" />
<head>
<script type="text/javascript">
	$(document).ready(function(){
		var message = "${message}";
		if(message!= null&&message!=""){
			bootbox.alert(message,function(){
			});
		}
		$("#informLink").addClass("active");
	})
	
	 function deleteConfirm(id,name){
		 var message ="确认删除 <strong> "+name+"</strong> 吗？";
		 bootbox.confirm(message,function(result){
			 if(result){
				 location.href="${ctx}/admin/course/delete/" + id;
			 }
		 });
		 
     }
	function viewInform(title,content){
		bootbox.dialog({
		  title: title,
		  message: content
		});
	}


	</script>
</head>

<body data-color="grey" class="flat">
	<div id="wrapper">

		<c:if test="${not empty message}">
		success(message);
	</c:if>

		<div id="content">
			<div id="content-header">
				<h1>课程管理</h1>
			</div>
			<div id="breadcrumb">
				<a href="#" title="Go to Home" class="tip-bottom"><i
					class="fa fa-home"></i> Home</a> <a href="#" class="current">Tables</a>
			</div>
			<div class="row">
				<div class="col-xs-12">

					<div class="widget-box">
						<div class="widget-title">
					
							<span class="icon" >
								<a class="tip-top" href="${ctx}/admin/course/create" data-original-title = "添加课程" align="center"> 
								<i class="fa fa-plus-square"></i>
								</a>
							</span>
						
							<h5>课程列表</h5>
						</div>
						<div class="widget-content nopadding">
							<table
								class="table table-bordered table-striped table-hover data-table">
								<thead>
									<tr>
										<th>课程题目</th>
										<th>课程时间</th>
										<th>所属身份</th>
										<th>课程性质</th>
										<th>操作</th>
									</tr>
								</thead>
								<tbody>
									<c:forEach items="${courses }" var="course">
										<tr class="gradeX">
											<td >${course.courseName }</td>
											<td align="center"  style="width: 10%;">${course.hour }</td>
											<td align="center"  style="width: 15%;">${course.identity.identityName }</td>
											<td align="center" style="width: 10%;">
												<c:if test="${course.reqAlt==1}">
													必修
												</c:if>
												<c:if test="${course.reqAlt==2}">
													选修
												</c:if>
											</td>
											<td class="taskOptions" style="width: 110px">
												<a  class= "tip-top" data-original-title="查看详情" onclick="viewInform('${course.courseName}','${course.content}')">
													<i class="fa fa-eye"></i>
												</a>&nbsp;&nbsp;
												<a href="${ctx}/admin/course/update/${course.id}" class="tip-top" data-original-title="修改">
													<i class="fa fa-pencil"></i>
												</a> &nbsp;&nbsp;
												<a class="tip-top" data-original-title="删除" onclick="deleteConfirm(${course.id},'${course.courseName}');">
													<i class="fa fa-times"></i>
												</a>
											</td>
										</tr>
									</c:forEach>
								</tbody>
							</table>
						</div>
					</div>
				</div>
			</div>
		</div>
		</div>
</body>
</html>
