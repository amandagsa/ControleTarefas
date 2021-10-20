package Controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import Model.entidade.Colaborador;

/**
 * Servlet implementation class modificarColaboradorController
 */
@WebServlet("/modificarColaboradorController")
public class modificarColaboradorController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public modificarColaboradorController() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		System.out.println("cheguei no get");
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/hmtl; charset=UTF-8");

		String excluir = request.getParameter("excluir");
		String id = request.getParameter("id");
		String alterar = request.getParameter("alterar");
		String nome = request.getParameter("nome");

		if (excluir != null && id != null) {

			Colaborador c = new Colaborador();
			if (c.excluir(Integer.valueOf(id))) {
				response.sendRedirect("consultaColaborador.jsp?pmensagem=Colaborador excluido com sucesso!");
			} else {
				response.sendRedirect("consultaColaborador.jsp?pmensagem=Problemas ao excluir colaborador!");
			}
		}
		

		if (alterar != null && id != null && nome != null) {
			Colaborador c = new Colaborador();
			if (c.alterar(nome, Integer.valueOf(id))) {
				response.sendRedirect("consultaColaborador.jsp?pmensagem=Colaborador alterado com sucesso!");
			} else {
				response.sendRedirect("consultaColaborador.jsp?pmensagem=Problemas ao alterar colaborador!");
			}
		}
	}

}
