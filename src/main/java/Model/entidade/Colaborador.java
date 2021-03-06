package Model.entidade;

import java.sql.SQLException;
import java.util.List;

import Model.DAO.ColaboradorDAO;

public class Colaborador {
	private int idColaborador;
	private String nomeColaborador;

	public Colaborador(int idColaborador) {
		this.idColaborador = idColaborador;
	}

	public Colaborador(int idColaborador, String nomeColaborador) {
		this.idColaborador = idColaborador;
		this.nomeColaborador = nomeColaborador;
	}

	public Colaborador(String nomeColaborador) {
		this.nomeColaborador = nomeColaborador;
	}

	public Colaborador() {
	}

	public int getIdColaborador() {
		return idColaborador;
	}

	public void setIdColaborador(int idColaborador) {
		this.idColaborador = idColaborador;
	}

	public String getNomeColaborador() {
		return nomeColaborador;
	}

	public void setNomeColaborador(String nomeColaborador) {
		this.nomeColaborador = nomeColaborador;
	}

	public boolean salvar() {
		try {
			new ColaboradorDAO().incluirColaborador(this);
			return true;
		} catch (ClassNotFoundException | SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			return false;
		}
	}

	public List<Colaborador> consulta() {
		try {
			return new ColaboradorDAO().consultarColaboradores();
		} catch (ClassNotFoundException | SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			return null;
		}
	}

	public boolean excluir(int id) {
		try {
			new ColaboradorDAO().excluirColaborador(id);
			return true;
		} catch (ClassNotFoundException | SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			return false;
		}
	}

	public Colaborador consultarById(int id) {
		try {
			return new ColaboradorDAO().consultarColaborador(id);
		} catch (ClassNotFoundException | SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			return null;
		}
	}

	public boolean alterar(String nome, int id) {
		try {
			new ColaboradorDAO().alterarColaborador(nome, id);
			return true;
		} catch (ClassNotFoundException | SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			return false;
		}

	}

}
