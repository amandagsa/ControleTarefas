package Controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import Model.entidade.Colaborador;
import Model.entidade.Tarefa;

/**
 * Servlet implementation class modificarTarefaController
 */
@WebServlet("/modificarTarefaController")
public class modificarTarefaController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public modificarTarefaController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		this.doPost(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/hmtl; charset=UTF-8");
		
		String excluir = request.getParameter("excluir");
		String id = request.getParameter("id");
		String alterar = request.getParameter("alterar");
			
		
		if(excluir != null && id != null) {
	        Tarefa t = new Tarefa();
	        if (t.excluir(Integer.valueOf(id))) {
	            response.sendRedirect("consultaTarefa.jsp?pmensagem=Tarefa excluida com sucesso!");
	        } else {
	            response.sendRedirect("consultaTarefa.jsp?pmensagem=Problemas ao excluir tarefa!");
	        }
		}
		
		
		if(alterar != null && id !=null) {
			
		}
		
	}
		
	}
