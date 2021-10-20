<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@page import="Model.entidade.Colaborador"%>
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
        int idColaborador = Integer.parseInt(request.getParameter("idColaborador"));
        Colaborador c = new Colaborador();
        c = c.consultarById(idColaborador);
        %>
        <div>
            <div class="container"  id="tabela">
                <form class="form-horizontal" id="formulario" action="modificarColaborador" method="POST"> 
                    <h3>Alterar Colaborador</h3> 
                    <br>

                    <fieldset id="cadtarefa">
                        <div class="form-group">
                            <label class="col-sm-2 control-label">Colaborador</label>
                            <div class="col-sm-10">
                            <input type="text" name="id" class="form-control" readonly="true" value="<%out.write("" +c.getIdColaborador());%>" />
                        </div>
                        </div>

                        <div class="form-group">
                            <label class="col-sm-2 control-label">Nome</label>
                            <div class="col-sm-10">
                            <input type="text" name="nome" class="form-control" required maxlength="40" value="<%out.write(c.getNomeColaborador());%>"/>
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