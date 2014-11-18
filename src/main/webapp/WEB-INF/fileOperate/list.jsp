<%@ page language="java" contentType="text/html; charset=UTF-8"  
    pageEncoding="UTF-8"%>  
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>  
<!DOCTYPE html  
PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN"  
"http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">  
<html>  
<head>  
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />  
<title>Insert title here</title>  
</head>  
<body>  
   <%--  <c:forEach items="${result }" var="item">  
        <c:forEach items="${item }" var="m">  
            <c:if test="${m.key eq 'realName' }">  
                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;${m.value }  
            </c:if>  
            <br />  
        </c:forEach>  
    </c:forEach>   --%>
    
    <div id="content">
			<div id="content-header">
				<h1>文件管理</h1>
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
							<h5>文件列表</h5>
						</div>
						<div class="widget-content nopadding">
							<table
								class="table table-bordered table-striped table-hover data-table">
								<thead>
									
								</thead>
								<tbody>
									<c:forEach items="${result }" var="item">  
        								<c:forEach items="${item }" var="m">  
           									 <c:if test="${m.key eq 'realName' }">  
										<tr class="gradeX">
											
											<td align="center">${m.value }</td>
										</tr>
										</c:if>
										</c:forEach>	
									</c:forEach>
								</tbody>
							</table>
						</div>
					</div>
				</div>
			</div>
		</div>
</body>
</body>  
</html>  
