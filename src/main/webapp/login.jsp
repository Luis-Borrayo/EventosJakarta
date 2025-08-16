<%--
  Created by IntelliJ IDEA.
  User: luisf
  Date: 12/08/2025
  Time: 06:29
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" language="java" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="es">
<head>
  <meta charset="UTF-8">
  <title>Eventos Jakarta</title>
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet" />
</head>
<body>
<main class="container d-flex align-items-center justify-content-center" style="min-height: 80vh;">
  <div class="col-12 col-sm-10 col-md-7 col-lg-5">
    <div class="card shadow-sm border-0">
      <div class="card-body p-4">
        <h1 class="h4 text-center mb-1">Bienvenido de nuevo</h1>
        <p class="text-center text-body-secondary mb-4">Inicie sesión para continuar</p>

        <c:if test="${param.err == '1'}">
          <div class="alert alert-danger" role="alert">
            Credenciales inválidas. Verifique su correo o contraseña.
          </div>
        </c:if>

        <c:if test="${not empty cookie.lastLogin.value}">
          <div class="alert alert-info py-2 small" role="alert">
            Último acceso: ${cookie.lastLogin.value}
          </div>
        </c:if>
        <c:if test="${param.msg == 'registrado'}">
          <div class="alert alert-success" role="alert">
            Usuario registrado exitosamente.
          </div>
        </c:if>

        <form class="needs-validation" method="post" action="${pageContext.request.contextPath}/auth/login">
          <div class="mb-3">
            <label for="email" class="form-label">Correo</label>
            <input id="email" name="correo" type="email" class="form-control" placeholder="Correo electrónico" required>
            <div class="invalid-feedback">Ingrese un correo válido.</div>
          </div>

          <div class="mb-3">
            <label for="password" class="form-label">Contraseña</label>
            <input id="password" name="contra" type="password" class="form-control" placeholder="Ingrese contraseña" required>
            <div class="invalid-feedback">Ingrese su contraseña.</div>
          </div>

          <button class="btn btn-primary w-100" type="submit">Entrar</button>
        </form>

        <p class="mt-3 mb-0 text-center small text-body-secondary">
          ¿No tiene cuenta? <a href="${pageContext.request.contextPath}/registro.jsp">Regístrese</a>
        </p>
      </div>
    </div>
  </div>
</main>
</body>
</html>