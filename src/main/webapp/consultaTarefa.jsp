<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@page import="java.util.List"%>
<%@page import="Model.entidade.Tarefa"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>CONTROLE DE TAREFAS</title>
<!-- bootstrap -->
<link rel="stylesheet" href="Styles/padraotelagrid.css">
<link
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/css/bootstrap.min.css"
	rel="stylesheet" />
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.0/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/js/bootstrap.min.js"></script>
<!-- Fontawesome' -->
<script src='https://kit.fontawesome.com/a076d05399.js'
	crossorigin='anonymous'></script>
</head>
<body>
	<div class="container">
		<fieldset id="grid">
			<%
			Tarefa tar = new Tarefa();
			List<Tarefa> listaTarefas = tar.consulta();
			
//			System.out.println(listaTarefas);
			
			%>
			<table id="consulta" class="table">
				<!-- cabecalho da tabela -->
				<thead>
					<th>Colaborador</th>
					<th>Descrição</th>
					<th>Status</th>
					<th>Prioridade</th>
					<th>Alterar</th>
					<th>Excluir</th>
				</thead>
				<!-- corpo da tabela -->
				<tbody>
					<% for (Tarefa t : listaTarefas) {	%>
					<tr>
						<td><%= t.getIdColaborador()%> </td>
						<td><% out.write(t.getDescrTarefa());%> </td>
						<td><% out.write(t.getStatusTarefa());%> </td>
						<td><% out.write(t.getPrioridadeTarefa());%> </td>
						<td><i class="far fa-edit" style="color: blue"></i></td>
						<td><i class="far fa-trash-alt" style="color: red"></i></td>
					</tr>
					<%
					}
					%>
				</tbody>
			</table>
		</fieldset>
	</div>
</body>
</html>
