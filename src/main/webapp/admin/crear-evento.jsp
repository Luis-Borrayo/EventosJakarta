<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Crear Evento</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            margin: 20px;
            background-color: #f5f5f5;
        }
        .container {
            max-width: 600px;
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
        .form-group {
            margin-bottom: 20px;
        }
        label {
            display: block;
            margin-bottom: 5px;
            font-weight: bold;
            color: #555;
        }
        input[type="text"], input[type="date"] {
            width: 100%;
            padding: 12px;
            border: 1px solid #ddd;
            border-radius: 4px;
            font-size: 16px;
            box-sizing: border-box;
        }
        input[type="text"]:focus, input[type="date"]:focus {
            border-color: #007bff;
            outline: none;
            box-shadow: 0 0 0 2px rgba(0,123,255,0.25);
        }
        .btn {
            padding: 12px 24px;
            border: none;
            border-radius: 4px;
            cursor: pointer;
            text-decoration: none;
            display: inline-block;
            font-size: 16px;
            margin-right: 10px;
        }
        .btn-primary {
            background-color: #007bff;
            color: white;
        }
        .btn-secondary {
            background-color: #6c757d;
            color: white;
        }
        .btn:hover {
            opacity: 0.8;
        }
        .form-actions {
            text-align: center;
            margin-top: 30px;
        }
        .alert {
            padding: 15px;
            margin-bottom: 20px;
            border: 1px solid transparent;
            border-radius: 4px;
        }
        .alert-error {
            color: #721c24;
            background-color: #f8d7da;
            border-color: #f5c6cb;
        }
        .required {
            color: #dc3545;
        }
    </style>
</head>
<body>
    <div class="container">
        <h1>Crear Nuevo Evento</h1>
        
        <c:if test="${not empty error}">
            <div class="alert alert-error">
                ✗ ${error}
            </div>
        </c:if>

        <form method="post" action="${pageContext.request.contextPath}/admin/events">
            <div class="form-group">
                <label for="nombre">Nombre del Evento <span class="required">*</span></label>
                <input type="text" id="nombre" name="nombre" required 
                       placeholder="Ingrese el nombre del evento"
                       value="${param.nombre}">
            </div>

            <div class="form-group">
                <label for="fecha">Fecha <span class="required">*</span></label>
                <input type="date" id="fecha" name="fecha" required
                       value="${param.fecha}">
            </div>

            <div class="form-group">
                <label for="ubicacion">Ubicación <span class="required">*</span></label>
                <input type="text" id="ubicacion" name="ubicacion" required 
                       placeholder="Ingrese la ubicación del evento"
                       value="${param.ubicacion}">
            </div>

            <div class="form-actions">
                <button type="submit" class="btn btn-primary">Crear Evento</button>
                <a href="${pageContext.request.contextPath}/events" class="btn btn-secondary">Cancelar</a>
            </div>
        </form>
    </div>
</body>
</html>
