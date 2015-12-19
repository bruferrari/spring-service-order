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
		<h1><fmt:message key="so.list.title" /></h1>
	</div>
		<div class="row">
		
		<c:forEach items="${orders}" var="order">
			  <div class="col-sm-6 col-md-4">
			    <div class="thumbnail">
			      <div class="caption">
			        <h3>${fn:substring(order.title, 0, 60)}</h3>
			        <p><fmt:formatDate pattern="dd/MM/yyyy" value="${order.openDate.time}" /></p>
			        <p>${fn:substring(order.description, 0, 150)}</p>
			        
			         <security:authorize access="hasRole('ROLE_ADMIN')">
					        	<a href="${s:mvcUrl('AC#answerForm').arg(0, order.id).build() }" class="btn btn-success" 
					        			role="button"><fmt:message key="so.btn.answer" /></a>
					 </security:authorize>
			       	 <a href="${s:mvcUrl('OC#view').arg(0, order.id).build() }" class="btn btn-primary" role="button"
			        	style="margin-left: 100px" >
			        	<fmt:message key="so.btn.view" /></a>
			      </div>
			    </div>
			  </div>
			</c:forEach>
			
		</div>
	</div>
</body>
</html>