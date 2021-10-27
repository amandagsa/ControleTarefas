<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@page import="Model.entidade.Tarefa"%>
<%@page import="Model.entidade.Colaborador"%>
<%@page import="java.util.List"%>

<!DOCTYPE html>
<html>
    <head>
    	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
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
   
         <%
        int idTarefa = Integer.parseInt(request.getParameter("idTarefa"));
        Tarefa t = new Tarefa();
        t = t.consultaById(idTarefa);
        %>
        <div>
            <div class="container"  id="tabela">
                <form class="form-horizontal" id="formulario" action="modificarTarefa" method="POST"> 
                    <h3>Alterar Tarefa</h3> 
                    <br>


                    <div class="row g-2">
						<div class="col-md">
							<div class="form-floating">
                            	<input type="text" name="idTarefa" class="form-control" readonly="true" value="<%out.write("" +t.getIdTarefa());%>" />
                            	<input type="hidden" name="id" value="<% out.print(t.getIdTarefa()); %>">
                            	<label for="floatingSelectGrid">Tarefa:</label>
                            	<br>
                        	</div>
                    	</div>
                   </div>
							
					<div class="row g-2">
						<div class="col-md">
							<div class="form-floating">
							<select name="idColaborador" id=idColaborador class="form-control">
								<% Colaborador col1 = new Colaborador();
								List<Colaborador> listaColaboradores = col1.consulta(); %>
								
								<% for (Colaborador c : listaColaboradores) {%>
								
								<option value="<%=c.getIdColaborador()%>"
								 <% if (t.getIdColaborador() == c.getIdColaborador()){
									 out.write("selected");
									 } %> >
									<% out.write(c.getNomeColaborador());%>
								</option>
								<% } %>
							</select>
						<label id="status" for="floatingSelectGrid">Colaborador:</label>
					</div>
				</div>
               <div class="row g-2">
				<div class="col-md">
					<div class="form-floating">
                    <input type="text" name="descrTarefa" id="descrTarefa" class="form-control" required maxlength="40" value="<%out.write(t.getDescrTarefa());%>"/>
                    <label for="floatingSelectGrid">Descrição:</label>
                    </div>
                </div>
                
             <div class="row g-2">
				<div class="col-md">
					<div class="form-floating">
						<input id="dataHoraInicio" class="form-control" name="dataHoraInicio" type="datetime-local" value="<%out.print(t.getDataHoraInicioFormatDatabase());%>">
						<label id="dataHoraInicio" for="floatingSelectGrid">Início:</label>						
					</div>
				</div>

				<div class="col-md">
					<div class="form-floating">
					<input id="dataHoraFim" name="dataHoraFim" class="form-control" type="datetime-local"  value="<%out.print(t.getDataHoraFimFormatDatabase()); %>">
					<label id="dataHoraFim" for="floatingSelectGrid">Fim:</label>
					</div>
				</div>
			</div>
                                     
				<div class="row g-2">
				<div class="col-md">
					<div class="form-floating">
						<select name="statusTarefa" id="statusTarefa" class="form-select">
							<option value="Iniciada"  <% if (t.getStatusTarefa().equalsIgnoreCase("Iniciada")){ out.write("selected"); } %>>Iniciada</option>
							<option value="Cancelada" <% if (t.getStatusTarefa().equalsIgnoreCase("Cancelada")){ out.write("selected"); } %>>Cancelada</option>
							<option value="Executada" <% if (t.getStatusTarefa().equalsIgnoreCase("Executada")){ out.write("selected"); } %>>Executada</option>
						</select>
						<label id="status" for="floatingSelectGrid">Status: </label>
					</div>
				</div>
			</div>
				<div class="row g-2">
				<div class="col-md">
					<div class="form-floating">
						<select name=prioridadeTarefa id=prioridadeTarefa class="form-select">
							<option value="Baixa"  <% if (t.getPrioridadeTarefa().equalsIgnoreCase("Baixa")){ out.write("selected"); } %>>Baixa</option>
							<option value="Media" <% if (t.getPrioridadeTarefa().equalsIgnoreCase("Media")){ out.write("selected"); } %>>Media</option>
							<option value="Alta" <% if (t.getPrioridadeTarefa().equalsIgnoreCase("Alta")){ out.write("selected"); } %>>Alta</option>
							<option value="Urgente" <% if (t.getPrioridadeTarefa().equalsIgnoreCase("Urgente")){ out.write("selected"); } %>>Urgente</option>
							</select>
						<label id="prioridade" for="floatingSelectGrid">Prioridade:	</label>
					</div>
				</div>

				<div class="d-grid gap-2 d-md-block">
				<br>
					<input type="submit" name="alterar" value="Alterar" class='btn btn-primary'></input>
						<a href= "consultaTarefa.jsp" class="btn btn-danger"> Cancelar </a>					
				</div>
			</div>                      
         </div>
       </form>
     </div>
  </div>
 </div>
 </div>                              
</body>
</html>