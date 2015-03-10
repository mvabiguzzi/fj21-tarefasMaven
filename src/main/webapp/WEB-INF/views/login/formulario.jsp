<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>

<!doctype html>
<html class="no-js" lang="en">
	<head>
		<meta charset="utf-8" />
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<meta name="viewport" content="width=device-width, initial-scale=1.0" />
		
		<title>FJ21-Tarefas</title>
		
		<link rel="stylesheet" href="<c:url value="/resources/css/foundation.css" />" />
		
		<script type="text/javascript" src="<c:url value="/resources/js/vendor/modernizr.js" />" charset="UTF-8"></script>
		<script type="text/javascript" src="<c:url value="/resources/js/vendor/jquery.js" />" charset="UTF-8"></script>
		
		<script type="text/javascript" src="<c:url value="/resources/js/foundation.min.js" />" charset="UTF-8"></script>
		
		<script type="text/javascript" charset="UTF-8">
			(function($) { //immediately invoked function expression para evitar conflito com outras bibliotecas js
				
				$(function() { //short-hand para $(document).ready(function() { jquery code });
					$(document).foundation();
				});
			
			}) (jQuery);
		</script>
	</head>
	<body>
		<div class="row">
			<div class="small-12 columns">
				<h2>P&aacute;gina de Login das Tarefas</h2>
			</div>
		</div>
		<%-- <form:errors path="tarefa.descricao" /> --%>
		<form action="efetuaLogin" method="post">
			<div class="row">
				<div class="small-4 columns">
					<label>Login: <input type="text" name="login" /></label>
				</div>
			</div>
			<div class="row">
				<div class="small-4 columns">
					<label>Senha: <input type="password" name="senha" /></label>
				</div>
			</div>
			<div class="row">
				<div class="small-4 columns">
					<input type="submit" value="Entrar" role="button" class="button" />
				</div>
			</div>
		</form>
		
		<%-- <script type="text/javascript" src="<c:url value="/resources/js/vendor/jquery.js" />" charset="UTF-8"></script>
		<script type="text/javascript" src="<c:url value="/resources/js/foundation.min.js" />" charset="UTF-8"></script>
	    <script>
	      $(document).foundation();
	    </script> --%>
	</body>
</html>