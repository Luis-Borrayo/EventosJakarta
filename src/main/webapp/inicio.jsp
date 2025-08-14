<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Sistema de Eventos - Inicio</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            margin: 0;
            padding: 20px;
            background-color: #f5f5f5;
        }
        .container {
            max-width: 800px;
            margin: 0 auto;
            background-color: white;
            padding: 30px;
            border-radius: 8px;
            box-shadow: 0 2px 4px rgba(0,0,0,0.1);
        }
        h1 {
            color: #333;
            text-align: center;
            margin-bottom: 30px;
        }
        .welcome-message {
            text-align: center;
            margin-bottom: 40px;
            color: #666;
        }
        .menu {
            display: grid;
            grid-template-columns: repeat(auto-fit, minmax(250px, 1fr));
            gap: 20px;
            margin-bottom: 30px;
        }
        .menu-item {
            background-color: #007bff;
            color: white;
            padding: 20px;
            border-radius: 8px;
            text-decoration: none;
            text-align: center;
            transition: background-color 0.3s;
        }
        .menu-item:hover {
            background-color: #0056b3;
            color: white;
            text-decoration: none;
        }
        .menu-item h3 {
            margin: 0 0 10px 0;
        }
        .menu-item p {
            margin: 0;
            font-size: 14px;
            opacity: 0.9;
        }
        .admin-section {
            background-color: #28a745;
        }
        .admin-section:hover {
            background-color: #1e7e34;
        }
        .user-info {
            text-align: center;
            margin-top: 30px;
            padding-top: 20px;
            border-top: 1px solid #eee;
            color: #666;
        }
        .logout-btn {
            background-color: #dc3545;
            color: white;
            padding: 10px 20px;
            border: none;
            border-radius: 4px;
            cursor: pointer;
            text-decoration: none;
            display: inline-block;
            margin-top: 10px;
        }
        .logout-btn:hover {
            background-color: #c82333;
            color: white;
            text-decoration: none;
        }
    </style>
</head>
<body>
    <div class="container">
        <h1>Sistema de Gestión de Eventos</h1>
        
        <div class="welcome-message">
            <p>Bienvenido al sistema de gestión de eventos</p>
            <c:if test="${not empty sessionScope.usuariorepo}">
                <p><strong>Usuario:</strong> ${sessionScope.usuariorepo}</p>
                <p><strong>Rol:</strong> ${sessionScope.rol}</p>
            </c:if>
        </div>

        <div class="menu">
            <a href="${pageContext.request.contextPath}/events" class="menu-item">
                <h3>📅 Ver Eventos</h3>
                <p>Consulta la lista completa de eventos disponibles</p>
            </a>
            
            <c:if test="${sessionScope.rol == 'ADMIN'}">
                <a href="${pageContext.request.contextPath}/admin/events" class="menu-item admin-section">
                    <h3>➕ Crear Evento</h3>
                    <p>Agregar nuevos eventos al sistema</p>
                </a>
            </c:if>
        </div>

        <div class="user-info">
            <c:choose>
                <c:when test="${not empty sessionScope.auth and sessionScope.auth}">
                    <p>Sesión activa</p>
                    <a href="${pageContext.request.contextPath}/auth/logout" class="logout-btn">Cerrar Sesión</a>
                </c:when>
                <c:otherwise>
                    <a href="${pageContext.request.contextPath}/login.jsp" class="logout-btn">Iniciar Sesión</a>
                </c:otherwise>
            </c:choose>
        </div>
    </div>
</body>
</html>
