<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="ctx" value="${pageContext.request.contextPath}" />
<c:set var="currentStudent" value="${sessionScope.currentStudent}" />
<!DOCTYPE html>
<html >

<head>
    <title></title>
</head>

<body>

    <div id="wrapper">

        <!-- Navigation -->
        

        <div id="page-wrapper">
            <div class="row">
                <div class="col-lg-12">
                    <h1 class="page-header">个人信息</h1>
                </div>
            </div>
            
            <!-- /.row -->
            <div class="row">
                <!-- /.col-lg-8 -->
                <div class="col-lg-8">
                    <div class="panel panel-default">
                        <div class="panel-heading">
                            <i class="fa fa-user fa-fw"></i> 密码修改
                        </div>
                        <!-- /.panel-heading -->
                        <div class="panel-body ">
                            <!-- /.list-group -->
                            <form role="form" id="inputForm" method="post" action="${ctx}/ol/profile">
                           	 <input type="hidden"name="id" value="${currentStudent.id }"/>
                                 <div class="form-group">
                                     <label>用户名（学号）:</label>
                                     <input class="form-control" disabled="disabled" value="${currentStudent.username}">
                                 </div>
                                 <div class="form-group">
                                     <label>新密码:</label>
                                     <input type="password" id="plainPassword" name="plainPassword" class="form-control" placeholder="...如果不修改请置空"/>
                                 </div>
                                 <div class="form-group">
                                     <label>重复密码:</label>
                                     <input type="password" id="confirmPassword" name="confirmPassword" class="form-control" equalTo="#plainPassword" />
                                 </div>
                                 <button type="submit" class="btn btn-default">提交</button>
                                 <button type="reset" class="btn btn-default">重置</button>
                             </form>
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

	<script src="${ctx}/static/unicorn/js/jquery.validate.js"></script>
   <script type="text/javascript">
   
	$(document).ready(function(){
		$("#inputForm").validate({
		  messages: {
			    confirmPassword: "两次输入密码必修相同",
			  },
			  errorClass: "help-inline",
				errorElement: "span",
				highlight:function(element, errorClass, validClass) {
					$(element).parents('.form-group').addClass('has-error');
				},
				unhighlight: function(element, errorClass, validClass) {
					$(element).parents('.form-group').removeClass('has-error');
					$(element).parents('.form-group').addClass('has-success');
				}
		});
	});
	</script>
   
</body>

</html>
