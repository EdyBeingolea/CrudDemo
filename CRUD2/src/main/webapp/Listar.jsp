<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<%@include file="index.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
<!-- Custom styles for this page -->
<link href="vendor/datatables/dataTables.bootstrap4.min.css"
	rel="stylesheet">


</head>
<body>

	<!-- Begin Page Content -->
	<div class="container-fluid">

		<!-- Page Heading -->


		<!-- DataTales Example -->
		<div class="card shadow mb-4">
			<div class="card-header py-3">
				<h1 class="m-0 font-weight-bold text-primary"
					style="text-align: center;">Lista de Clientes</h1>
				<div>
					<button type="submit" class="btn btn-primary">
						<a href="Agregar.jsp"
							style="color: white;"> Agregar</a>
					</button>
				</div>


			</div>
			<div class="card-body">
				<div class="table-responsive">
					<table class="table table-bordered" id="dataTable" width="100%"
						cellspacing="0">
						<thead>
							<tr>
								<th>Id</th>
								<th>Nombre</th>
								<th>Direccion</th>
								<th>Celular</th>
								<th>Acciones</th>
							</tr>
						</thead>
						<tfoot>
							<tr>
								<th>Id</th>
								<th>Nombre</th>
								<th>Direccion</th>
								<th>Celular</th>
							</tr>
						</tfoot>

						<tbody>
							<c:forEach var="cliente" items="${listarTodos}">

								<tr>
									<td><c:out value="${cliente.id}" /></td>
									<td><c:out value="${cliente.name}" /></td>
									<td><c:out value="${cliente.address}" /></td>
									<td><c:out value="${cliente.phone}" /></td>
									<td class="d-flex justify-content-center">

										<form name="eliminar" action="Eliminar"
											method="post">
											<button type="submit" class="btn btn-primary">Eliminar</button>
											<input type="hidden" name="id_delete"
												value="${cliente.id}">
										</form>
										<form  action="mostrarEditar"
											method="get">
											<button type="submit" class="btn btn-primary">Editar</button>
											<input type="hidden" name="id_editar" value="${cliente.id}">
										</form>

									</td>
								</tr>
							</c:forEach>
						</tbody>
					</table>
				</div>
			</div>
		</div>

	</div>
	<!-- /.container-fluid -->

	<!-- Page level plugins -->
	<script src="vendor/datatables/jquery.dataTables.min.js"></script>
	<script src="vendor/datatables/dataTables.bootstrap4.min.js"></script>

	<!-- Page level custom scripts -->
	<script src="js/demo/datatables-demo.js"></script>
	<!-- End of Main Content -->

	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-C6RzsynM9kWDrMNeT87bh95OGNyZPhcTNXj1NW7RuBCsyN/o0jlpcV8Qyq46cDfL"
		crossorigin="anonymous"></script>

</body>
</html>