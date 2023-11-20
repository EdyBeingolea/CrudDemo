package pe.edu.vallegrande.controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import pe.edu.vallegrande.model.clienteModel;
import pe.edu.vallegrande.service.clienteService;

@WebServlet(urlPatterns = { "/" })
public class clienteController extends HttpServlet {
	private static final long serialVersionUID = 1L;
	clienteService service = new clienteService();

	public clienteController() {
		super();
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String accion = request.getServletPath();
		switch (accion) {
		case "/listarActivos":
			listarActivos(request, response);
			break;
		case "/listarInactivos":
			listarInactivos(request, response);
			break;
		case "/mostrarEditar":
			mostrarEditar(request, response);
			break;
		default:
			listarTodos(request, response);
			break;
		}
	}

	private void mostrarEditar(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		List<clienteModel> mostrarEditar = new ArrayList<>();
		mostrarEditar = service.getAll();
		
		request.setAttribute("mostrarEditar", mostrarEditar);
		RequestDispatcher dispatcher = request.getRequestDispatcher("");
		dispatcher.forward(request, response);
		
	}

	private void listarInactivos(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		List<clienteModel> Activos = new ArrayList<>();
		Activos = service.getActive();
		request.setAttribute("Activos", Activos);
		RequestDispatcher dispatcher = request.getRequestDispatcher("");
		dispatcher.forward(request, response);
		
	}

	private void listarActivos(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		List<clienteModel> Inactivos = new ArrayList<>();
		Inactivos = service.getInactive();
		request.setAttribute("Inactivos", Inactivos);
		RequestDispatcher dispatcher = request.getRequestDispatcher("");
		dispatcher.forward(request, response);
		
	}

	private void listarTodos(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
		List<clienteModel> listarCliente = new ArrayList<>();
		listarCliente = service.getAll();
		request.setAttribute("listarCliente", listarCliente);
		RequestDispatcher dispatcher = request.getRequestDispatcher("");
		dispatcher.forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		String accion = request.getServletPath();
		switch (accion) {
		case "/Agregar":
			agregar(request, response);
			break;
		case "/Editar":
			editar(request, response);
			break;
		case "/Eliminar":
			eliminar(request, response);
			break;
		case "/Restaurar":
			restaurar(request, response);
			break;
		}
	}

	private void restaurar(HttpServletRequest request, HttpServletResponse response) throws IOException {
		int id_delete = Integer.parseInt(request.getParameter("id_delete"));
		service.restore(id_delete);
		response.sendRedirect("");		
	}

	private void eliminar(HttpServletRequest request, HttpServletResponse response) throws IOException {
		int id_delete = Integer.parseInt(request.getParameter("id_delete"));
		service.delete(id_delete);
		response.sendRedirect("");
		
	}

	private void editar(HttpServletRequest request, HttpServletResponse response) throws IOException {
		String name = request.getParameter("name");
		String address = request.getParameter("address");
		String phone = request.getParameter("phone");
		String status = request.getParameter("status");

		clienteModel cliente = (clienteModel) request.getSession().getAttribute("editar");
		cliente.setName(name);
		cliente.setAddress(address);
		cliente.setPhone(phone);
		cliente.setStatus(status);
		service.update(cliente);
		cliente= new clienteModel();
		response.sendRedirect("");
	}
		
	

	private void agregar(HttpServletRequest request, HttpServletResponse response) throws IOException {
		String name = request.getParameter("name");
		String address = request.getParameter("address");
		String phone = request.getParameter("phone");

		clienteModel cliente = new clienteModel();
		cliente.setName(name);
		cliente.setAddress(address);
		cliente.setPhone(phone);
		service.insert(cliente);
		response.sendRedirect("");
		
	}

}
