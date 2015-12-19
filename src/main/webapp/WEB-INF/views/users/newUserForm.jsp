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
<title><fmt:message key="so.title" /> - Cadastro de usuários</title>
</head>
<body>
	<div class="container">
	<div class="page-header">
		<h1>Cadastro de usuários</h1>
	</div>
		<div class="row">
			<div class="col-md-6">
				<form:form action="${s:mvcUrl('UC#newUser').build() }" method="POST" commandName="user"
					class="form-vertical" role="">
					<div class="form-group">
						<label>Nome</label>
						<form:input path="name" cssClass="form-control"/>
					</div>
					
					<div class="form-group">
						<label>Email</label>
						<form:input path="email" cssClass="form-control" placeholder="example@example.com"/>
					</div>
			
					<div class="form-group">
						<label>Senha</label>
						<form:password path="password" cssClass="form-control"/>
					</div>
					
					<div class="form-group">
						<label>Permissões</label>
						<form:checkboxes class="checkbox" items="${roles}" path=""/>
					</div>
					
					<div class="btn-group" role="group" style="margin-top: 10px">
						<button type="submit" class="btn btn-success">Cadastrar</button>
						<a class="btn pull-right btn-danger" href="${s:mvcUrl('HC#index').build() }"><fmt:message key="so.btn.cancel" /></a>		
					</div>
				</form:form>
			</div>
			</div>
		</div>

</body>
</html>