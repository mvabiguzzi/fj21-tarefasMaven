<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>

<td>${tarefa.id}</td>
<td>${tarefa.descricao}</td>
<td id="tarefa_${tarefa.id}">Finalizado!</td>
<td><fmt:formatDate value="${tarefa.dataFinalizacao.time}" pattern="dd/MM/yyyy" /></td>
<td><a href="mostraTarefa?id=${tarefa.id}">Alterar</a></td>
<td><a href="removeTarefa?id=${tarefa.id}">Remover</a></td>