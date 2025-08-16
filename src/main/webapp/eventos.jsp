<%--
  Created by IntelliJ IDEA.
  User: luisf
  Date: 14/08/2025
  Time: 20:12
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Lista de Eventos</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet"/>
</head>
<body class="bg-light">

<div class="container my-4 p-4 bg-white rounded shadow-sm">
    <h1 class="text-center mb-4 text-dark">Lista de Eventos</h1>

    <div class="d-flex justify-content-between align-items-center mb-3">
        <a href="${pageContext.request.contextPath}/menu.jsp" class="btn btn-secondary">
            ← Volver al Inicio
        </a>
        <c:if test="${userRole == 'ADMIN'}">
            <a href="${pageContext.request.contextPath}/admin/events" class="btn btn-primary">
                + Crear Evento
            </a>
        </c:if>
    </div>

    <c:if test="${param.success == 'created'}">
        <div class="alert alert-success">
            ✓ Evento creado exitosamente.
        </div>
    </c:if>
    <c:if test="${param.success == 'deleted'}">
        <div class="alert alert-success">
            ✓ Evento eliminado exitosamente.
        </div>
    </c:if>
    <c:if test="${param.error == 'not_found'}">
        <div class="alert alert-danger">
            ✗ Evento no encontrado.
        </div>
    </c:if>
    <c:if test="${param.error == 'invalid_id'}">
        <div class="alert alert-danger">
            ✗ ID de evento inválido.
        </div>
    </c:if>

    <c:choose>
        <c:when test="${empty eventos}">
            <div class="text-center text-muted fst-italic py-5">
                No hay eventos registrados.
            </div>
        </c:when>
        <c:otherwise>
            <div class="table-responsive">
                <table class="table table-hover align-middle">
                    <thead class="table-light">
                    <tr>
                        <th>ID</th>
                        <th>Nombre</th>
                        <th>Fecha</th>
                        <th>Ubicación</th>
                        <c:if test="${userRole == 'ADMIN'}">
                            <th>Acciones</th>
                        </c:if>
                    </tr>
                    </thead>
                    <tbody>
                    <c:forEach var="evento" items="${eventos}">
                        <tr>
                            <td>${evento.id}</td>
                            <td>${evento.nombre}</td>
                            <td>${evento.fecha}</td>
                            <td>${evento.ubicacion}</td>
                            <c:if test="${userRole == 'ADMIN'}">
                                <td>
                                    <form method="post" action="${pageContext.request.contextPath}/admin/delete-event"
                                          class="d-inline"
                                          onsubmit="return confirm('¿Está seguro de que desea eliminar este evento?');">
                                        <input type="hidden" name="id" value="${evento.id}">
                                        <button type="submit" class="btn btn-sm btn-danger">
                                            Eliminar
                                        </button>
                                    </form>
                                </td>
                            </c:if>
                        </tr>
                    </c:forEach>
                    </tbody>
                </table>
            </div>
        </c:otherwise>
    </c:choose>
</div>
</body>
</html>