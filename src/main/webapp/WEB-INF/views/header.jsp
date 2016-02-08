<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="s" %>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="security" %>
<!DOCTYPE html>
<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script src="<c:url value="/resources/js/jquery-1.11.3.min.js" />"></script>
<link href="<c:url value="/resources/css/bootstrap.min.css" />" rel="stylesheet" />
<link href="<c:url value="/resources/app/css/styles.css" />" rel="stylesheet" />
<script src="<c:url value="/resources/app/js/app.js" />"></script>
<script src="<c:url value="/resources/js/bootstrap.min.js" />"></script>

<nav class="navbar navbar-default">
  <div class="container-fluid">
    <!-- Brand and toggle get grouped for better mobile display -->
    <div class="navbar-header">
      <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1" aria-expanded="false">
        <span class="sr-only">Toggle navigation</span>
        <span class="icon-bar"></span>
        <span class="icon-bar"></span>
        <span class="icon-bar"></span>
      </button>
      <a class="navbar-brand" href="${s:mvcUrl('HC#index').build() }"><fmt:message key="so.title" /></a>
    </div>

    <!-- Collect the nav links, forms, and other content for toggling -->
    <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
      <ul class="nav navbar-nav navbar-right">
      <li><a href="${s:mvcUrl('HC#index').build() }"><fmt:message key="so.menu.order.dashboard" /> <span class="sr-only">(current)</span></a></li>
        <security:authorize access="isAuthenticated()">
	        <li><a href="${s:mvcUrl('OC#form').build() }"><fmt:message key="so.menu.order.new" /></a></li>
        </security:authorize>
        <li class="dropdown">
        	<security:authorize access="isAuthenticated()">
        		 <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" 
        		 	aria-expanded="false"><security:authentication property="principal" var="user"/>${user.name }
          		<span class="caret"></span></a>
        	</security:authorize>
         
          <ul class="dropdown-menu">
            <li><a href="${s:mvcUrl('OC#allOrders').build() }"><fmt:message key="so.menu.dropdown.all" /></a></li>
            <li><a href="${s:mvcUrl('UC#registerUser').build() }"><fmt:message key="so.user.register.title" /></a></li>
            <li><a href="${s:mvcUrl('UC#list').build() }"><fmt:message key="so.user.list" /></a></li>
            <li role="separator" class="divider"></li>
            <li><a href="/spring-service-order/logout">Sair</a></li>
          </ul>
        </li>
        
        <security:authorize access="!isAuthenticated()">
	        <li class="dropdown">
	          <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false">Login <span class="caret"></span></a>
	          <ul id="login-dp" class="dropdown-menu">
	            <li>
	            	<div class="row">
						<div class="col-md-12">
					
						<form class="form" name="loginForm" action="<c:url value='/login' />" method="POST">
							<div class="form-group">
								<label for="email">e-mail</label>
								<input type="text" id="username" name="username" class="form-control" placeholder="your personal e-mail" required/>
							</div>
							
							<div class="form-group">
								<label for="password">Password</label>
								<input type="password" id="password" name="password" class="form-control" placeholder="your password goes here" required>
							</div>
							
							<div class="btn-group">
								<button type="submit" class="btn btn-primary">Login</button>
							</div>
						</form>
					</div>
				</div>
	            
	            </li>
	            
	          </ul>
	        </li>
        </security:authorize>
        
      </ul>
    </div><!-- /.navbar-collapse -->
  </div><!-- /.container-fluid -->
</nav>
</head>
</html>