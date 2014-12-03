<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="ctx" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html >

<head>
    <title></title>
    
    <link href="${ctx}/static/ol/css/plugins/jquery.circliful.css" rel="stylesheet">
</head>

<body>

    <div id="wrapper">

        <!-- Navigation -->
        

        <div id="page-wrapper">
            <div class="row">
                <div class="col-lg-12">
                    <h1 class="page-header">首页</h1>
                </div>
                <!-- /.col-lg-12 -->
            </div>
            
            <!-- /.row -->
            <div class="row">
                <div class="col-lg-8">
                    <div class="panel panel-default">
                        <div class="panel-heading">
                            <i class="fa fa-pie-chart fa-fw"></i> 已学课时统计
                        </div>
                        <!-- /.panel-heading -->
                        <div class="panel-body">
                        
                         <div class="col-lg-8">
	                        <div class="panel-body">
	                        	<div id="myStat" 
	                        		data-dimension="350" 
	                        		data-text="${currentStudent.reqHour+currentStudent.altHour}/${currentStudent.identity.reqHour+currentStudent.identity.altHour}" 
	                        		data-info="总课时" 
	                        		data-width="30" 
	                        		data-fontsize="38" 
	                        		data-percent="${(currentStudent.reqHour+currentStudent.altHour)/(currentStudent.identity.reqHour+currentStudent.identity.altHour)*100}" 
	                        		data-fgcolor="#61a9dc" 
	                        		data-bgcolor="#eee" 
	                        		data-fill="#ddd">
	                        	</div>
	                        </div>
                        </div>
                         <div class="col-lg-4">
	                        <div class="panel-body">
	                        	<div id="myStat1" 
	                        		data-dimension="150" 
	                        		data-text="${currentStudent.reqHour}/${currentStudent.identity.reqHour}"
	                        		data-info="必修课时" 
	                        		data-width="15" 
	                        		data-fontsize="24" 
	                        		data-percent="${currentStudent.reqHour/currentStudent.identity.reqHour*100}" 
	                        		data-fgcolor="#FF954E" 
	                        		data-bgcolor="#eee" 
	                        		data-fill="#ddd">
	                        	</div>
	                        </div>
	                        <div class="panel-body">
	                        	<div id="myStat2" 
	                        		data-dimension="150" 
	                        		data-text="${currentStudent.altHour}/${currentStudent.identity.altHour}" 
	                        		data-info="选修课时" 
	                        		data-width="15" 
	                        		data-fontsize="24" 
	                        		data-percent="${currentStudent.altHour/currentStudent.identity.altHour*100}"
	                        		data-fgcolor="#7CCC4f" 
	                        		data-bgcolor="#eee" 
	                        		data-fill="#ddd">
	                        	</div>
	                        </div>
                        </div>
                        <!-- /.panel-body -->
                    </div>
                    </div>

                </div>
                <!-- /.col-lg-8 -->
                <div class="col-lg-4">
                    <div class="panel panel-default">
                        <div class="panel-heading">
                            <i class="fa fa-user fa-fw"></i> 个人信息
                        </div>
                        <!-- /.panel-heading -->
                        <div class="panel-body ">
                            <!-- /.list-group -->
                            <div class="container-fluid">
	                            <div class="row" style="margin-bottom: 8px;">
		                            <div style="text-align: left;" class="col-sm-6 col-md-5 col-lg-5 control-label"><strong>用户名（学号）:</strong></div>
		                            <div class="col-sm-6 col-md-7 col-lg-7">${currentStudent.username }</div>
	                            </div>
	                            <div class="row" style="margin-bottom: 8px;">
		                            <div style="text-align: left;" class="col-sm-6 col-md-5 col-lg-5 control-label"><strong>姓名:</strong></div>
		                            <div class="col-sm-6 col-md-7 col-lg-7">${currentStudent.name }</div>
	                            </div >
	                            <div class="row" style="margin-bottom: 8px;">
		                            <div style="text-align: left;" class="col-sm-6 col-md-5 col-lg-5 control-label"><strong>性别:</strong></div>
		                            <div class="col-sm-6 col-md-7 col-lg-7">
		                            <c:if test="${currentStudent.sex==1 }">男</c:if>
		                            <c:if test="${currentStudent.sex==2 }">女</c:if>
		                            </div>
	                            </div>
	                            <div class="row" style="margin-bottom: 8px;">
		                            <div style="text-align: left;" class="col-sm-6 col-md-5 col-lg-5 control-label"><strong>学院:</strong></div>
		                            <div class="col-sm-6 col-md-7 col-lg-7">${currentStudent.school.name }</div>
	                            </div>
	                            <div class="row" style="margin-bottom: 8px;">
		                            <div style="text-align: left;" class="col-sm-6 col-md-5 col-lg-5 control-label"><strong>专业:</strong></div>
		                            <div class="col-sm-6 col-md-7 col-lg-7">${currentStudent.depart }</div>
	                            </div>
	                            <div class="row" style="margin-bottom: 8px;">
		                            <div style="text-align: left;" class="col-sm-6 col-md-5 col-lg-5 control-label"><strong>身份:</strong></div>
		                            <div class="col-sm-6 col-md-7 col-lg-7">${currentStudent.identity.identityName }</div>
	                            </div>
	                            <div class="row" style="margin-bottom: 8px;">
		                            <div style="text-align: left;" class="col-sm-6 col-md-5 col-lg-5 control-label"><strong>课程完成状态:</strong></div>
		                            <div class="col-sm-6 col-md-7 col-lg-7">
		                            <c:if test="${currentStudent.isFinish == 1 }">未完成</c:if>
		                            <c:if test="${currentStudent.isFinish == 2 }"><span class="text-success"><strong>已完成</strong></span></c:if>
		                            </div>
	                            </div>

		                        <c:choose>
		                            <c:when test="${currentStudent.summary.fileName!=null}">
		                            <div class="row" style="margin-bottom: 8px;">
			                            <div style="text-align: left;" class="col-sm-6 col-md-5 col-lg-5 control-label"><strong>学习总结:</strong></div>
			                            	<div class="col-sm-6 col-md-7 col-lg-7">已上传</div>
		                            </div>
		                            </c:when>
		                            <c:otherwise> 
		                             <form enctype="multipart/form-data" action="${ctx}/ol/summary" method="post">
		                                <div class="form-group">
                                            <label>上传总结:</label>
                                            <input type="file" name="file" >
                                            <div class="form-actions" style="margin-top: 8px;">
												<button type="submit" class="btn btn-primary btn-sm">上传</button>
											</div>
                                        </div>
		                             </form>
                                     </c:otherwise>
		                        </c:choose>
								<div class="row" style="margin-bottom: 8px;">
		                            <div style="text-align: left;" class="col-sm-6 col-md-5 col-lg-5 control-label"><strong>考试成绩:</strong></div>
		                            <div class="col-sm-6 col-md-7 col-lg-7">
		                            <c:if test="${currentStudent.grade < 60 }"><span class="text-danger"><strong>${currentStudent.grade }</strong></span></c:if>
		                            <c:if test="${currentStudent.grade >= 60 }"><span class="text-success"><strong>${currentStudent.grade }</strong></span></c:if>
		                            </div>
	                            </div>
	                            
                          	</div>
                        </div>
                        <!-- /.panel-body -->
                    </div>
                </div>
                <!-- /.col-lg-4 -->
            </div>
            <!-- /.row -->
        </div>
        <!-- /#page-wrapper -->

    </div>

	<script src="${ctx}/static/ol/js/plugins/circliful/jquery.circliful.min.js"></script>

   <script type="text/javascript">
   
	$(document).ready(function(){

		$('#myStat').circliful();
		$('#myStat1').circliful();
		$('#myStat2').circliful();

	});
	</script>
   
</body>

</html>
