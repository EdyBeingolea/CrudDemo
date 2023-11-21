<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@include file="index.jsp"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="ISO-8859-1">
    <title>Insert title here</title>

    <script>
        function updatePattern() {
            var documentType = document.getElementById("document").value;
            var documentNumberInput = document.getElementById("documentNumber");

            if (documentType === "DNI") {
                documentNumberInput.pattern = "[0-9]{8}";
                documentNumberInput.title = "Ingrese 8 números para DNI";
            } else if (documentType === "CE") {
                documentNumberInput.pattern = "[0-9]{12}";
                documentNumberInput.title = "Ingrese 12 números para CE";
            } else {
                documentNumberInput.pattern = "";
                documentNumberInput.title = "Elija DNI o CE antes de ingresar el número";
            }
        }
    </script>
</head>
<body>
    <div class="container">
        <h1>Datos de Usuario</h1>

        <form action="Editar" method="post">
            <div class="mb-3">
                <label class="form-label">Nombre</label>
                <input type="text" name="name" class="form-control" value="<c:out value="${editar.name}" />"
                pattern="[A-Za-zÁáÉéÍíÓóÚúÜü' ]+" title="Solo letras permitidas" required>
            </div>

            <div class="mb-3">
                <label class="form-label">Dirección</label>
                <input type="text" name="address" class="form-control" value="<c:out value="${editar.address}" />"
                pattern="[a-zA-Z0-9, ]*" title="Escriba bien la direciion" required>
            </div>
            
            <div class="mb-3">
                <label class="form-label">Celular</label>
                <input type="text" name="phone" class="form-control" value="<c:out value="${editar.phone}" />"
                pattern="9[0-9]{8}" title="Solo se permite 9 numeros" required>
            </div>

            <div class="mb-3">
                <label class="form-label">Tipo de Documento</label>
                <select id="document" name="document" class="form-control" onchange="updatePattern()">
                    <option value="DNI" <c:if test="${editar.document eq 'DNI'}">selected</c:if>>DNI</option>
                    <option value="CE" <c:if test="${editar.document eq 'CE'}">selected</c:if>>CE</option>
                </select>
            </div>

            <div class="mb-3">
                <label class="form-label">Número de Documento</label>
                <input type="text" id="documentNumber" name="documentNumber" class="form-control"
                    title="Elija DNI o CE antes de ingresar el número" required
                    value="<c:out value="${editar.documentNumber}" />">
            </div>

            

            <button type="submit" class="btn btn-primary">Aceptar</button>
            <button type="button" class="btn btn-secondary">
                <a href="listarTodos" style="color: white;">Cancelar</a>
            </button>
        </form>
    </div>
</body>
</html>
