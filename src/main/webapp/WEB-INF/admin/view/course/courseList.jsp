<%@ page contentType="text/html;charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="tags" tagdir="/WEB-INF/tags"%>

<c:set var="ctx" value="${pageContext.request.contextPath}" />
<head>
<script type="text/javascript">
	$(document).ready(function(){
		var message = "${message}";
		$(".course_tab").addClass("active");
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
	function viewCourse(id){
		  $.ajax( {  
		        type : "get",  
		        url : "${ctx}/admin/course/view/"+id,  
		        dataType:"json",  
		        success : function(res) {  
		        	bootbox.dialog({
		    		  title: res.courseName,
		    		  message: res.content
		    		});
		        }  
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
					class="fa fa-home"></i> 首页</a> <a href="#" class="current">课程管理</a>
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
										<th>课程学时</th>
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
											<td class="taskOptions" style="width: 120px">
												<a  class= "tip-top" data-original-title="查看详情" >
													<i class="fa fa-eye view"  onclick="viewCourse(${course.id});"></i>
												</a>&nbsp;&nbsp;
												<a href="${ctx}/admin/course/update/${course.id}" class="tip-top" data-original-title="修改">
													<i class="fa fa-pencil"></i>
												</a> &nbsp;&nbsp;
												<a class="tip-top" data-original-title="删除" onclick="deleteConfirm(${course.id},'${course.courseName}');">
													<i class="fa fa-times"></i>
												</a>&nbsp;&nbsp;
												<a href="${ctx}/admin/examinfo/show/${course.id}" class="tip-top" data-original-title="习题集">
													<i class="fa fa-file-text-o"></i>
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
		<script type="text/javascript">
		$('.data-table').dataTable({
			"bJQueryUI": true,
			"sPaginationType": "full_numbers",
			"sDom": '<""l>t<"F"fp>',
			"aoColumnDefs": [ { "bSortable": false, "aTargets": [ 2 ] }] ,
			"bInfor": true,
			"oLanguage": {
	           "sProcessing": "正在加载中...",
	           "sLengthMenu": "每页显示 _MENU_ 条记录",
	           "sZeroRecords": "对不起，查询不到相关数据！",
	           "sEmptyTable": "表中无数据存在！",
	           "sInfo": "当前显示 _START_ 到 _END_ 条，共 _TOTAL_ 条记录",
	           "sInfoFiltered": "共有 _MAX_ 条记录",
	           "sSearch": "搜索:",
	           "oPaginate": {
	               "sFirst": "首页",
	               "sPrevious": "上一页",
	               "sNext": "下一页",
	               "sLast": "末页"
	                }
	            } 
		});
		</script>
</body>
</html>
