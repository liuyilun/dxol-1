<%@ page contentType="text/html;charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="tags" tagdir="/WEB-INF/tags"%>

<c:set var="ctx" value="${pageContext.request.contextPath}" />
<head>
<script type="text/javascript">
$(document).ready(function(){
	$(".admin_tab").addClass("active");
	var message="${message}" /* getUrlParam("message") */;
	if(message!= null){
		bootbox.alert(message);
	}
})
	function getUrlParam(name) {
		var reg = new RegExp("(^|&)" + name + "=([^&]*)(&|$)"); //构造一个含有目标参数的正则表达式对象
		var r = window.location.search.substr(1).match(reg); //匹配目标参数
		if (r != null)
			return decodeURIComponent(r[2]);
		return null; //返回参数值
	}

	function deleteConfirm(id, name) {
		var message = "确认删除 <strong> " + name + "</strong> 吗？";
		bootbox.confirm(message, function(result) {
			if (result) {
				location.href = "${ctx}/admin/manager/delete/" + id;
			}
		});
		/*  	$("#alertMessage").html("确认删除 <strong> "+name+"</strong> 吗？");
		    	$("#confirmButton").attr("href","${ctx}/informAdmin/delete/"+id);
		        $('#myAlert').modal({
		    		backdrop:true,
		    		keyboard:true,
		    		show:true
				}); */
	}
	function success(message) {
		bootbox.prompt(message);

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
				<h1>管理员信息管理</h1>
			</div>
			<div id="breadcrumb">
				<a href="${ctx}/admin/success" title="Go to Home" class="tip-bottom"><i
					class="fa fa-home"></i> Home</a> 
			</div>
			<div class="row">
				<div class="col-xs-12">

					<div class="widget-box">
						<div class="widget-title">
							<span class="icon">
							<a class="tip-top" href="${ctx}/admin/manager/create" data-original-title = "添加学生" align="center">
								<i class="fa fa-plus"></i>
							</a> 
							</span>
							<h5>管理员列表</h5>
						</div>
						<div class="widget-content nopadding">
							<table
								class="table table-bordered table-striped table-hover data-table">
								<thead>
									<tr>
										<th>用户名</th>
										<th>姓名</th>
										<th>角色</th>
										<th>注册日期</th>
										<th>所属学院</th>
										<th>操作</th>
									</tr>
								</thead>
								<tbody>
									<c:forEach items="${admins}" var="admin">
										<tr class="gradeX">
											<td align="center">${admin.username}</td>

											<td align="center">${admin.name}</td>

											<td align="center">
											<c:choose>
											<c:when test="${admin.role=='student'}">学生</c:when>
											<c:otherwise>管理员</c:otherwise>
											</c:choose>
											</td>

											<td align="center">${admin.registerDate}</td>

											<td align="center">${admin.school.name}</td>

											<%-- <td style="width: 60%">${inform.title }</td>
											<td align="center">${inform.updateTime }</td> --%>
											<td class="taskOptions"><a
												href="${ctx}/admin/manager/update/${admin.id}" class="tip-top"
												data-original-title="修改"> <i class="fa fa-pencil"></i></a> <a
												class="tip-top" data-original-title="删除" id="bootbox-alert"
												onclick="deleteConfirm(${admin.id},'${admin.username}')">
													<i class="fa fa-times"></i>
											</a></td>
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
	<script>
$('.data-table').dataTable({
	"bJQueryUI": true,
	"sPaginationType": "full_numbers",
	"sDom": '<""l>t<"F"fp>',
	"oLanguage": {
	           "sProcessing": "正在加载中......",
	           "sLengthMenu": "每页显示 _MENU_ 条记录",
	           "sZeroRecords": "对不起，查询不到相关数据！",
	           "sEmptyTable": "表中无数据存在！",
	           "sInfo": "当前显示 _START_ 到 _END_ 条，共 _TOTAL_ 条记录",
	           "sInfoFiltered": "数据表中共为 _MAX_ 条记录",
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
