<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<title>FJ21-Tarefas</title>
		
		<%-- <link href="<c:url value="/resources/css/jquery-ui.css" />" rel="stylesheet" charset="UTF-8" /> --%>
		
		<script type="text/javascript" src="<c:url value="/resources/js/jquery.js" />" charset="UTF-8"></script>
		<script type="text/javascript" src="<c:url value="/resources/js/jquery-migrate.js" />" charset="UTF-8"></script>
		<%-- <script type="text/javascript" src="<c:url value="/resources/js/jquery-ui.js" />"  charset="UTF-8"></script> --%>
		
		<script type="text/javascript" charset="UTF-8">
			(function($) { //immediately invoked function expression para evitar conflito com outras bibliotecas js
				
				$(function() { //short-hand para $(document).ready(function() { jquery code }); 
					$(".finalizarAgora").click(function(e) {//alert('teste');
						e.preventDefault();
						
						var tarefaId = $(this).attr('id').split('_')[1];
						
						var urlDestino = "finalizaTarefa";
						var data = {
								id: tarefaId
						}
						
						$.post(urlDestino,data,"html").done(function(resposta) {
							$("#tarefa_"+tarefaId).html(resposta);
						}).fail(function() {
							alert("Ocorreu um erro no ajax");
						});
					});
				});
				
			}) (jQuery);
		</script>
	</head>
	<body>
		<a href="novaTarefa">Criar nova tarefa</a><br />
		<br />
		<table>
			<tr>
				<th>Id</th>
				<th>Descri&ccedil;&atilde;o</th>
				<th>Finalizado</th>
				<th>Data Finaliza&ccedil;&atilde;o</th>
				<th></th>
				<th></th>
			</tr>
			<c:forEach items="${tarefas}" var="tarefa">
				<tr id="tarefa_${tarefa.id}">
					<td>${tarefa.id}</td>
					<td>${tarefa.descricao}</td>
					<%-- <td>${tarefa.finalizado eq false ? "N&atilde;o Finalizado" : "Finalizado"}</td> --%>
					<td>
						<c:choose>
							<c:when test="${tarefa.finalizado eq false}">
								<a href="#" class="finalizarAgora" id="finalizarAgora_${tarefa.id}">Finalizar Agora!</a>
							</c:when>
							<c:otherwise>
								Finalizado!
							</c:otherwise>
						</c:choose>
					</td>
					<td><fmt:formatDate value="${tarefa.dataFinalizacao.time}" pattern="dd/MM/yyyy" /></td>
					<td><a href="mostraTarefa?id=${tarefa.id}">Alterar</a></td>
					<td><a href="removeTarefa?id=${tarefa.id}">Remover</a></td>
			</c:forEach>
		</table>
	</body>
</html>