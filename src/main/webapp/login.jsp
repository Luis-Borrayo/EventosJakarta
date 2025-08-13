<%--
  Created by IntelliJ IDEA.
  User: luisf
  Date: 12/08/2025
  Time: 06:29
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" language="java" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<form method="post" action="${pageContext.request.contextPath}/auth/login">
  <div>
    <h3>Inicio de Sesión</h3>
    <div>
      <input type="email" name="correo" placeholder="Correo electrónico" required>
    </div>
    <div>
      <input type="password" name="contra" placeholder="Ingrese contraseña" required>
    </div>
    <div>
      <button type="submit">Ingresar</button>
      <a href="##">Registrate ahora</a>
    </div>
  </div>
</form>