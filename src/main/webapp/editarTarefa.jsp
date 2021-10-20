<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@page import="Model.entidade.Tarefa"%>
<%@page import="Model.entidade.Colaborador"%>
<%@page import="java.util.List"%>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" href="Styles/padraotelacadastro.css">
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<link
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css"
	rel="stylesheet" />
</head>
    <body>
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

                    <fieldset id="cadtarefa">
                        <div class="form-group">
                            <label class="col-sm-2 control-label">Tarefa:</label>
                            <div class="col-sm-10">
                            <input type="text" name="idTarefa" class="form-control" readonly="true" value="<%out.write("" +t.getIdTarefa());%>" />
                            <input type="hidden" name="id" value="<% out.print(t.getIdTarefa()); %>">
                        </div>
                        </div>
							
						<div class="form-group">
					<label id="status" class="col-sm-2 control-label">Colaborador:
					</label>
					<div class="col-sm-10">
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
					</div>
				</div>
                        
                         <div class="form-group">
                            <label class="col-sm-2 control-label">Descrição:</label>
                            <div class="col-sm-10">
                            <input type="text" name="descrTarefa" id="descrTarefa" class="form-control" required maxlength="40" value="<%out.write(t.getDescrTarefa());%>"/>
                        </div>
                        </div>
                        
				<div class="form-group">
					<label id="dataHoraInicio" class="col-sm-2 control-label">Início:
					</label>
					<div class="col-sm-10">
						<input id="dataHoraInicio" class="form-control"
							name="dataHoraInicio" type="datetime-local">
					</div>
				</div>


				<div class="form-group">
					<label id="dataHoraFim" class="col-sm-2 control-label">Fim:
					</label>
					<div class="col-sm-10">
						<input id="dataHoraFim" name="dataHoraFim" class="form-control"
							type="datetime-local" default="now">
					</div>
				</div>

                        
				<div class="form-group">
					<label id="status" class="col-sm-2 control-label">Status:</label>
					<div class="col-sm-10">
						<select name="statusTarefa" id="statusTarefa" class="form-control">
							<option value="Iniciada"  <% if (t.getStatusTarefa().equalsIgnoreCase("Iniciada")){ out.write("selected"); } %>>Iniciada</option>
							<option value="Cancelada" <% if (t.getStatusTarefa().equalsIgnoreCase("Cancelada")){ out.write("selected"); } %>>Cancelada</option>
							<option value="Executada" <% if (t.getStatusTarefa().equalsIgnoreCase("Executada")){ out.write("selected"); } %>>Executada</option>
						</select>
					</div>
				</div>


				<div class="form-group">
					<div id="prioridade">
						<label id="prioridade" class="col-sm-2 control-label">Prioridade:
						</label>
						<div class="col-sm-10">
							<select name=prioridadeTarefa id=prioridadeTarefa
								class="form-control">
							<option value="Baixa"  <% if (t.getPrioridadeTarefa().equalsIgnoreCase("Baixa")){ out.write("selected"); } %>>Baixa</option>
							<option value="Media" <% if (t.getPrioridadeTarefa().equalsIgnoreCase("Media")){ out.write("selected"); } %>>Media</option>
							<option value="Alta" <% if (t.getPrioridadeTarefa().equalsIgnoreCase("Alta")){ out.write("selected"); } %>>Alta</option>
							<option value="Urgente" <% if (t.getPrioridadeTarefa().equalsIgnoreCase("Urgente")){ out.write("selected"); } %>>Urgente</option>
							</select>
						</div>
					</div>
				</div>   
                    </fieldset>

				<div class="text-center">
					<div id="botaocad">
						<input type="submit" name="alterar" value="Alterar"
							class='btn btn-success'></input>
					</div>
					<div id="botaocan">
						<input type="reset" value="Cancelar" class="btn btn-danger" />
					</div>
				</div>                      
                    </div>
                </form>
            </div>
        </div>                              
    </body>
</html>