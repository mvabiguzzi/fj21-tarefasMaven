<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<title>FJ21-Tarefas</title>
	</head>
	<body>
		<h3>Alterar tarefa - ${tarefa.id}</h3>
		<form action="alteraTarefa" method="post">
			<input type="hidden" name="id" value="${tarefa.id}" />
			Descri&ccedil;&atilde;o:<br />
			<textarea name="descricao" rows="5" cols="100">${tarefa.descricao}</textarea><br />
			Finalizado: <input type="checkbox" name="finalizado" value="true" ${tarefa.finalizado ? 'checked' : ''} /><br />
			Data Finaliza&ccedil;&atilde;o: <input type="text" name="dataFinalizacao" value="<fmt:formatDate value="${tarefa.dataFinalizacao.time}" pattern="dd/MM/yyyy" />" /><br />
			<input type="submit" value="Alterar" />
		</form>
	</body>
</html>