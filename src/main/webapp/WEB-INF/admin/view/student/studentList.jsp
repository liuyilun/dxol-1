<%@ page contentType="text/html;charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="tags" tagdir="/WEB-INF/tags"%>

<c:set var="ctx" value="${pageContext.request.contextPath}" />
<head>
<style type="text/css">
.my-modal {
	width: 100%;
	heigth: 100%;
}
</style>
<script type="text/javascript">
$(document).ready(function(){
	$("#student_tab").addClass("active");
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
				location.href = "${ctx}/student/delete/" + id;
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
	function detail(){
		bootbox.dialog({
            title: "学生详细信息",
            message: '<div class="row">  ' +
				'<div class="col-xs-12">'+
					'<div class="widget-box">'+
						'<div class="widget-title">'+
							'<span class="icon">'+' <i class="fa fa-th"></i>'+
							'</span>'+
							'<h5>学生列表</h5>'+
						'</div>'+
						'<div class="widget-content nopadding">'+
							'<table class="table table-bordered table-striped table-hover data-table">'+
								'<thead>'+
									'<tr>'+
									'<th>用户名</th>'+
										
									
										'<th>姓名</th>'+
										'<th>性别</th>'+
										'<th>角色</th>'+
										'<th>注册日期</th>'+
										'<th>学院</th>'+
										'<th>专业</th>'+
										'<th>选修课已修学时</th>'+
										'<th>必修课已修学时</th>'+
										'<th>成绩</th>'+
										'<th>剩余考试次数</th>'+
										'<th>学习总结</th>'+
										'<th>学习总结上传（更新）时间</th>'+
										'<th>身份</th>'+
										
										
										'<tr></thead></thead><tbody>'+
										'<c:forEach items="${students}" var="student">'+
										'<tr class="gradeX">'+
										'<td>${student.username}</td>'+
										'<td>${student.name}</td>'+
										
										'<td>'+
										'<c:if test="${student.sex==0}">女</c:if>'+
										'<c:if test="${student.sex==1}">男'+
										'</c:if></td>'+
										'<td>'+
										'<c:if test="${student.role=='student'}">学生</c:if>'+
										'<c:if test="${student.role=='admin'}">管理员</c:if>'+
										'<td>${student.registerDate}</td>'+
										'<td>${student.school.name}</td>'+
										'<td>${student.depart}</td>'+
										'<td>${student.altHour}</td>'+
										'<td>${student.reqHour}</td>'+										
										'<td>'+
										'<c:if test="${student.grade>=60}">'+										
										'<a class="btn" title="恭喜，成绩合格！">'+										
										'<span class="badge badge-success">${student.grade}</span>'+
										'</a></c:if> '+
										'<c:if test="${student.grade>0&&student.grade<60}">'+
										'<a class="btn" title="很遗憾，成绩不合格！">'+
										'<span class="badge badge-danger">${student.grade}</span>'+
										'</a></c:if> '+
										'<c:if test="${student.grade==0}">'+
										'<a class="btn" title="很遗憾，成绩不合格！">'+
										'<span class="badge badge-default">${student.grade}</span>'+
										'</a></c:if></td>'+
										' <td>${student.examTime}</td>'+
										'<td>${student.summary.fileName}</td>'+
										'<td>${student.summaryUpTime}</td>'+
										'<td>${student.identity.identityName}</td>'+
										'</tr></c:forEach></tbody></table></div></div></div></div></div>',
										className:"my-modal",
		
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
				<h1>学生信息管理</h1>
			</div>
			<div id="breadcrumb">
				<a href="${ctx}/admin/success" title="Go to Home" class="tip-bottom"><i
					class="fa fa-home"></i> Home</a> <a href="${ctx}/student/create"
					class="current"><button class="btn" type="button">添加学生</button></a>
			</div>
			<div class="row">
				<div class="col-xs-12">

					<div class="widget-box">
						<div class="widget-title">
							<span class="icon"> <i class="fa fa-th"></i>
							</span>
							<h5>学生列表</h5>
						</div>
						<div class="widget-content nopadding">
							<table
								class="table table-bordered table-striped table-hover data-table">
								<thead>
									<tr>
										<th style="width: 10%">用户名</th>
										<!-- <th>密码</th> -->
										<th style="width: 7%">姓名</th>
										<th style="width: 5%">性别</th>
										<th style="width: 7%">角色</th>
										<th style="width: 15%">注册日期</th>
										<!-- 	<th>选修课已修学时</th>
										<th>必修课已修学时</th>
										<th>是否可以考试</th> -->
										<th style="width: 15%">学院</th>
										<th style="width: 10%">专业</th>
										<th style="width: 5%">成绩</th>
										<!-- <th>剩余考试次数</th> -->
										<th style="width: 7%">学习总结</th>
										<!-- <th>学习总结上传（更新）时间</th> -->
										<th style="width: 9%">身份</th>
										<th style="width: 10%">操作</th>
									</tr>
								</thead>
								<tbody>
									<c:forEach items="${students}" var="student">
										<tr class="gradeX">
											<td style="width: 10%">${student.username}</td>
											<%-- <td>${student.password}</td> --%>
											<td style="width: 7%">${student.name}</td>
											<td style="width: 5%" align="center"><c:choose>
													<c:when test="${student.sex==0}">女</c:when>
													<c:otherwise>男</c:otherwise>
												</c:choose></td>
											<td style="width: 7%" align="center"><c:choose>
													<c:when test="${student.role=='student'}">学生</c:when>
													<c:otherwise>管理员</c:otherwise>
												</c:choose></td>

											<td style="width: 15%">${student.registerDate}</td>
											<%-- <td>${student.altHour}</td>
											<td>${student.reqHour}</td>
											<td>${student.isFinish}</td> --%>
											<td style="width: 15%">${student.school.name}</td>
											<td style="width: 10%">${student.depart}</td>
											<td style="width: 5%" align="center"><c:if
													test="${student.grade>=60}">
													<a class="btn" title="恭喜，成绩合格！"><span
														class="badge badge-success">${student.grade}</span></a>
												</c:if> <c:if test="${student.grade>0&&student.grade<60}">
													<a class="btn" title="很遗憾，成绩不合格！"><span
														class="badge badge-danger">${student.grade}</span></a>
												</c:if> <c:if test="${student.grade==0}">
													<a class="btn" title="很遗憾，成绩不合格！"><span
														class="badge badge-default">${student.grade}</span></a>
												</c:if></td>
											<%-- <td>${student.examTime}</td> --%>

											<td style="width: 7%" class="taskOptions">
											<c:if test="${student.summary.fileName!=null&&student.summary.path!=null}">
											<a href="${ctx}/background/fileOperate/download/${student.id}" class="tip-top"
												data-original-title="下载学习总结"> <i class="fa fa-download"></i></a>
											</c:if>
											<c:if test="${student.summary.fileName==null||student.summary.path==null}">还未上传
											</c:if>
											</td>
											<%-- <td>${student.summaryUpTime}</td> --%>
											<td style="width: 9%">${student.identity.identityName}</td>
											<%-- <td style="width: 60%">${inform.title }</td>
											<td align="center">${inform.updateTime }</td> --%>
											<td class="taskOptions"><a class="tip-top"
												data-original-title="详情" id="bootbox-custom-html-forms"
												onclick="detail()"> <i class="fa fa-eye"></i>
											</a>&nbsp;<a href="${ctx}/student/update/${student.id}" class="tip-top"
												data-original-title="修改"> <i class="fa fa-pencil"></i></a>&nbsp; <a
												class="tip-top" data-original-title="删除" id="bootbox-alert"
												onclick="deleteConfirm(${student.id},'${student.username}')">
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
</body>
</html>
