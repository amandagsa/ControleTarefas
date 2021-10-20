package Controller;

import java.io.IOException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import Model.entidade.Colaborador;
import Model.entidade.Tarefa;

/**
 * Servlet implementation class cadastrarTarefaController
 */
@WebServlet("/cadastrarTarefaController")
public class cadastrarTarefaController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public cadastrarTarefaController() {
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
//		 TODO Auto-generated method stub

		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/hmtl; charset-UTF-8");
		String descrTarefa = request.getParameter("descrTarefa");
		int idColaborador = Integer.parseInt(request.getParameter("idColaborador")) ;
		String statusTarefa = request.getParameter("statusTarefa");
		String prioridadeTarefa = request.getParameter("prioridadeTarefa");
		String dataHoraInicio = request.getParameter("dataHoraInicio");
		String dataHoraFim = request.getParameter("dataHoraFim");
		
		Date dataInicio = null;
		Date dataFim = null;
		try {
			dataInicio = new SimpleDateFormat("yyyy-MM-dd'T'hh:mm").parse(dataHoraInicio);
			dataFim = new SimpleDateFormat("yyyy-MM-dd'T'hh:mm").parse(dataHoraFim);
		} catch (ParseException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		Tarefa tarefa = new Tarefa();
		tarefa.setIdColaborador(idColaborador);
		tarefa.setDescrTarefa(descrTarefa);
		tarefa.setDataHoraInicio(dataInicio);
		tarefa.setDataHoraFim(dataFim);
		tarefa.setStatusTarefa(statusTarefa);
		tarefa.setPrioridadeTarefa(prioridadeTarefa);
			
		RequestDispatcher dispatcher1 = request.getRequestDispatcher("cadastraTarefa.jsp");
		
		if (tarefa.salvar()) {
			response.sendRedirect("consultaTarefa.jsp?pmensagem=Tarefa cadastrada com sucesso!");
		} else {
			response.sendRedirect("consultaTarefa.jsp?pmensagem=Problemas ao cadastrar tarefa!");
		}

	}

}
