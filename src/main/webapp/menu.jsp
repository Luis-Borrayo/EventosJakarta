<%--
  Created by IntelliJ IDEA.
  User: luisf
  Date: 13/08/2025
  Time: 22:04
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="es">
<head>
  <meta charset="UTF-8">
  <title>Eventos Jakarta</title>
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet" />
</head>
<body class="bg-light">

<nav class="navbar navbar-light bg-body-tertiary border-bottom">
  <div class="container">
    <p class="navbar-brand fw-semibold">EventosJakarta</p>
    <div class="ms-auto">
      <c:choose>
        <c:when test="${not empty sessionScope.auth and sessionScope.auth}">
          <a href="${pageContext.request.contextPath}/auth/logout"
             class="btn btn-outline-danger btn-sm">Cerrar Sesión</a>
        </c:when>
        <c:otherwise>
          <a href="${pageContext.request.contextPath}/login.jsp"
             class="btn btn-outline-primary btn-sm">Iniciar Sesión</a>
        </c:otherwise>
      </c:choose>
    </div>
  </div>
</nav>


<header class="py-5 bg-white border-bottom">
  <div class="container">
    <h1 class="display-6 fw-semibold mb-2">Sistema de Gestión de Eventos</h1>
    <p class="lead text-body-secondary mb-3">Gestione y descubra eventos fácilmente.</p>
  </div>
</header>

<section class="py-5 text-center">
  <div class="container">
    <div class="row g-4 justify-content-center">
      <div class="col-12 col-md-4">
        <div class="card h-100 shadow-sm border-0">
          <div class="card-body">
            <h5 class="card-title">📅 Ver eventos</h5>
            <p class="card-text text-body-secondary">
              Consulta la lista completa de eventos disponibles
            </p>
            <a class="btn btn-primary" href="${pageContext.request.contextPath}/events">Ir al listado</a>
          </div>
        </div>
      </div>
      <c:if test="${sessionScope.rol == 'ADMIN'}">
      <div class="col-12 col-md-4">
        <div class="card h-100 shadow-sm border-0">
          <div class="card-body">

            <h5 class="card-title">➕ Crear Evento</h5>
            <p class="card-text text-body-secondary">
              Agregar nuevos eventos al sistema.
            </p>
              <a href="${pageContext.request.contextPath}/admin/events" class="btn btn-success">Programar nuevo evento...</a>
          </div>
        </div>
      </div>
      </c:if>
    </div>
  </div>
</section>
</body>
</html>
