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
				 location.href="${ctx}/admin/informAdmin/delete/" + id;
			 }
		 });
		 
     }
	function viewInform(id){
		  $.ajax( {  
		        type : "get",  
		        url : "${ctx}/admin/informAdmin/view/"+id,  
		        dataType:"json",  
		        success : function(res) {  
		        	bootbox.dialog({
		    		  title: res.title,
		    		  message: res.content
		    		});
		        }  
		    });  
	}


	</script>
</head>

<body data-color="grey" class="flat">
	<div id="wrapper">


		<div id="content">
			<div id="content-header">
				<h1>通知管理</h1>
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
								<a class="tip-top" href="${ctx}/admin/informAdmin/create" data-original-title = "添加通知" align="center"> 
								<i class="fa fa-plus"></i>
								</a>
							</span>
						
							<h5>通知列表</h5>
						</div>
						<div class="widget-content nopadding">
							<table
								class="table table-bordered table-striped table-hover data-table">
								<thead >
									<tr>
										<th>标题</th>
										<th>上传时间</th>
										<th>操作</th>
									</tr>
								</thead>
								<tbody>
									<c:forEach items="${informs }" var="inform">
										<tr class="gradeX">
											<td style="width: 70%">${inform.title }</td>
											<td align="center">${inform.updateTime }</td>
											<td class="taskOptions" style="width: 100px">
												<a  class= "tip-top " data-original-title="查看详情" >
													<i class="fa fa-eye view" onclick="viewInform(${inform.id});"></i>
												</a>&nbsp;&nbsp;
												<a href="${ctx}/admin/informAdmin/modify/${inform.id}" class="tip-top" data-original-title="修改">
													<i class="fa fa-pencil"></i>
												</a> &nbsp;&nbsp;
												<a class="tip-top" data-original-title="删除" onclick="deleteConfirm(${inform.id},'${inform.title}');">
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
