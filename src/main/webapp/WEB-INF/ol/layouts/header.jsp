<%@ page language="java" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="shiro" uri="http://shiro.apache.org/tags" %>
<c:set var="ctx" value="${pageContext.request.contextPath}"/>

	<nav class="navbar navbar-default navbar-static-top" role="navigation" style="margin-bottom: 0">
            <div class="navbar-header">
                <a class="navbar-brand" href="index.html"><strong>党校在线学习平台</strong></a>
            </div>
            <!-- /.navbar-header -->

            <ul class="nav navbar-top-links navbar-right">
                <!-- /.dropdown -->
                <li class="dropdown">
                    <a class="dropdown-toggle" data-toggle="dropdown" href="#">
                        <i class="fa fa-tasks fa-fw"></i>  <i class="fa fa-caret-down"></i>
                    </a>
                    <ul class="dropdown-menu dropdown-tasks">
                        <c:forEach items="${currentStudent.courses}" var="studentCourse" begin="0" end="3" >
                        <c:if test="${studentCourse!=null }"></c:if>
                        <li>
                        	<c:set var="per" value="${studentCourse.time/(studentCourse.course.hour*60) }"/>
                        	
                            <a href="#">
                                <div>
                                    <p>
                                        <strong>${studentCourse.course.courseName }</strong>
                                        <span class="pull-right text-muted">已完成 <fmt:formatNumber value="${per}" type="percent"/> </span>
                                    </p>
                                    <div class="progress progress-striped active">
                                        <div class="progress-bar progress-bar-info" role="progressbar" aria-valuenow="${per*100}" aria-valuemin="0" aria-valuemax="100" style="width:  ${per*100}%">
                                            <span class="sr-only">${per*100}% Complete</span>
                                        </div>
                                    </div>
                                </div>
                            </a>
                        </li>
                        <li class="divider"></li>
                        </c:forEach>
                        <li>
                            <a class="text-center" href="${ctx}/ol/studycourse">
                                <strong>查看所有课程</strong>
                                <i class="fa fa-angle-right"></i>
                            </a>
                        </li>
                    </ul>
                    <!-- /.dropdown-tasks -->
                </li>
                <!-- /.dropdown -->
                <!-- /.dropdown -->
                <li class="dropdown">
                    <a class="dropdown-toggle" data-toggle="dropdown" href="#">
                        <i class="fa fa-user fa-fw"></i>  <i class="fa fa-caret-down"></i>
                    </a>
                     <ul class="dropdown-menu dropdown-user">
                        <li><a href="${ctx}/ol/profile"><i class="fa fa-gear fa-fw"></i>密码修改</a>
                        </li>
                        <li class="divider"></li>
                        <li><a href="${ctx}/logout"><i class="fa fa-sign-out fa-fw"></i>安全退出</a>
                        </li>
                    </ul>
                    <!-- /.dropdown-user -->
                </li>
                <!-- /.dropdown -->
            </ul>
            <!-- /.navbar-top-links -->

            <div class="navbar-default sidebar" role="navigation">
                <div class="sidebar-nav navbar-collapse">
                    <ul class="nav" id="side-menu">
                        <li>
                            <a href="${ctx }/"><i class="fa fa-table fa-fw"></i> 首页</a>
                        </li>
                        <li>
                            <a href="${ctx}/ol/studycourse"><i class="fa fa-dashboard fa-fw"></i> 在线学习</a>
                        </li>
                        <li>
                            <a href="${ctx}/ol/test"><i class="fa fa-table fa-fw"></i> 在线考试</a>
                        </li>
                      
                      
                       
                    </ul>
                </div>
                <!-- /.sidebar-collapse -->
            </div>
            <!-- /.navbar-static-side -->
        </nav>