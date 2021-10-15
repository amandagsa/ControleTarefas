package Model.DAO;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import Model.entidade.Colaborador;
import util.Conexao;

public class ColaboradorDAO {
	 	private Conexao conexao = new Conexao();
	    private String query = "";

	    public ColaboradorDAO() throws SQLException, ClassNotFoundException {
	    }
	       
	    public void incluirColaborador(Colaborador colaborador) throws SQLException {
	        this.conexao.getConnection().setAutoCommit(false);
	        query = "insert into colaborador(nomeColaborador) value (?)";

	        try{
	            PreparedStatement statement = this.conexao.getConnection().prepareStatement(query);
	            statement.setString(1, colaborador.getNomeColaborador());
	            statement.execute();
	            conexao.commit();
	        }catch (SQLException e){
	            this.conexao.rollback();
	            throw e;
	        }
	    }

	    public void alterarColaborador(String nomeColaborador, int idColaborador) throws SQLException {
	        query = "update colaborador set nomeColaborador = ? where idColaborador = ?";
	        try{
	            PreparedStatement statement = this.conexao.getConnection().prepareStatement(query);
	            statement.setString(1, nomeColaborador);
	            statement.setInt(2, idColaborador);
	            statement.executeUpdate();
	            conexao.commit();
	        }catch (SQLException e){
	            this.conexao.rollback();
	            throw e;
	        }
	    }

	    public void excluirColaborador(int idColaborador) throws SQLException {
	        query = "delete from colaborador where idColaborador = (?)";
	        try{
	            PreparedStatement statement = this.conexao.getConnection().prepareStatement(query);
	            statement.setInt(1, idColaborador);
	            statement.execute();
	            conexao.commit();

	        }catch (SQLException e){
	            this.conexao.rollback();
	            throw e;
	        }
	    }

	    public Colaborador consultarColaborador(int idColaborador) throws SQLException {
	        query = "select idColaborador, nomeColaborador from colaborador where idColaborador = (?)";
	        try{
	            PreparedStatement statement = this.conexao.getConnection().prepareStatement(query);
	            statement.setInt(1, idColaborador);
	            ResultSet resultSet = statement.executeQuery();
	            if (resultSet.next()){
	                Colaborador colaboradorPesquisado = new Colaborador(resultSet.getInt("idColaborador"), resultSet.getString("nomeColaborador"));
	                return colaboradorPesquisado;
	            }else{
	                return null;
	            }
	        }catch (SQLException e){
	            conexao.rollback();
	            throw e;
	        }
	    }

	    public List<Colaborador> consultarColaboradores() throws SQLException {
	        query = "select idColaborador, nomeColaborador from colaborador";

	        try{
	            List<Colaborador> listaColaboradores = new ArrayList<>();
	            PreparedStatement statement = this.conexao.getConnection().prepareStatement(query);
	            ResultSet resultSet = statement.executeQuery();
	            while(resultSet.next()){
	                Colaborador colaboradorPesquisado = new Colaborador(resultSet.getInt("idColaborador"), resultSet.getString("nomeColaborador"));
	                listaColaboradores.add(colaboradorPesquisado);
	            }
	            return listaColaboradores;
	        }catch (SQLException e){
	            this.conexao.rollback();
	            throw e;
	        }
	    }
	}
