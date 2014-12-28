<%@tag pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<div class=" btn-group pull-right" style="margin-right: 1px;">
	<button  class="btn btn-inverse btn-sm" dropdown-toggle" data-toggle="dropdown" > 排序:
		${sortTypes[param.sortType]} <b class="caret"></b>
	</button>
	<ul class="dropdown-menu dropdown-inverse">
		<c:forEach items="${sortTypes}" var="entry">
			<li><a href="?sortType=${entry.key}&${searchParams}">${entry.value}</a></li>
		</c:forEach>
	</ul>
</div>