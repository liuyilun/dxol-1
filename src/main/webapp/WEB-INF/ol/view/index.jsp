<%@ page contentType="text/html;charset=UTF-8" %>
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
                    <h1 class="page-header">é¦é¡µ</h1>
                </div>
                <!-- /.col-lg-12 -->
            </div>
            
            <!-- /.row -->
            <div class="row">
                <div class="col-lg-8">
                    <div class="panel panel-default">
                        <div class="panel-heading">
                            <i class="fa fa-pie-chart fa-fw"></i> è¯¾ç¨å®æç»è®¡
                        </div>
                        <!-- /.panel-heading -->
                        <div class="panel-body">
                        
                         <div class="col-lg-8">
	                        <div class="panel-body">
	                        	<div id="myStat" 
	                        		data-dimension="350" 
	                        		data-text="${currentStudent.reqHour+currentStudent.altHour}/${currentStudent.identity.reqHour+currentStudent.identity.altHour}" 
	                        		data-info="æ»è¯¾æ¶" 
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
	                        		data-info="å¿ä¿®è¯¾" 
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
	                        		data-info="éä¿®è¯¾" 
	                        		data-width="15" 
	                        		data-fontsize="24" 
	                        		data-percent="${currentStudent.altHour/currentStudent.identity.altHour*100}" 
	                        		data-fgcolor="7CCC4f" 
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
                            <i class="fa fa-user fa-fw"></i> å­¦çä¿¡æ¯
                        </div>
                        <!-- /.panel-heading -->
                        <div class="panel-body ">
                            <!-- /.list-group -->
                            <div class="container-fluid">
	                            <div class="row" style="margin-bottom: 8px;">
		                            <div style="text-align: right;" class="col-sm-6 col-md-5 col-lg-5 control-label"><strong>ç¨æ·å(å­¦å·):</strong></div>
		                            <div class="col-sm-6 col-md-7 col-lg-7">${currentStudent.username }</div>
	                            </div>
	                            <div class="row" style="margin-bottom: 8px;">
		                            <div style="text-align: right;" class="col-sm-6 col-md-5 col-lg-5 control-label"><strong>å§å:</strong></div>
		                            <div class="col-sm-6 col-md-7 col-lg-7">${currentStudent.name }</div>
	                            </div >
	                            <div class="row" style="margin-bottom: 8px;">
		                            <div style="text-align: right;" class="col-sm-6 col-md-5 col-lg-5 control-label"><strong>æ§å«:</strong></div>
		                            <div class="col-sm-6 col-md-7 col-lg-7">
		                            <c:if test="${currentStudent.sex==1 }">ç·</c:if>
		                            <c:if test="${currentStudent.sex==2 }">å¥³</c:if>
		                            </div>
	                            </div>
	                            <div class="row" style="margin-bottom: 8px;">
		                            <div style="text-align: right;" class="col-sm-6 col-md-5 col-lg-5 control-label"><strong>å­¦é¢:</strong></div>
		                            <div class="col-sm-6 col-md-7 col-lg-7">${currentStudent.school.name }</div>
	                            </div>
	                            <div class="row" style="margin-bottom: 8px;">
		                            <div style="text-align: right;" class="col-sm-6 col-md-5 col-lg-5 control-label"><strong>ä¸ä¸/ç³»</strong>:</div>
		                            <div class="col-sm-6 col-md-7 col-lg-7">${currentStudent.depart }</div>
	                            </div>
	                            <div class="row" style="margin-bottom: 8px;">
		                            <div style="text-align: right;" class="col-sm-6 col-md-5 col-lg-5 control-label"><strong>èº«ä»½:</strong></div>
		                            <div class="col-sm-6 col-md-7 col-lg-7">${currentStudent.identity.identityName }</div>
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
