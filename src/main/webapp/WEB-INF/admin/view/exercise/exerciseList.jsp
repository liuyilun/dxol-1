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
				 location.href="${ctx}/admin/examinfo/remove/" + id;
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
				<h1>练习题管理</h1>
			</div>
			<div id="breadcrumb">
				<a href="#" title="Go to Home" class="tip-bottom"><i
					class="fa fa-home"></i> 首页</a> <a href="#" class="current">练习题管理</a>
			</div>
			<div class="row">
				<div class="col-xs-12">

					<div class="widget-box">
						<div class="widget-title">
					
							<span class="icon" >
								<a class="tip-top" href="${ctx}/admin/examinfo/add/${courseid}" data-original-title = "添加练习题" align="center"> 
								<i class="fa fa-plus-square"></i>
								</a>
							</span>
						
							<h5>练习题列表</h5>
						</div>
						<div class="widget-content nopadding">
							<table
								class="table table-bordered table-striped table-hover data-table">
								<thead>
									<tr>
										<th>练习题题目</th>
										<th>选项A</th>
										<th>选项B</th>
										<th>选项C</th>
										<th>选项D</th>
										<th>操作</th>
									</tr>
								</thead>
								<tbody>
									<c:forEach items="${examinfos}" var="examinfo">
										<tr class="gradeX">
											<td>${examinfo.questionInfo }</td>
											<td  align="center" style="width: 10%;">${examinfo.choiceA }</td>
											<td  align="center" style="width: 10%;">${examinfo.choiceB }</td>
											<td  align="center" style="width: 10%;">${examinfo.choiceC }</td>
											<td  align="center" style="width: 10%;">${examinfo.choiceD }</td>
											<td class="taskOptions" style="width: 120px">
												<a href="${ctx}/admin/examinfo/modify/${examinfo.id}" class="tip-top" data-original-title="修改">
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
