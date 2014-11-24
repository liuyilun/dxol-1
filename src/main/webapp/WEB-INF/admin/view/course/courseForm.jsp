<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="ctx" value="${pageContext.request.contextPath}"/>

	<head>
		<title>添加课程</title>
		
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
		  else
		      {return true}
		  }
		}
		function validate_form(thisform)
		{
		with (thisform)
		  {
		  if (validate_required(courseName,"课程题目不能为空！")==false)
		    {courseName.focus();return false}
		   if (validate_required(identity_id,"所属身份不能为空！")==false)
		    {identity_id.focus();return false}
		  if (validate_required(hour,"课程时间不能为空！")==false)
		    {hour.focus();return false}
		  if (validate_required(reqAlt,"课程性质不能为空！")==false)
		    {reqAlt.focus();return false}
		  if (validate_required(content,"课程内容不能为空！")==false)
		    {content.focus();return false}
		 		  
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
								<h5>课程管理</h5>
							</div>
							<div class="widget-content nopadding">
								<form action="${ctx}/admin/course/${action}" method="post" class="form-horizontal" onsubmit="return validate_form(this)">
									<input type="hidden"name="id" value="${course.id }"/>
									<div class="form-group">
										<label class="col-sm-3 col-md-3 col-lg-2 control-label">课程题目：</label>
										<div class="col-sm-9 col-md-9 col-lg-10">
											<input type="text" class="form-control input-sm" name="courseName" id="courseName" value="${course.courseName }"/>
										</div>
										<label class="col-sm-3 col-md-3 col-lg-2 control-label">课程时间：</label>
										<div class="col-sm-9 col-md-9 col-lg-10">
											<input type="text" class="form-control input-sm" name="hour" id="hour" value="${course.hour }"/>
										</div>
										<label class="col-sm-3 col-md-3 col-lg-2 control-label">所属身份：</label>
										<div class="col-sm-9 col-md-9 col-lg-10">
										<select name="identity_id" id="identity_id">
                                        <option value="0">=选择身份=</option>
                                        <option value="1" 
                                        	<c:if test="${ course.identity.id==1}">selected="selected"	</c:if>
                                        >积极分子</option>
                                        <option value="2"
                                		 <c:if test="${ course.identity.id==2}">selected="selected"	</c:if>
                                        >发展对象</option>
                                        <option value="3"
                                        <c:if test="${ course.identity.id==3}">selected="selected"	</c:if>
                                        >预备党员</option>
                                        <option value="4"
                                        <c:if test="${ course.identity.id==4}">selected="selected"	</c:if>
                                        >正式党员</option>
                                        <option value="5"
                                       <c:if test="${ course.identity.id==5}">selected="selected"	</c:if>
                                        >支部书记</option>
                                         </select>
                                         </div>
										<label class="col-sm-3 col-md-3 col-lg-2 control-label">课程性质：</label>
										<div class="col-sm-9 col-md-9 col-lg-10">
										<select name="reqAlt" id="reqAlt" >
                                        <option value="0">=选择性质=</option>
                                        <option value="1"<c:if test="${ course.reqAlt==1}">selected="selected"	</c:if>
                                        >必修课程</option>
                                        <option value="2"<c:if test="${ course.reqAlt==2}">selected="selected"	</c:if>
                                        >选修课程</option>
                                         </select>
                                         </div>
										<label class="col-sm-3 col-md-3 col-lg-2 control-label">课程内容：</label>
										<div class="col-sm-9 col-md-9 col-lg-10">
											<textarea id="infoContent" name="content" placeholder="在这里输入内容 ..." style="width: 810px; height: 200px">${course.content }</textarea>
										</div>
									</div>
									

									
									<div class="form-actions">
										<button type="submit" class="btn btn-primary btn-sm">保存</button>&nbsp;&nbsp; &nbsp; <a class="text-danger" href="${ctx}/admin/course">取消</a>
									</div>
								</form>
							</div>
						</div>						
					</div>
				</div>

				
			</div>
			</div>
	</body>

