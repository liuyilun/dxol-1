<%@ page contentType="text/html;charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="tags" tagdir="/WEB-INF/tags"%>

<c:set var="ctx" value="${pageContext.request.contextPath}" />
<head>
<script type="text/javascript">
	$(document).ready(function(){
		$("#inform_tab").addClass("active");
		var message="${message}" /* getUrlParam("message") */;
		if(message!= null){
			bootbox.alert(message);
		}
	})
	function getUrlParam(name){
		var reg = new RegExp("(^|&)"+ name +"=([^&]*)(&|$)"); //构造一个含有目标参数的正则表达式对象
		var r = window.location.search.substr(1).match(reg);  //匹配目标参数
		if (r!=null) return  decodeURIComponent(r[2]);
		return null; //返回参数值
	} 
	
	 function deleteConfirm(id,name){
		 var message ="确认删除 <strong> "+name+"</strong> 吗？";
		 bootbox.confirm(message,function(result){
			 if(result){
				 location.href="${ctx}/admin/informAdmin/delete/" + id;
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
	 function success(message){
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
				<h1>通知管理</h1>
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
							<h5>通知列表</h5>
						</div>
						<div class="widget-content nopadding">
							<table
								class="table table-bordered table-striped table-hover data-table">
								<thead>
									<tr>
										<th>题目</th>
										<th>上传时间</th>
										<th>操作</th>
									</tr>
								</thead>
								<tbody>
									<c:forEach items="${informs }" var="inform">
										<tr class="gradeX">
											<td style="width: 60%">${inform.title }</td>
											<td align="center">${inform.updateTime }</td>
											<td class="taskOptions"><a
												href="${ctx}/informAdmin/modify/${inform.id}"
												class="tip-top" data-original-title="修改"><i
													class="fa fa-pencil"></i></a> <a class="tip-top"
												data-original-title="删除" id="bootbox-alert"
												onclick="deleteConfirm(${inform.id},'${inform.title }');"><i
													class="fa fa-times"></i></a></td>
										</tr>
									</c:forEach>
								</tbody>
							</table>
						</div>
					</div>
				</div>
			</div>
		</div>
</body>
</html>
