<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Lista de Eventos</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            margin: 20px;
            background-color: #f5f5f5;
        }
        .container {
            max-width: 1000px;
            margin: 0 auto;
            background-color: white;
            padding: 20px;
            border-radius: 8px;
            box-shadow: 0 2px 4px rgba(0,0,0,0.1);
        }
        h1 {
            color: #333;
            text-align: center;
            margin-bottom: 30px;
        }
        .header-actions {
            display: flex;
            justify-content: space-between;
            align-items: center;
            margin-bottom: 20px;
        }
        .btn {
            padding: 10px 20px;
            border: none;
            border-radius: 4px;
            cursor: pointer;
            text-decoration: none;
            display: inline-block;
            font-size: 14px;
        }
        .btn-primary {
            background-color: #007bff;
            color: white;
        }
        .btn-danger {
            background-color: #dc3545;
            color: white;
        }
        .btn-secondary {
            background-color: #6c757d;
            color: white;
        }
        .btn:hover {
            opacity: 0.8;
        }
        table {
            width: 100%;
            border-collapse: collapse;
            margin-top: 20px;
        }
        th, td {
            padding: 12px;
            text-align: left;
            border-bottom: 1px solid #ddd;
        }
        th {
            background-color: #f8f9fa;
            font-weight: bold;
        }
        tr:hover {
            background-color: #f5f5f5;
        }
        .alert {
            padding: 15px;
            margin-bottom: 20px;
            border: 1px solid transparent;
            border-radius: 4px;
        }
        .alert-success {
            color: #155724;
            background-color: #d4edda;
            border-color: #c3e6cb;
        }
        .alert-error {
            color: #721c24;
            background-color: #f8d7da;
            border-color: #f5c6cb;
        }
        .no-events {
            text-align: center;
            color: #666;
            font-style: italic;
            padding: 40px;
        }
    </style>
</head>
<body>
    <div class="container">
        <h1>Lista de Eventos</h1>
        
        <div class="header-actions">
            <div>
                <a href="${pageContext.request.contextPath}/inicio.jsp" class="btn btn-secondary">← Volver al Inicio</a>
            </div>
            <div>
                <c:if test="${userRole == 'ADMIN'}">
                    <a href="${pageContext.request.contextPath}/admin/events" class="btn btn-primary">+ Crear Evento</a>
                </c:if>
            </div>
        </div>

        <!-- Success/Error Messages -->
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
            <div class="alert alert-error">
                ✗ Evento no encontrado.
            </div>
        </c:if>
        <c:if test="${param.error == 'invalid_id'}">
            <div class="alert alert-error">
                ✗ ID de evento inválido.
            </div>
        </c:if>

        <!-- Events Table -->
        <c:choose>
            <c:when test="${empty eventos}">
                <div class="no-events">
                    <p>No hay eventos registrados.</p>
                </div>
            </c:when>
            <c:otherwise>
                <table>
                    <thead>
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
                                              style="display: inline;" 
                                              onsubmit="return confirm('¿Está seguro de que desea eliminar este evento?');">
                                            <input type="hidden" name="id" value="${evento.id}">
                                            <button type="submit" class="btn btn-danger">Eliminar</button>
                                        </form>
                                    </td>
                                </c:if>
                            </tr>
                        </c:forEach>
                    </tbody>
                </table>
            </c:otherwise>
        </c:choose>
    </div>
</body>
</html>
