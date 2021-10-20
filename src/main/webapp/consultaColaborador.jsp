<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@page import="java.util.List"%>
<%@page import="Model.entidade.Colaborador"%>
<!DOCTYPE html>
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title>CONTROLE DE TAREFAS</title>
	<!-- bootstrap -->
	<link rel="stylesheet" href="Styles/padraotelagrid.css">
	<link href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/css/bootstrap.min.css" rel="stylesheet" />
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.0/jquery.min.js"></script>
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/js/bootstrap.min.js"></script>
	<script src='https://kit.fontawesome.com/a076d05399.js' crossorigin='anonymous'></script>
</head>
<body>
<body>
	<div class="container">
		<fieldset id="grid">
			<%
				Colaborador col = new Colaborador();
				List<Colaborador> listaColaboradores = col.consulta();
			%>
			
			<table id="consulta" class="table">
				<!-- cabecalho da tabela -->
				<thead>
					<th>ID</th>
					<th>Colaborador</th>
					<th>Alterar</th>
					<th>Excluir</th>
				</thead>				
				<!-- corpo da tabela -->
				<tbody>				
					<% for (Colaborador c : listaColaboradores) { %>
					<form action="modificarColaborador" method="POST">
					<tr>
						<td> <%=c.getIdColaborador()%>
						<input type="hidden" name="id" value="<% out.print(c.getIdColaborador()); %>">
						</td>
						<td> <% out.write(c.getNomeColaborador());%>
						</td>
						<td><%out.write("<a href=editarColaborador.jsp?idColaborador="  + "" + c.getIdColaborador() + ">" + "<i class='far fa-edit' style='color:blue'></i>" + "</a>");%></td>
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
        </fieldset>
        </div>      
</html>
