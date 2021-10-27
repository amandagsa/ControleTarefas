package Controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import Model.entidade.Colaborador;

/**
 * Servlet implementation class cadastrarColaboradorController
 */
@WebServlet("/cadastrarColaboradorController")
public class cadastrarColaboradorController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public cadastrarColaboradorController() {
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

		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/hmtl; charset-UTF-8");

		String nome = request.getParameter("nomeColaborador");
		Colaborador colaborador = new Colaborador(nome);

		if (colaborador.salvar()) {
			response.sendRedirect("consultaColaborador.jsp?pmensagem=Colaborador cadastrado com sucesso!");
		} else {
			response.sendRedirect("consultaColaborador.jsp?pmensagem=Problemas ao cadastrar colaborador!");
		}
	}
}
