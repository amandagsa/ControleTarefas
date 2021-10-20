<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@page import="java.util.List"%>
<%@page import="Model.entidade.Colaborador"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>CONTROLE TAREFAS</title>
<link rel="stylesheet" href="Styles/padraotelacadastro.css">
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"
	integrity="sha384-Tc5IQib027qvyjSMfHjOMaLkfuWVxZxUPnCJA7l2mCWNIpG9mGCD8wGNIcPD7Txa"
	crossorigin="anonymous"></script>
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css"
	integrity="sha384-BVYiiSIFeK1dGmJRAkycuHAHRg32OmUcww7on3RYdg4Va+PmSTsz/K68vbdEjh4u"
	crossorigin="anonymous">
</head>
<body>
	<div class="container">
		<form class="form-horizontal" id="formulario" action="cadastrarTarefa"
			method="POST">
			<h3>Cadastro de Tarefas</h3>
			<br>

			<fieldset id="cadtarefa">

				<div class="form-group">
					<label id="status" class="col-sm-2 control-label">Colaborador:
					</label>
					<div class="col-sm-10">
						<select name="idColaborador" id=idColaborador class="form-control">
							<% Colaborador col1 = new Colaborador();
							List<Colaborador> listaColaboradores = col1.consulta(); %>
							<option value="null">Selecione...</option>
							<% for (Colaborador c : listaColaboradores) {%>

							<option value="<%=c.getIdColaborador()%>">
								<% out.write(c.getNomeColaborador());%>
							</option>
							<% } %>
						</select>
					</div>
				</div>


				<div class="form-group">
					<label id="descrTarefa" class="col-sm-2 control-label">Descrição:
					</label>
					<div class="col-sm-10">
						<input id="descrTarefa" name="descrTarefa" class="form-control"
							type="text" maxlength="30" required size=30>
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
							type="datetime-local">
					</div>
				</div>


				<div class="form-group">
					<label id="status" class="col-sm-2 control-label">Status: </label>
					<div class="col-sm-10">
						<select name="statusTarefa" id="statusTarefa" class="form-control">
							<option value="null">Selecione...</option>
							<option value="Iniciada">Iniciada</option>
							<option value="Cancelada">Cancelada</option>
							<option value="Executada">Executada</option>
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
								<option value="null">Selecione...</option>
								<option value="Baixa">Baixa</option>
								<option value="Media">Média</option>
								<option value="Alta">Alta</option>
								<option value="Urgente">Urgente</option>
							</select>
						</div>
					</div>
				</div>
				<div class="text-center">
					<div id="botaocad">
						<input type="submit" value="Cadastrar" class="btn btn-success"
							onclick=Alerta() />
					</div>
					<div id="botaocan">
						<input type="reset" value="Cancelar" class="btn btn-danger"
							onclick=Alerta() />
					</div>
				</div>
			</fieldset>
		</form>
	</div>
</body>
</html>
