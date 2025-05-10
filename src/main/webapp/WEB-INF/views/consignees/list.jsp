<%-- 
    Document   : list
    Created on : 9 may 2025, 18:06:44
    Author     : Francisco
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<h2>Gestión de Consignees</h2>

<!-- Formulario de Consignee -->
<form action="${pageContext.request.contextPath}/consignees/save" method="post" class="mb-4">
    <input type="hidden" name="id" value="${consignee.id}" />

    <div class="mb-2">
        <label>Nombre:</label>
        <input type="text" class="form-control" name="nombre" value="${consignee.nombre}" required />
    </div>
    <div class="mb-2">
        <label>Dirección:</label>
        <input type="text" class="form-control" name="direccion" value="${consignee.direccion}" required />
    </div>
    <div class="mb-2">
        <label>Teléfono:</label>
        <input type="text" class="form-control" name="telefono" value="${consignee.telefono}" required />
    </div>

    <button type="submit" class="btn btn-success">Guardar</button>
</form>

<!-- Tabla de Consignees -->
<table class="table table-bordered">
    <thead>
        <tr>
            <th>Nombre</th>
            <th>Dirección</th>
            <th>Teléfono</th>
            <th>Acciones</th>
        </tr>
    </thead>
    <tbody>
        <c:forEach var="consignee" items="${consignees}">
            <tr>
                <td>${consignee.nombre}</td>
                <td>${consignee.direccion}</td>
                <td>${consignee.telefono}</td>
                <td>
                    <a href="${pageContext.request.contextPath}/consignees/edit/${consignee.id}" class="btn btn-warning btn-sm">Editar</a>
                    <a href="${pageContext.request.contextPath}/consignees/delete/${consignee.id}" class="btn btn-danger btn-sm">Eliminar</a>
                </td>
            </tr>
        </c:forEach>
    </tbody>
</table>
