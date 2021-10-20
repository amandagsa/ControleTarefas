<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@page import="java.util.List"%>
<%@page import="Model.entidade.Tarefa"%>
<%@page import="Model.entidade.Colaborador"%>
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
						
			%>
			<table id="consulta" class="table">
				<!-- cabecalho da tabela -->
				<thead>
					<th>Colaborador</th>
					<th>Descrição</th>
					<th>Início</th>
					<th>Fim</th>
					<th>Status</th>
					<th>Prioridade</th>
					<th>Alterar</th>
					<th>Excluir</th>
				</thead>
				<!-- corpo da tabela -->
				<tbody>
					<% for (Tarefa t : listaTarefas) {	%>
					<form action="modificarTarefa" method="POST">
						<tr>
							<td><%=(t.getIdColaborador())%> </td>
							<input type="hidden" name="id" value="<% out.print(t.getIdTarefa()); %>">
							<td><% out.write(t.getDescrTarefa());%> </td>
							<td><%=(t.getDataHoraInicioFormat())%> </td>
							<td><%=(t.getDataHoraFimFormat())%> </td>
							<td><% out.write(t.getStatusTarefa());%> </td>
							<td><% out.write(t.getPrioridadeTarefa());%> </td>
							<td><%out.write("<a href=editarTarefa.jsp?idTarefa="  + "" + t.getIdTarefa() + ">" + "<i class='far fa-edit' style='color:blue'></i>" + "</a>");%></td>
							<td>
								<button type="submit" name="excluir" value="Excluir">
								<i class='far fa-trash-alt' style='color: red'></i> </button>
							</td>
						</tr>
					</form>
					<% } %>
				</tbody>
							</table>
        			<label class="msg" style="text-align: center; font-size: 20px; ">
				<%
					if (request.getParameter("pmensagem") != null)
					 	out.write(request.getParameter("pmensagem"));
				 %>
			</label>
			</table>
		</fieldset>
	</div>
</body>
</html>
