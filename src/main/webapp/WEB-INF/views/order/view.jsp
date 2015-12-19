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
	<div class="page-header">
		<h1><fmt:message key="so.show.title" /></h1>
	</div>
		<div class="row">
				<div class="panel panel-default">
					<div class="panel-heading">
						<strong>${order.title}</strong>
						<div class="pull-right"><fmt:formatDate pattern="dd/MM/yyyy hh:mm" value="${order.openDate.time}" /></div>
						</div>
					<div class="panel-body" style="overflow: auto">
						<p>Status: ${order.status.description}</p>
						<blockquote>
							<p>${order.description}</p>	
							<footer>${order.author.name} - ${order.author.email}</footer>					
						</blockquote>
					</div>
				</div>
				
				<c:forEach items="${answers}" var="answer">
					<div class="panel panel-default">
					<div class="panel panel-heading">
						Resposta - Ticket #${answer.id}
						<div class="pull-right"><fmt:formatDate pattern="dd/MM/yyyy hh:mm" value="${answer.date.time}" /></div>
					</div>
					<div class="panel-body">
						<blockquote>
							<p>${answer.answer}</p>
							<footer>${answer.author.name} - ${answer.author.email}</footer>
						</blockquote>
					</div>
				</div>
				</c:forEach>
				
				
		</div>
	</div>

</body>
</html>