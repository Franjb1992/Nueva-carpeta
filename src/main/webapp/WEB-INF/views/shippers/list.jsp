<%-- 
    Document   : list
    Created on : 8 may 2025, 21:11:34
    Author     : Francisco
--%>

<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<h2>Gestión de Shippers</h2>

<!-- === Formulario para añadir/editar Shipper === -->
<form action="${pageContext.request.contextPath}/shippers/save" method="post" class="mb-4">
    <input type="hidden" name="id" value="${shipper.id}" />

    <div class="row">
        <div class="col-md-4">
            <label>Nombre</label>
            <input type="text" class="form-control" name="nombre" value="${shipper.nombre}" required />
        </div>
        <div class="col-md-4">
            <label>Dirección</label>
            <input type="text" class="form-control" name="direccion" value="${shipper.direccion}" />
        </div>
        <div class="col-md-4">
            <label>Ciudad</label>
            <input type="text" class="form-control" name="ciudad" value="${shipper.ciudad}" />
        </div>
    </div>

    <div class="row mt-2">
        <div class="col-md-4">
            <label>Código Postal</label>
            <input type="text" class="form-control" name="codigo_postal" value="${shipper.codigo_postal}" />
        </div>
        <div class="col-md-4">
            <label>País</label>
            <input type="text" class="form-control" name="pais" value="${shipper.pais}" />
        </div>
        <div class="col-md-4">
            <label>Teléfono</label>
            <input type="text" class="form-control" name="telefono" value="${shipper.telefono}" />
        </div>
    </div>

        <button type="submit" class="btn btn-success mt-3">Guardar Shipper</button>
</form>

<!-- === Tabla de Shippers existentes === -->
<table class="table table-bordered">
    <thead>
        <tr>
            <th>Nombre</th>
            <th>Dirección</th>
            <th>Ciudad</th>
            <th>Código Postal</th>
            <th>País</th>
            <th>Teléfono</th>
            <th>Acciones</th>
        </tr>
    </thead>
    <tbody>
        <c:forEach var="shipper" items="${shippers}">
            <tr>
                <td>${shipper.nombre}</td>
                <td>${shipper.direccion}</td>
                <td>${shipper.ciudad}</td>
                <td>${shipper.codigo_postal}</td>
                <td>${shipper.pais}</td>
                <td>${shipper.telefono}</td>
                <td>
                    <a href="${pageContext.request.contextPath}/shippers/edit/${shipper.id}" class="btn btn-warning btn-sm">Editar</a>
                    <a href="${pageContext.request.contextPath}/shippers/delete/${shipper.id}" class="btn btn-danger btn-sm">Eliminar</a>
                </td>
            </tr>
        </c:forEach>
    </tbody>
</table>