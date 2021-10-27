<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@page import="java.util.List"%>
<%@page import="Model.entidade.Colaborador"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="ISO-8859-1">
	<title>CONTROLE TAREFAS</title>
	<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>
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

<div style="margin-left: 400px; margin-right: 400px;margin-top:150px;margin-bottom:150px;">
<div class="container-fluid">

<% if(request.getParameter("pmensagem") != null) {%>
	<div class="alert alert-success alert-dismissible fade show" role="alert">
		 <% out.write(request.getParameter("pmensagem")); %>
		<button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
 	</div>	
<%} %>


	<div class="container">
		<form class="form-horizontal" id="formulario" action="cadastrarTarefa" method="POST">
			<h3>Cadastro de Tarefas</h3>
			<br>
			<div class="row g-2">
				<div class="col-md">
					<div class="form-floating">
						<select name="idColaborador" id=idColaborador class="form-select">
						<option></option>
							<% Colaborador col1 = new Colaborador();
							List<Colaborador> listaColaboradores = col1.consulta(); %>
							<% for (Colaborador c : listaColaboradores) {%>
							<option value="<%=c.getIdColaborador()%>">
								<% out.write(c.getNomeColaborador());%>
							</option>
							<% } %>
						</select>
						<label for="floatingSelectGrid">Colaborador</label>
						<br>
					</div>
				</div>
				<br>
			</div>
			<div class="row g-2">
				<div class="col-md">
					<div class="form-floating">
						<input id="descrTarefa" name="descrTarefa" class="form-control">
						<label id="descrTarefa" for="floatingSelectGrid">Descrição:	</label>
						<br>
					</div>
				</div>
			</div>

			<div class="row g-2">
				<div class="col-md">
					<div class="form-floating">
						<input id="dataHoraInicio" class="form-control" name="dataHoraInicio" type="datetime-local">
						<label id="dataHoraInicio" for="floatingSelectGrid">Início:</label>						
					</div>
				</div>

				<div class="col-md">
					<div class="form-floating">
					<input id="dataHoraFim" name="dataHoraFim" class="form-control" type="datetime-local">
					<label id="dataHoraFim" for="floatingSelectGrid">Fim:</label>
					</div>
					<br>
				</div>
			</div>

			<div class="row g-2">
				<div class="col-md">
					<div class="form-floating">
						<select name="statusTarefa" id="statusTarefa" class="form-select">
							<option value="null">Selecione...</option>
							<option value="Iniciada">Iniciada</option>
							<option value="Cancelada">Cancelada</option>
							<option value="Executada">Executada</option>
						</select>
						<label id="status" for="floatingSelectGrid">Status: </label>
						<br>
					</div>
				</div>
			</div>


			<div class="row g-2">
				<div class="col-md">
					<div class="form-floating">
						<select name=prioridadeTarefa id=prioridadeTarefa class="form-select">
								<option value="null">Selecione...</option>
								<option value="Baixa">Baixa</option>
								<option value="Media">Média</option>
								<option value="Alta">Alta</option>
								<option value="Urgente">Urgente</option>
							</select>
						<label id="prioridade" for="floatingSelectGrid">Prioridade:	</label>
					</div>
				</div>
				<div class="d-grid gap-2 d-md-block">
				<br>
					<input type="submit" value="Cadastrar" class="btn btn-primary"/>
					<a href= "index.html" class="btn btn-danger"> Cancelar </a>					
				</div>
			</div>
		</form>
		</div>
	</div>
	</div>
</body>
</html>
