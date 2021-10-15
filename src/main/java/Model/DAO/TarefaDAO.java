package Model.DAO;

import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.time.LocalDate;
import java.time.ZoneId;
import java.util.ArrayList;
import java.util.List;

import Model.entidade.Tarefa;
import util.Conexao;

public class TarefaDAO{
	    String query = "";
	    Conexao conexao = new Conexao();

	    public TarefaDAO() throws SQLException, ClassNotFoundException {
	    }

	    public void incluirTarefa(Tarefa tarefa) throws SQLException {
	        query = "insert into tarefa (descrTarefa, dataHoraInicio, dataHoraFim, statusTarefa, prioridadeTarefa) values (?,?,?,?,?)";
	        LocalDate dataInicio = tarefa.getDataHoraInicio().toInstant().atZone(ZoneId.systemDefault()).toLocalDate();
	        LocalDate dataFim = tarefa.getDataHoraFim().toInstant().atZone(ZoneId.systemDefault()).toLocalDate();
	        try {
	            PreparedStatement statement = this.conexao.getConnection().prepareStatement(query);
	            statement.setString(1, tarefa.getDescrTarefa());
	            statement.setDate(2, Date.valueOf(dataInicio));
	            statement.setDate(3, Date.valueOf(dataFim));
	            statement.setString(4, tarefa.getStatusTarefa());
	            statement.setString(5, tarefa.getPrioridadeTarefa());
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
	        } catch (SQLException e) {
	            this.conexao.rollback();
	            throw e;
	        }
	    }

	    public void alterarTarefa() {
// 			falta desenvolver
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
		            System.out.println(resultSet.getInt("idColaborador"));
	                Tarefa tarefaPesquisada = new Tarefa();
	                tarefaPesquisada.setIdTarefa(resultSet.getInt("idTarefa"));
	                tarefaPesquisada.setIdColaborador(resultSet.getInt("idColaborador"));
	                tarefaPesquisada.setDescrTarefa(resultSet.getString("descrTarefa"));
	                tarefaPesquisada.setDataHoraInicio(resultSet.getDate("dataHoraInicio"));
	                tarefaPesquisada.setDataHoraFim(resultSet.getDate("dataHoraFim"));
	                tarefaPesquisada.setStatusTarefa(resultSet.getString("statusTarefa"));
	                tarefaPesquisada.setPrioridadeTarefa(resultSet.getString("prioridadeTarefa"));
	                listaTarefas.add(tarefaPesquisada);
	            }
	            return listaTarefas;
	        } catch(SQLException e){
	                this.conexao.rollback();
	                throw e;
	            }
	        }
	    }
