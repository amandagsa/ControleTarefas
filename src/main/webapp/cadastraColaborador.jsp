<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>CONTROLE DE TAREFAS</title>
<link rel="stylesheet" href="Styles/padraotelacadastro.css">
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<link
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css"
	rel="stylesheet" />
</head>
<body>
	<div class="container" id="tabela">
		<form class="form-horizontal" id="formulario"
			action="cadastrarColaborador" method="POST">
			<h3>Cadastro de Colaboradores</h3>
			<br>
			
			<fieldset id="cadtarefa">

				<div class="form-group">
					<label id="nomeColaborador" class="col-sm-2 control-label">Nome:
					</label>
					<div class="col-sm-10">
						<input id="nomeColaborador" name="nomeColaborador"
							class="form-control" type="text" maxlength="30" required size=30>
					</div>
				</div>
				

				<div class="text-center">
					<div id="botaocad">
						<input type="submit" value="Cadastrar" class="btn btn-success " />
					</div>
					<div id="botaocan">
						<input type="reset" value="Cancelar" class="btn btn-danger" />
					</div>
				</div>
				
		<label class="msg" style="text-align: center; font-size: 20px;   color: rgb(255, 251, 0);">
		<br><br><br>
            <%
                if(request.getParameter("pmensagem") != null)         
                out.write(request.getParameter("pmensagem"));
            %>
        </label>
			</fieldset>
		</form>
	</div>
</body>
</html>