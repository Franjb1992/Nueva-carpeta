<%-- 
    Document   : list
    Created on : 9 may 2025, 18:07:12
    Author     : Francisco
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<h2>Gestión de Isótopos</h2>

<!-- Formulario de Isótopo -->
<form action="${pageContext.request.contextPath}/isotopes/save" method="post" class="mb-4">
    <input type="hidden" name="id" value="${isotope.id}" />

    <div class="mb-2">
        <label>Nombre:</label>
        <input type="text" class="form-control" name="nombre" value="${isotope.nombre}" required />
    </div>
    <div class="mb-2">
        <label>Actividad (en Bq):</label>
        <input type="number" step="0.01" class="form-control" name="actividad" value="${isotope.actividad}" required />
    </div>
    <div class="mb-2">
        <label>Estado Físico:</label>
        <input type="text" class="form-control" name="estadoFisico" value="${isotope.estadoFisico}" required />
    </div>

    <button type="submit" class="btn btn-success">Guardar</button>
</form>

<!-- Tabla de Isótopos -->
<table class="table table-bordered">
    <thead>
        <tr>
            <th>Nombre</th>
            <th>Actividad (Bq)</th>
            <th>Estado Físico</th>
            <th>Acciones</th>
        </tr>
    </thead>
    <tbody>
        <c:forEach var="isotope" items="${isotopes}">
            <tr>
                <td>${isotope.nombre}</td>
                <td>${isotope.actividad}</td>
                <td>${isotope.estadoFisico}</td>
                <td>
                    <a href="${pageContext.request.contextPath}/isotopes/edit/${isotope.id}" class="btn btn-warning btn-sm">Editar</a>
                    <a href="${pageContext.request.contextPath}/isotopes/delete/${isotope.id}" class="btn btn-danger btn-sm">Eliminar</a>
                </td>
            </tr>
        </c:forEach>
    </tbody>
</table>

