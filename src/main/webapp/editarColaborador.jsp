<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@page import="Model.entidade.Colaborador"%>
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
    
<div style="margin-left: 400px; margin-right: 400px;margin-top:150px">
<div class="container-fluid">
       <%
        int idColaborador = Integer.parseInt(request.getParameter("idColaborador"));
        Colaborador c = new Colaborador();
        c = c.consultarById(idColaborador);
        %>
        
   <div class="container"  id="tabela">
        <form class="form-horizontal" id="formulario" action="modificarColaborador" method="POST"> 
             <h3>Alterar Colaborador</h3> 
             <br>
			<div class="row g-2">
				<div class="col-md">
					<div class="form-floating">
                       <input type="text" name="id" class="form-control" readonly="true" value="<%out.write("" +c.getIdColaborador());%>" />
                       <label for="floatingSelectGrid">Colaborador</label>
                       <br>
                    </div>
               </div>
            </div>

            <div class="row g-2">
				<div class="col-md">
					<div class="form-floating">
						<input type="text" name="nome" class="form-control" required maxlength="40" value="<%out.write(c.getNomeColaborador());%>"/>
                        <label for="floatingSelectGrid">Nome</label>
                    </div>
                </div>
          </div>
		<div class="d-grid gap-2 d-md-block" style="margin-top:30px;">
					<div id="botoes">
						<input type="submit" name="alterar" value="Alterar" class='btn btn-primary'></input>
						<a href= "consultaColaborador.jsp" class="btn btn-danger"> Cancelar </a>					
					</div>
				</div>                      
       </form>
	</div>
</div>  
</div>                          
</body>
</html>