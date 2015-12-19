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
<title><fmt:message key="so.title" /> - <fmt:message key="so.user.list" /></title>
</head>
<body>
	<div class="container">
	<div class="page-header">
		<h1><fmt:message key="so.user.list" /></h1>
	</div>
		<div class="row">
			    <table class="table table-hover">
			    	<tr>
			    		<th><fmt:message key="so.user.list.name" /></th>
			    		<th><fmt:message key="so.user.list.email" /></th>
			    		<th><fmt:message key="so.user.list.date" /></th>
			    		<th><fmt:message key="so.list.actions" /></th>
			    	</tr>
			    	<c:set var="count" value="0" scope="page" />
			    	<c:forEach items="${users}" var="user">
			    		<c:set var="count" value="${count + 1}" scope="page"/>
				    	<tr>
				    		<td>${user.name }</td>
				    		<td>${user.email}</td>
				    		<td><fmt:formatDate pattern="dd/MM/yyyy" value="${user.registerDate.time}" /></td>
				    		<td>
				    			<a href="#" class="btn btn-default">
				    				<span class="glyphicon glyphicon-search" aria-hidden="true"></span>
				    			</a>
				    			<a href="#" class="btn btn-default">
									<span class="glyphicon glyphicon-trash" aria-hidden="true"
										data-toggle="modal" data-target="#userRemoveModal${count}" ></span>
								</a>
				    		</td>
				    	</tr>
				    	
				    	<!-- details modal -->

						<div class="modal fade" tabindex="-1" role="dialog" id="userRemoveModal${count}">
						  <div class="modal-dialog">
						    <div class="modal-content">
						      <div class="modal-header">
						        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
						        <h4 class="modal-title">Deseja realmente excluir o usuario?</h4>
						      </div>
						      <form:form action="${s:mvcUrl('UC#delete').arg(0, user.email).build() }" method="post">
						      	<div class="modal-body">
						      
							        <div class="form-group">
							        	<label>Nome</label>
							        	<p>${user.name }</p>
							        </div>
							        
							        <div class="form-group">
							        	<label>Email</label>
							        	<p>${user.email }</p>
							        </div>
							        
							        <div class="form-group">
							        	<label>Roles</label>
							        	<c:forEach items="${user.roles }" var="role">
							        		<p>${role.roleName}</p>
							        	</c:forEach>
							        	
							        </div>
						        
						      </div>
						      <div class="modal-footer">
						        <button type="button" class="btn btn-default" data-dismiss="modal">Não</button>
						        <button type="submit" class="btn btn-primary">Sim</button>
						      </div>
						      </form:form>
						    </div><!-- /.modal-content -->
						  </div><!-- /.modal-dialog -->
						</div><!-- /.modal -->
						
			    	</c:forEach>
			    </table>

			
			
		</div>
	</div>
</body>
</html>