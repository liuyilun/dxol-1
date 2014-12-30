<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="ctx" value="${pageContext.request.contextPath}"/>

	<head>
		<title>添加练习题</title>
		
	    <link rel="stylesheet" type="text/css" href="${ctx}/static/bootstrap3-wysihtml5-master/src/bootstrap-wysihtml5.css" />
	    <script src="${ctx}/static/bootstrap3-wysihtml5-master/lib/js/wysihtml5-0.3.0.js"></script>
   		<script src="${ctx}/static/bootstrap3-wysihtml5-master/src/bootstrap3-wysihtml5.js"></script>
   		<script src="${ctx}/static/bootstrap3-wysihtml5-master/src/locales/bootstrap-wysihtml5.zh-CN.js"></script>
		
		<script type="text/javascript">
		$(document).ready(function(){
		$(".course_tab").addClass("active");
			$('#infoContent').wysihtml5({
				"link": false, //Button to insert a link. Default true
				"image": false, //Button to insert an image. Default true,
				"color": true, //Button to change color of font  
				"locale": "zh-CN"
			});
		});
		
		function validate_required(field,alerttxt)
		{
		with (field)
		  {
		  if (value==null||value==" "||value==0)
		    {alert(alerttxt);return false}
		  else {return true}
		  }
		}

		function validate_form(thisform)
		{
		with (thisform)
		  {
		  if (validate_required(questionInfo,"练习题题目不能为空！")==false)
		    {questionInfo.focus();return false}
		  if (validate_required(choiceA,"选项A不能为空！")==false)
		    {choiceA.focus();return false}
		  if (validate_required(choiceB,"选项B不能为空！")==false)
		    {choiceB.focus();return false}
		  if (validate_required(choiceC,"选项C不能为空！")==false)
		    {choiceC.focus();return false}
		  if (validate_required(choiceD,"选项D不能为空！")==false)
		    {choiceD.focus();return false}
		  if (validate_required(rightAnswer,"正确选项不能为空！")==false)
		    {return false}
		  
		  }
		}
		</script>	
		
		
	</head>	
	<body >
	
			<div id="content">
				<div id="breadcrumb">
					<a href="#" title="Go to Home" class="tip-bottom"><i class="fa fa-home"></i> 首页</a>
					<a href="#" class="current">练习题</a>
				</div>

				<div class="container-fluid">
				<div class="row">
					<div class="col-xs-12">
						<div class="widget-box">
							<div class="widget-title">
								<span class="icon">
									<i class="fa fa-pencil"></i>									
								</span>
								<h5>练习题管理</h5>
							</div>
							<div class="widget-content nopadding">
								<form name="exam" action="${ctx}/admin/examinfo/${action}" method="post" class="form-horizontal" onsubmit="return validate_form(this)">
									<input type="hidden"name="id" value="${examinfo.id }"/>
									<input type="hidden"name="courseid" value="${course.id }"/>
									<input type="hidden"name="identity_id" value="${course.identity.id }"/>
									<div class="form-group">
										<label class="col-sm-3 col-md-3 col-lg-2 control-label">练习题题目：</label>
										<div class="col-sm-9 col-md-9 col-lg-10" style="margin-top: 10px;">
											<input type="text" class="form-control input-sm" name="questionInfo" id="questionInfo" value="${examinfo.questionInfo }"/>
										</div>
										<label class="col-sm-3 col-md-3 col-lg-2 control-label">选项A：</label>
										<div class="col-sm-9 col-md-9 col-lg-10" style="margin-top: 10px;">
											<input type="text" class="form-control input-sm" name="choiceA" id="choiceA" value="${examinfo.choiceA }"/>
										</div>
										<label class="col-sm-3 col-md-3 col-lg-2 control-label">选项B：</label>
										<div class="col-sm-9 col-md-9 col-lg-10" style="margin-top: 10px;">
											<input type="text" class="form-control input-sm" name="choiceB" id="choiceB" value="${examinfo.choiceB }"/>
										</div>
										<label class="col-sm-3 col-md-3 col-lg-2 control-label">选项C：</label>
										<div class="col-sm-9 col-md-9 col-lg-10" style="margin-top: 10px;">
											<input type="text" class="form-control input-sm" name="choiceC" id="choiceC" value="${examinfo.choiceC }"/>
										</div>
										<label class="col-sm-3 col-md-3 col-lg-2 control-label">选项D：</label>
										<div class="col-sm-9 col-md-9 col-lg-10" style="margin-top: 10px;">
											<input type="text" class="form-control input-sm" name="choiceD" id="choiceD" value="${examinfo.choiceD }"/>
										</div>
										<label class="col-sm-3 col-md-3 col-lg-2 control-label">正确选项：</label>
										<div class="col-sm-9 col-md-9 col-lg-10" style="margin-top: 10px;">
										 <input type="radio" class="form-control input-sm" name="rightAnswer" id="rightAnswer" value="A" 
										 <c:if test="${examinfo.rightAnswer=='A'}"> checked="checked"</c:if> />选项A
                                         <input type="radio" class="form-control input-sm" name="rightAnswer" id="rightAnswer" value="B"
                                         <c:if test="${examinfo.rightAnswer=='B'}"> checked="checked"</c:if>/>选项B
                                         <input type="radio" class="form-control input-sm" name="rightAnswer" id="rightAnswer" value="C"
                                         <c:if test="${examinfo.rightAnswer=='C'}"> checked="checked"</c:if>/>选项C
                                         <input type="radio" class="form-control input-sm" name="rightAnswer" id="rightAnswer" value="D"
                                         <c:if test="${examinfo.rightAnswer=='D'}"> checked="checked"</c:if>/>选项D
                                       	</div>
									</div>
									

									
									<div class="form-actions">
										<button type="submit" class="btn btn-primary btn-sm" >保存</button>&nbsp;&nbsp; &nbsp; <a class="text-danger" href="${ctx}/admin/course">取消</a>
									</div>
								</form>
							</div>
						</div>						
					</div>
				</div>

				
			</div>
			</div>
	</body>

