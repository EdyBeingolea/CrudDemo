<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<%@include file="index.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
	<div class="container">
		<h1>Datos de Usuario</h1>
		<form action="Agregar" method="post">

			<div class="mb-3">
				<label class="form-label">Nombre</label> <input type="text"
					name="name" class="form-control">
			</div>


			<div class="mb-3">
				<label class="form-label">Direccion</label> <input type="text"
					name="address" class="form-control">
			</div>


			<div class="mb-3">
				<label class="form-label">Celular</label> <input type="text"
					name="phone" class="form-control">
			</div>

			<button type="submit" class="btn btn-primary">Aceptar</button>
			<button type="button" class="btn btn-secondary">
				<a href=listarTodos style="color: white;"> Cancelar</a>
			</button>
		</form>
	</div>
</body>
</html>