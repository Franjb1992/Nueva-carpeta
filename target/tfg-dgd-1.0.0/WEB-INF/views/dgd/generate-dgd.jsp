<%-- 
    Document   : generar-dgd
    Created on : 9 may 2025, 17:02:46
    Author     : Francisco
--%>
<%@ page contentType="text/html;charset=UTF-8" %>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<h2>Generar Declaración de Mercancías Peligrosas (DGD)</h2>

<form action="${pageContext.request.contextPath}/generate-dgd/pdf" method="post">
    
    <button type="submit" class="btn btn-success">Generar PDF</button>
</form>
