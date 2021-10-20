package Model.entidade;

import java.sql.SQLException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import Model.DAO.TarefaDAO;

public class Tarefa {
	private int idTarefa;
	private int idColaborador;
	private String descrTarefa;
	private Date dataHoraInicio;
	private Date dataHoraFim;
	private String statusTarefa;
	private String prioridadeTarefa;

	public Tarefa(int idColaborador, String descrTarefa, Date dataHoraInicio, Date dataHoraFim, String statusTarefa,
			String prioridadeTarefa) {
		this.idColaborador = idColaborador;
		this.descrTarefa = descrTarefa;
		this.dataHoraInicio = dataHoraInicio;
		this.dataHoraFim = dataHoraFim;
		this.statusTarefa = statusTarefa;
		this.prioridadeTarefa = prioridadeTarefa;
	}

	public Tarefa() {
	}

	public int getIdColaborador() {
		return idColaborador;
	}

	public void setIdColaborador(int idColaborador) {
		this.idColaborador = idColaborador;
	}

	public int getIdTarefa() {
		return idTarefa;
	}

	public void setIdTarefa(int idTarefa) {
		this.idTarefa = idTarefa;
	}

	public String getDescrTarefa() {
		return descrTarefa;
	}

	public void setDescrTarefa(String descrTarefa) {
		this.descrTarefa = descrTarefa;
	}

	public Date getDataHoraInicio() {
		return dataHoraInicio;
	}
	
	public String getDataHoraInicioFormat() {
		SimpleDateFormat format = new SimpleDateFormat("dd-MM-yyyy HH:mm");
		return format.format(dataHoraInicio);
	}


	public void setDataHoraInicio(Date dataHoraInicio) {
		this.dataHoraInicio = dataHoraInicio;
	}

	public Date getDataHoraFim() {
		return dataHoraFim;
	}
	
	public String getDataHoraFimFormat() {
		SimpleDateFormat format = new SimpleDateFormat("dd-MM-yyyy HH:mm");
		return format.format(dataHoraFim);
	}

	public void setDataHoraFim(Date dataHoraFim) {
		this.dataHoraFim = dataHoraFim;
	}

	public String getStatusTarefa() {
		return statusTarefa;
	}

	public void setStatusTarefa(String statusTarefa) {
		this.statusTarefa = statusTarefa;
	}

	public String getPrioridadeTarefa() {
		return prioridadeTarefa;
	}

	public void setPrioridadeTarefa(String prioridadeTarefa) {
		this.prioridadeTarefa = prioridadeTarefa;
	}

	public void salvar() {
		try {
			new TarefaDAO().incluirTarefa(this);
		} catch (ClassNotFoundException | SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

	public List<Tarefa> consulta() {
		try {
			return new TarefaDAO().consultarTarefas();
		} catch (ClassNotFoundException | SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			return null;
		}
	}
	
	public boolean excluir(int id) {
		try {
			new TarefaDAO().excluirTarefa(id);
			return true;
		} catch (ClassNotFoundException | SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			return false;
		}
	}
	
	public Tarefa consultaById(int id) {
		try {
			return new TarefaDAO().consultarTarefa(id);
		} catch (ClassNotFoundException | SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			return null;
		}
	}
	
	public String toString() {
		return "Colaborador: " + this.idColaborador + " Descrição: " + this.descrTarefa + " Inicio: "
				+ this.dataHoraInicio + " Fim: " + this.dataHoraFim + " Status: " + this.statusTarefa + " Prioridade: "
				+ this.prioridadeTarefa;
	}
}
