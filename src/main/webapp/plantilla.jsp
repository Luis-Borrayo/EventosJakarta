<%--
  Created by IntelliJ IDEA.
  User: luisf
  Date: 11/08/2025
  Time: 21:51
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" language="java" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<html>
<head>
    <jsp:include page="/templates/head.jsp" />
</head>
<body>
<div>
    <jsp:include page="${contenido}" />
</div>
</body>
</html>