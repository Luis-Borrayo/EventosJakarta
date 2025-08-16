<%--
  Created by IntelliJ IDEA.
  User: luisf
  Date: 14/08/2025
  Time: 23:18
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <title>Crear Evento</title>
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet"/>
</head>
<body class="bg-light">

<div class="container my-5">
  <div class="bg-white p-4 rounded shadow-sm" style="max-width: 600px; margin: auto;">
    <h1 class="text-center mb-4 text-dark">Crear Nuevo Evento</h1>

    <c:if test="${not empty error}">
      <div class="alert alert-danger">
        ✗ ${error}
      </div>
    </c:if>

    <form method="post" action="${pageContext.request.contextPath}/admin/events">
      <div class="mb-3">
        <label for="nombre" class="form-label">Nombre del Evento <span class="text-danger">*</span></label>
        <input type="text" id="nombre" name="nombre" class="form-control" required
               placeholder="Ingrese el nombre del evento"
               value="${param.nombre}">
      </div>

      <div class="mb-3">
        <label for="fecha" class="form-label">Fecha <span class="text-danger">*</span></label>
        <input type="date" id="fecha" name="fecha" class="form-control" required
               value="${param.fecha}">
      </div>

      <div class="mb-3">
        <label for="ubicacion" class="form-label">Ubicación <span class="text-danger">*</span></label>
        <input type="text" id="ubicacion" name="ubicacion" class="form-control" required
               placeholder="Ingrese la ubicación del evento"
               value="${param.ubicacion}">
      </div>

      <div class="text-center mt-4">
        <button type="submit" class="btn btn-primary px-4">Crear Evento</button>
        <a href="${pageContext.request.contextPath}/events" class="btn btn-secondary px-4">Cancelar</a>
      </div>
    </form>
  </div>
</div>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>