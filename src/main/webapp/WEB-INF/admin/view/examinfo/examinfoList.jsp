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
				 location.href="${ctx}/admin/examinfo/delete/" + id;
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
				<h1>试题管理</h1>
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
								<a class="tip-top" href="${ctx}/admin/examinfo/create" data-original-title = "添加试题" align="center"> 
								<i class="fa fa-plus-square"></i>
								</a>
							</span>
						
							<h5>试题列表</h5>
						</div>
						<div class="widget-content nopadding">
							<table
								class="table table-bordered table-striped table-hover data-table">
								<thead>
									<tr>
										<th>试题题目</th>
										<th>所属身份</th>
										<th>选项A</th>
										<th>选项B</th>
										<th>选项C</th>
										<th>选项D</th>
										<th>操作</th>
									</tr>
								</thead>
								<tbody>
									<c:forEach items="${examinfos }" var="examinfo">
										<tr class="gradeX">
											<td >${examinfo.questionInfo }</td>
											<td align="center"  style="width: 10%;">${examinfo.identity.identityName }</td>
											<td  align="center" style="width: 10%;">${examinfo.choiceA }</td>
											<td  align="center" style="width: 10%;">${examinfo.choiceB }</td>
											<td  align="center" style="width: 10%;">${examinfo.choiceC }</td>
											<td  align="center" style="width: 10%;">${examinfo.choiceD }</td>
											<td class="taskOptions" style="width: 110px">
												<a href="${ctx}/admin/examinfo/update/${examinfo.id}" class="tip-top" data-original-title="修改">
													<i class="fa fa-pencil"></i>
												</a> &nbsp;&nbsp;
												<a class="tip-top" data-original-title="删除" onclick="deleteConfirm(${examinfo.id},'${examinfo.questionInfo}');">
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