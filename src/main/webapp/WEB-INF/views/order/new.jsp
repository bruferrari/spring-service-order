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
<title><fmt:message key="so.title" /> - <fmt:message key="so.register.title" /></title>
</head>
<body>
	<div class="container">
	<div class="page-header">
		<h1><fmt:message key="so.register.title" /></h1>
	</div>
		<div class="row">
			<div class="col-md-5">
				<form:form action="${s:mvcUrl('OC#register').build()}" method="POST" commandName="order"
					class="form-vertical" role="">
					<div class="input-group">
						<label><fmt:message key="so.order.title" /></label>
						<form:input path="title" class="form-control" placeholder="Digite seu problema aqui"/>
						<div class="alert alert-danger" role="alert">
							<form:errors path="title" />
						</div>
					</div>
			
					<div class="input-group">
						<label><fmt:message key="so.order.desc" /></label>
						<form:textarea rows="10" cols="40" path="description" class="form-control"/>
						<div class="alert alert-danger" role="alert">
							<form:errors path="description" />
						</div>
					</div>
					
					<div class="btn-group" role="group" style="margin-top: 10px">
						<button type="submit" class="btn btn-success"><fmt:message key="so.btn.register" /></button>
						<a class="btn pull-right btn-danger" href="${s:mvcUrl('HC#index').build() }"><fmt:message key="so.btn.cancel" /></a>		
					</div>
				</form:form>
			</div>
		
			<div class="col-md-7">
				<div class="panel panel-default">
					<div class="panel-heading"><fmt:message key="so.user.orders" /></div>
					<div class="panel-body" style="overflow: auto">
						<table class="table table-hover" cellspacing="0">
							<tr>
								<td style="font-weight: bold;"><fmt:message key="so.order.title" /></td>
								<td style="font-weight: bold;"><fmt:message key="so.order.date" /></td>
								<td style="font-weight: bold;"><fmt:message key="so.order.status" /></td>
							</tr>
							<c:forEach items="${orders}" var="order">
								<tr>
									<td>${order.title}</td>
									<td><fmt:formatDate value="${order.openDate.time}"/></td>
									<td>${order.status.description}</td>
								</tr>
							</c:forEach>
						</table>
					</div>
				</div>
			</div>
			</div>
		</div>

</body>
</html>