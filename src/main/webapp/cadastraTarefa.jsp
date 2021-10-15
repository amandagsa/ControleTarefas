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
						<select id=status class="form-control">
						<% Colaborador col1 = new Colaborador();
						List<Colaborador> listaColaboradores = col1.consulta();	%>
							<option value="null">Selecione...</option>
							<% for (Colaborador c : listaColaboradores) { %>							
							<option value="<% out.write(c.getIdColaborador()); %>"> <% out.write(c.getNomeColaborador()); %> </option>
							<%}%>
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
							name="dataHoraInicio" type="date">
					</div>
				</div>


				<div class="form-group">
					<label id="dataHoraFim" class="col-sm-2 control-label">Fim:
					</label>
					<div class="col-sm-10">
						<input id="dataHoraFim" name="dataHoraFim" class="form-control"
							type="date">
					</div>
				</div>


				<div class="form-group">
					<label id="status" class="col-sm-2 control-label">Status: </label>
					<div class="col-sm-10">
						<select id=status class="form-control">
							<option value="null">Selecione...</option>
							<option value="iniciada">Iniciada</option>
							<option value="cancelada">Cancelada</option>
							<option value="executada">Executada</option>
						</select>
					</div>
				</div>


				<div class="form-group">
					<div id="prioridade">
						<label id="prioridade" class="col-sm-2 control-label">Prioridade:
						</label>
						<div class="col-sm-10">
							<select id=prioridade class="form-control">
								<option value="null">Selecione...</option>
								<option value="baixa">Baixa</option>
								<option value="media">Média</option>
								<option value="alta">Alta</option>
								<option value="urgente">Urgente</option>
							</select>
						</div>
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
			</fieldset>
		</form>
	</div>
</body>
</html>
