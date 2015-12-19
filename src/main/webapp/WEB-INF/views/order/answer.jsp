<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@ taglib uri="http://www.springframework.org/tags" prefix="s" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ include file="../header.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title><fmt:message key="so.title" /> - <fmt:message key="so.show.title" /></title>
</head>
<body>
	<div class="container">
	<h1><fmt:message key="so.show.title" /></h1>
		<div class="row">
			<div class="col-md-6">
				<div class="panel panel-default">
					<div class="panel-heading">${order.title}</div>
					<div class="panel-body" style="overflow: auto">
						<p><fmt:formatDate pattern="dd/MM/yyyy" value="${order.openDate.time}" /></p>
						<p>Status: ${order.status.description}</p>
						<p>${order.description}</p>
					</div>
				</div>
				
				<c:forEach items="${answers}" var="answer">
					<div class="panel panel-default">
						<div class="panel-heading">Resposta - Ticket #${answer.id}</div>
						<div class="panel-body">
							<p>Por: ${answer.author.name } - ${answer.author.email }</p>
							<p>em <fmt:formatDate pattern="dd/MM/yyyy" value="${answer.date.time }" /></p>
							<p>${answer.answer}</p>
						</div>
					</div>
				</c:forEach>
			</div>
			
			<div class="col-md-6">
			
				<div class="panel panel-default">
					<div class="panel-heading"><fmt:message key="so.order.ans" /></div>
					<div class="panel-body">
						<form:form action="${s:mvcUrl('AC#register').build()}" method="POST" commandName="answer">
						<div class="input-group">
							<label><fmt:message key="so.order.status" /></label>
							<%-- <form:select path="status" class="form-control">
								<form:options items="${statuses}"/>
							</form:select> --%>
						</div>
					
						<div class="input-group">
							<label><fmt:message key="so.order.ans" /></label>
							<form:textarea class="form-control" path="answer" rows="10" cols="60"/>	
							<form:hidden path="id"/>
						</div>
						
						<div class="btn-group" style="margin-top: 10px">
							<button type="submit" class="btn btn-success"><fmt:message key="so.btn.send" /></button>
							<a href="<c:url value="/order" />" class="btn btn-default"><fmt:message key="so.btn.cancel" /></a>
						</div>			
					</form:form>
					</div>
				
				</div>
			</div>
		</div>
	</div>

</body>
</html>