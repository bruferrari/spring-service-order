<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ include file="header.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Login - Sistema de Ordem de Serviço</title>
</head>
<body id="login-body">
	<div class="container">
	
		<c:if test="${param.error ne null}">
			<div class="alert alert-danger" role="alert">
				<fmt:message key="login.badcredentials" />
				<button type="button" class="close" data-dismiss="alert" aria-label="Close"><span aria-hidden="true">&times;</span></button>
			</div>
		</c:if>
		
		<c:if test="${param.logout ne null}">
			<div class="alert alert-warning" role="alert">
				<fmt:message key="login.logout" />
				<button type="button" class="close" data-dismiss="alert" aria-label="Close"><span aria-hidden="true">&times;</span></button>
				</div>
		</c:if>
		
		<h1 class="login-titles">Seja bem-vindo</h1>
		<p class="login-titles">Faça o login no canto superior direito da tela para ter acesso as funcionalidades do sistema</p>
		<p class="login-titles">Caso tenha problemas com suas creenciais de entrada, por favor notifique o administrador do sistema</p>
</body>
</html>