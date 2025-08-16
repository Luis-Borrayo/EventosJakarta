<%--
  Created by IntelliJ IDEA.
  User: luisf
  Date: 15/08/2025
  Time: 10:19
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" language="java" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="es">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Registro de Usuario</title>
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
</head>
<body>

<main class="container d-flex align-items-center justify-content-center" style="min-height: 80vh;">
  <div class="col-12 col-sm-10 col-md-7 col-lg-5">
    <div class="card shadow-sm border-0 rounded-3">
      <div class="card-body p-4">

        <div class="text-center mb-3">
          <i class="fa-solid fa-user-plus fa-2x text-primary"></i>
          <h1 class="h4 mt-2 mb-1">Registro de Usuario</h1>
          <p class="text-body-secondary mb-4">Crea tu cuenta para acceder al sistema</p>
        </div>
        <c:if test="${param.err == 'existe'}">
          <div class="alert alert-danger">El usuario ya existe. Intente con otro correo.</div>
        </c:if>

        <c:if test="${param.msg == 'registrado'}">
          <div class="alert alert-success">
            Usuario registrado exitosamente.
            <a href="${pageContext.request.contextPath}/login.jsp">Inicia sesión</a>.
          </div>
        </c:if>
        <form method="post" action="${pageContext.request.contextPath}/auth/registro">
          <div class="mb-3">
            <label for="nombre" class="form-label">Nombre</label>
            <input type="text" class="form-control" id="nombre" name="nombre" placeholder="Tu nombre completo" required>
            <div class="invalid-feedback">Ingrese su nombre completo.</div>
          </div>
          <div class="mb-3">
            <label for="email" class="form-label">Correo electrónico</label>
            <input type="email" class="form-control" id="email" name="correo" placeholder="ejemplo@correo.com" required>
            <div class="invalid-feedback">Ingrese un correo válido.</div>
          </div>
          <div class="mb-3">
            <label for="password" class="form-label">Contraseña</label>
            <input type="password" class="form-control" id="password" name="contra" placeholder="Ingrese contraseña" required>
            <div class="invalid-feedback">Ingrese su contraseña.</div>
          </div>
          <button type="submit" class="btn btn-primary w-100">
            <i class="fa-solid fa-paper-plane"></i> Registrarse
          </button>
        </form>
        <p class="mt-3 mb-0 text-center small text-body-secondary">
          ¿Ya tienes cuenta? <a href="${pageContext.request.contextPath}/login.jsp">Inicia sesión</a>
        </p>
      </div>
    </div>
  </div>
</main>
</body>
</html>
