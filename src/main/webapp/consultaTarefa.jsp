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
		<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
		<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>
		<script src="https://kit.fontawesome.com/c46313bd5e.js" crossorigin="anonymous"></script>
	</head>
<body>
<nav class="navbar navbar-expand-lg navbar-dark bg-dark">
  <div class="container-fluid">
    <a class="navbar-brand" href="index.html">HOME</a>
    <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
      <span class="navbar-toggler-icon"></span>
    </button>
    <div class="collapse navbar-collapse" id="navbarSupportedContent">
      <ul class="navbar-nav me-auto mb-2 mb-lg-0">
        <li class="nav-item dropdown">
          <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button" data-bs-toggle="dropdown" aria-expanded="false">
            Cadastrar
          </a>
          <ul class="dropdown-menu" aria-labelledby="navbarDropdown">
            <li><a class="dropdown-item" href="cadastraTarefa.jsp">Tarefa</a></li>
            <li><hr class="dropdown-divider"></li>
            <li><a class="dropdown-item" href="cadastraColaborador.jsp">Colaborador</a></li>
          </ul>
		</li>
		<li class="nav-item dropdown">
          <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button" data-bs-toggle="dropdown" aria-expanded="false">
            Consultar
          </a>
          <ul class="dropdown-menu" aria-labelledby="navbarDropdown">
            <li><a class="dropdown-item" href="consultaTarefa.jsp">Tarefa</a></li>
            <li><hr class="dropdown-divider"></li>
            <li><a class="dropdown-item" href="consultaColaborador.jsp">Colaborador</a></li>
          </ul>
		</li>
      </ul>
    </div>
  </div>
</nav>

<div style="margin-left: 200px; margin-right: 200px;margin-top:150px">
	<div class="container-fluid">
	
	<% if(request.getParameter("pmensagem") != null) {%>
	<div class="alert alert-success alert-dismissible fade show" role="alert">
		 <% out.write(request.getParameter("pmensagem")); %>
		<button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
 	</div>	
	<%} %>
	
	
		<div class="container">
			<%
			Tarefa tar = new Tarefa();
			List<Tarefa> listaTarefas = tar.consulta();
			Colaborador col = new Colaborador ();
			Colaborador col2 = new Colaborador();
						
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
							<td><% 
							col2 = col.consultarById(t.getIdColaborador());
							out.print (col2.getNomeColaborador()); %> </td>
							<td><% out.write(t.getDescrTarefa());%> </td>
							<input type="hidden" name="id" value="<% out.print(t.getIdTarefa()); %>">
							<td><%=(t.getDataHoraInicioFormat())%> </td>
							<td><%=(t.getDataHoraFimFormat())%> </td>
							<td><% out.write(t.getStatusTarefa());%> </td>
							<td><% out.write(t.getPrioridadeTarefa());%> </td>
							<td><%out.write("<a href=editarTarefa.jsp?idTarefa="  + "" + t.getIdTarefa() + ">" + "<i class='far fa-edit' style='color:blue'></i>" + "</a>");%></td>
							<td>
								<button type="submit" name="excluir" value="Excluir" style="padding: 0;border: none;background: none;">
								<i class='far fa-trash-alt' style='color: red'></i> </button>
							</td>
						</tr>
					</form>
					<% } %>
				</tbody>
			</table>
		</div>
	</div>
</div>

</body>
</html>
