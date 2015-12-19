<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@ taglib uri="http://www.springframework.org/tags" prefix="s" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ include file="../header.jsp" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title><fmt:message key="so.title" /> - <fmt:message key="so.list.title" /></title>
</head>
<body>
	<div class="container">
	<div class="page-header">
		<h1><fmt:message key="so.order.all.title" /></h1>
	</div>
		<div class="row">
			    <table class="table table-hover">
			    	<tr>
			    		<th><fmt:message key="so.order.title" /></th>
			    		<th><fmt:message key="so.order.date" /></th>
			    		<th><fmt:message key="so.order.status" /></th>
			    		<th>Respostas</td>
			    		<th>Ações</td>
			    	</tr>
			    	
			    	<c:forEach items="${orders}" var="order">
				    	<tr>
				    		<td>${fn:substring (order.title, 0, 100)}</td>
				    		<td><fmt:formatDate pattern="dd/MM/yyyy" value="${order.openDate.time}" /></td>
				    		<td>${order.status.description}</td>
				    		<td></td>
				    		<td>
				    			<c:if test="${(order.status.id == 0) || (order.status.id == 2)}">
				    				<a href="#" class="btn btn-success"><fmt:message key="so.btn.answer" /></a>
				    			</c:if>
				    			<a href="viewOrder?id=${order.id}" class="btn btn-primary"><fmt:message key="so.btn.view" /></a>
				    		</td>
				    	</tr>
			    	</c:forEach>
			    </table>
			
		</div>
	</div>
</body>
</html>