<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="ctx" value="${pageContext.request.contextPath}"/>

	<head>
		<title>添加试题</title>
		
	    <link rel="stylesheet" type="text/css" href="${ctx}/static/bootstrap3-wysihtml5-master/src/bootstrap-wysihtml5.css" />
	    <script src="${ctx}/static/bootstrap3-wysihtml5-master/lib/js/wysihtml5-0.3.0.js"></script>
   		<script src="${ctx}/static/bootstrap3-wysihtml5-master/src/bootstrap3-wysihtml5.js"></script>
   		<script src="${ctx}/static/bootstrap3-wysihtml5-master/src/locales/bootstrap-wysihtml5.zh-CN.js"></script>
		
		<script type="text/javascript">
		$(document).ready(function(){
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
		  if (value==null||value==""||value==0)
		    {alert(alerttxt);return false}
		  else {return true}
		  }
		}

		function validate_form(thisform)
		{
		with (thisform)
		  {
		  if (validate_required(questionInfo,"试题题目不能为空！")==false)
		    {questionInfo.focus();return false}
		   if (validate_required(identity_id,"所属身份不能为空！")==false)
		    {identity_id.focus();return false}
		  if (validate_required(choiceA,"选项A不能为空！")==false)
		    {choiceA.focus();return false}
		  if (validate_required(choiceB,"选项B不能为空！")==false)
		    {choiceB.focus();return false}
		  if (validate_required(choiceC,"选项C不能为空！")==false)
		    {choiceC.focus();return false}
		  if (validate_required(choiceD,"选项D不能为空！")==false)
		    {choiceD.focus();return false}
		  if (validate_required(rightAnswer,"正确选项不能为空！")==false)
		    {rightAnswer.focus();return false}
		  
		  }
		}
		</script>	
		
		
	</head>	
	<body >
	
			<div id="content">
				<div id="breadcrumb">
					<a href="#" title="Go to Home" class="tip-bottom"><i class="fa fa-home"></i> Home</a>
					<a href="#" class="current">Dashboard</a>
				</div>

				<div class="container-fluid">
				<div class="row">
					<div class="col-xs-12">
						<div class="widget-box">
							<div class="widget-title">
								<span class="icon">
									<i class="fa fa-pencil"></i>									
								</span>
								<h5>试题管理</h5>
							</div>
							<div class="widget-content nopadding">
								<form name="exam" action="${ctx}/admin/examinfo/${action}" method="post" class="form-horizontal" onsubmit="return validate_form(this)">
									<input type="hidden"name="id" value="${examinfo.id }"/>
									<div class="form-group">
										<label class="col-sm-3 col-md-3 col-lg-2 control-label">试题题目：</label>
										<div class="col-sm-9 col-md-9 col-lg-10">
											<input type="text" class="form-control input-sm" name="questionInfo" id="questionInfo" value="${examinfo.questionInfo }"/>
										</div>
									    <label class="col-sm-3 col-md-3 col-lg-2 control-label">所属身份：</label>
										<div class="col-sm-9 col-md-9 col-lg-10">
										<select name="identity_id" id="identity_id" >
                                        <option value="0">=选择身份=</option>
                                        <option value="1" 
                                        	<c:if test="${ examinfo.identity.id==1}">selected="selected"</c:if>
                                        >积极分子</option>
                                        <option value="2"
                                		 <c:if test="${ examinfo.identity.id==2}">selected="selected"	</c:if>
                                        >发展对象</option>
                                        <option value="3"
                                        <c:if test="${ exinfo.identity.id==3}">selected="selected"	</c:if>
                                        >预备党员</option>
                                        <option value="4"
                                        <c:if test="${ exinfo.identity.id==4}">selected="selected"	</c:if>
                                        >正式党员</option>
                                        <option value="5"
                                       <c:if test="${ exinfo.identity.id==5}">selected="selected"	</c:if>
                                        >支部书记</option>
                                         </select>
                                         </div>
										<label class="col-sm-3 col-md-3 col-lg-2 control-label">选项A：</label>
										<div class="col-sm-9 col-md-9 col-lg-10">
											<input type="text" class="form-control input-sm" name="choiceA" id="choiceA" value="${examinfo.choiceA }"/>
										</div>
										<label class="col-sm-3 col-md-3 col-lg-2 control-label">选项B：</label>
										<div class="col-sm-9 col-md-9 col-lg-10">
											<input type="text" class="form-control input-sm" name="choiceB" id="choiceB" value="${examinfo.choiceB }"/>
										</div>
										<label class="col-sm-3 col-md-3 col-lg-2 control-label">选项C：</label>
										<div class="col-sm-9 col-md-9 col-lg-10">
											<input type="text" class="form-control input-sm" name="choiceC" id="choiceC" value="${examinfo.choiceC }"/>
										</div>
										<label class="col-sm-3 col-md-3 col-lg-2 control-label">选项D：</label>
										<div class="col-sm-9 col-md-9 col-lg-10">
											<input type="text" class="form-control input-sm" name="choiceD" id="choiceD" value="${examinfo.choiceD }"/>
										</div>
										<label class="col-sm-3 col-md-3 col-lg-2 control-label">正确选项：</label>
										<div class="col-sm-9 col-md-9 col-lg-10">
											<input type="text" class="form-control input-sm" name="rightAnswer" id="rightAnswer" value="${examinfo.rightAnswer }"/>
										</div>
									</div>
									

									
									<div class="form-actions">
										<button type="submit" class="btn btn-primary btn-sm" >保存</button>&nbsp;&nbsp; &nbsp; <a class="text-danger" href="${ctx}/admin/examinfo">取消</a>
									</div>
								</form>
							</div>
						</div>						
					</div>
				</div>

				
			</div>
			</div>
	</body>

