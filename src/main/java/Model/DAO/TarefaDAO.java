package Model.DAO;

import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Timestamp;
import java.time.LocalDate;
import java.time.LocalDateTime;
import java.time.ZoneId;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.List;

import Model.entidade.Tarefa;
import util.Conexao;

public class TarefaDAO {
	String query = "";
	Conexao conexao = new Conexao();

	public TarefaDAO() throws SQLException, ClassNotFoundException {
	}

	public void incluirTarefa(Tarefa tarefa) throws SQLException {
		query = "insert into tarefa (idColaborador, descrTarefa, dataHoraInicio, dataHoraFim, statusTarefa, prioridadeTarefa) values (?,?,?,?,?,?)";
		LocalDateTime dataInicio = tarefa.getDataHoraInicio().toInstant().atZone(ZoneId.systemDefault())
				.toLocalDateTime();
		LocalDateTime dataFim = tarefa.getDataHoraFim().toInstant().atZone(ZoneId.systemDefault()).toLocalDateTime();

		try {
			PreparedStatement statement = this.conexao.getConnection().prepareStatement(query);
			statement.setInt(1, tarefa.getIdColaborador());
			statement.setString(2, tarefa.getDescrTarefa());
			statement.setTimestamp(3, Timestamp.valueOf(dataInicio));
			statement.setTimestamp(4, Timestamp.valueOf(dataFim));
			statement.setString(5, tarefa.getStatusTarefa());
			statement.setString(6, tarefa.getPrioridadeTarefa());
			statement.execute();
			conexao.commit();
		} catch (SQLException e) {
			this.conexao.rollback();
			throw e;
		}
	}

	public void excluirTarefa(int idTarefa) throws SQLException {
		query = "delete from tarefa where idTarefa = (?)";
		try {
			PreparedStatement statement = this.conexao.getConnection().prepareStatement(query);
			statement.setInt(1, idTarefa);
			statement.execute();
            conexao.commit();
		} catch (SQLException e) {
			this.conexao.rollback();
			throw e;
		}
	}

	public void alterarTarefa(Tarefa tarefa) throws SQLException {
		query = "update tarefa set idColaborador = ?, descrTarefa = ?, dataHoraInicio = ?, dataHoraFim = ?, statusTarefa = ?, prioridadeTarefa  = ? where idTarefa = ?";
		
		LocalDateTime dataInicio = tarefa.getDataHoraInicio().toInstant().atZone(ZoneId.systemDefault())
				.toLocalDateTime();
		LocalDateTime dataFim = tarefa.getDataHoraFim().toInstant().atZone(ZoneId.systemDefault()).toLocalDateTime();

		try {
			PreparedStatement statement = this.conexao.getConnection().prepareStatement(query);
			statement.setInt(1, tarefa.getIdColaborador());
			statement.setString(2, tarefa.getDescrTarefa());
			statement.setTimestamp(3, Timestamp.valueOf(dataInicio));
			statement.setTimestamp(4, Timestamp.valueOf(dataFim));
			statement.setString(5, tarefa.getStatusTarefa());
			statement.setString(6, tarefa.getPrioridadeTarefa());
			statement.setInt(7, tarefa.getIdTarefa());
			statement.execute();
			System.out.println(query);
			System.out.println(statement);
			
			conexao.commit();
		} catch (SQLException e) {
			this.conexao.rollback();
			throw e;
		}
	}

	public Tarefa consultarTarefa(int idTarefa) throws SQLException {
		query = "select idTarefa, idColaborador, descrTarefa, dataHoraInicio, dataHoraFim, statusTarefa, prioridadeTarefa from tarefa where idTarefa = (?)";
		try {
			PreparedStatement statement = this.conexao.getConnection().prepareStatement(query);
			statement.setInt(1, idTarefa);
			ResultSet resultSet = statement.executeQuery();
			if (resultSet.next()) {
				Tarefa tarefaPesquisada = new Tarefa();
				tarefaPesquisada.setIdTarefa(resultSet.getInt("idTarefa"));
				tarefaPesquisada.setIdColaborador(resultSet.getInt("idColaborador"));
				tarefaPesquisada.setDescrTarefa(resultSet.getString("descrTarefa"));
				tarefaPesquisada.setDataHoraInicio(resultSet.getDate("dataHoraInicio"));

				tarefaPesquisada.setDataHoraFim(resultSet.getDate("dataHoraFim"));
				tarefaPesquisada.setStatusTarefa(resultSet.getString("statusTarefa"));
				tarefaPesquisada.setPrioridadeTarefa(resultSet.getString("prioridadeTarefa"));
				return tarefaPesquisada;
			} else {
				return null;
			}
		} catch (SQLException e) {
			this.conexao.rollback();
			throw e;
		}
	}

	public Tarefa consultarTarefaByColaborador(int idColaborador) throws SQLException {
		query = "select idTarefa, idColaborador, descrTarefa, dataHoraInicio, dataHoraFim, statusTarefa, prioridadeTarefa from tarefa where idColaborador = (?)";
		try {
			PreparedStatement statement = this.conexao.getConnection().prepareStatement(query);
			statement.setInt(1, idColaborador);
			ResultSet resultSet = statement.executeQuery();
			if (resultSet.next()) {
				Tarefa tarefaPesquisada = new Tarefa();
				tarefaPesquisada.setIdTarefa(resultSet.getInt("idTarefa"));
				tarefaPesquisada.setIdColaborador(resultSet.getInt("idColaborador"));
				tarefaPesquisada.setDescrTarefa(resultSet.getString("descrTarefa"));
				tarefaPesquisada.setDataHoraInicio(resultSet.getDate("dataHoaInicio"));
				tarefaPesquisada.setDataHoraFim(resultSet.getDate("dataHoraFim"));
				tarefaPesquisada.setStatusTarefa(resultSet.getString("statusTarefa"));
				tarefaPesquisada.setPrioridadeTarefa(resultSet.getString("prioridadeTarefa"));
				return tarefaPesquisada;
			} else {
				return null;
			}
		} catch (SQLException e) {
			this.conexao.rollback();
			throw e;
		}
	}

	public List<Tarefa> consultarTarefas() throws SQLException {
		query = "select idTarefa, idColaborador, descrTarefa, dataHoraInicio, dataHoraFim, statusTarefa, prioridadeTarefa from tarefa";
		try {
			PreparedStatement statement = this.conexao.getConnection().prepareStatement(query);
			ResultSet resultSet = statement.executeQuery();
			List<Tarefa> listaTarefas = new ArrayList<Tarefa>();
			while (resultSet.next()) {
				Tarefa tarefaPesquisada = new Tarefa();
				tarefaPesquisada.setIdTarefa(resultSet.getInt("idTarefa"));
				tarefaPesquisada.setIdColaborador(resultSet.getInt("idColaborador"));
				tarefaPesquisada.setDescrTarefa(resultSet.getString("descrTarefa"));
				tarefaPesquisada.setDataHoraInicio(resultSet.getDate("dataHoraInicio"));
				
				Timestamp timestamp = resultSet.getTimestamp("dataHoraInicio");
				java.util.Date date1 = new java.util.Date(timestamp.getTime());
				tarefaPesquisada.setDataHoraInicio(date1);
				timestamp = resultSet.getTimestamp("dataHoraInicio");
				java.util.Date date2 = new java.util.Date(timestamp.getTime());
				tarefaPesquisada.setDataHoraFim(date2);
				
				tarefaPesquisada.setStatusTarefa(resultSet.getString("statusTarefa"));
				tarefaPesquisada.setPrioridadeTarefa(resultSet.getString("prioridadeTarefa"));
				listaTarefas.add(tarefaPesquisada);
			}
			return listaTarefas;
		} catch (SQLException e) {
			this.conexao.rollback();
			throw e;
		}
	}
}
