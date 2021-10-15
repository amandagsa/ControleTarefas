package util;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;

public class Conexao {

	Connection connection = null;
	String USERNAME = "root";
	String PASSWORD = "123456";
	String DATABASE_URL = "jdbc:mysql://localhost:3306/tarefas?useTimeZone=true&ServerTimezone=UTC";

	public Conexao() throws SQLException, ClassNotFoundException {
		Class.forName("com.mysql.cj.jdbc.Driver");
		this.connection = DriverManager.getConnection(DATABASE_URL, USERNAME, PASSWORD);
		this.connection.setAutoCommit(false);
	}

	public Connection getConnection() {
		return this.connection;
	}

	public void close() {
		if (this.connection != null) {
			try {
				this.connection.close();
			} catch (SQLException var2) {
				Logger.getLogger(Conexao.class.getName()).log(Level.SEVERE, (String) null, var2);
			}
		}

	}

	public void commit() throws SQLException {
		this.connection.commit();
		this.close();
	}

	public void rollback() {
		if (this.connection != null) {
			try {
				this.connection.rollback();
			} catch (SQLException var2) {
				Logger.getLogger(Conexao.class.getName()).log(Level.SEVERE, (String) null, var2);
			}
		}

	}
}
