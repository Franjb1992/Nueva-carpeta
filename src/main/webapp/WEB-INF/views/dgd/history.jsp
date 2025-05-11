<%-- 
    Document   : history
    Created on : 9 may 2025, 17:16:44
    Author     : Francisco
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>


<h2>Historial de DGDs Generadas</h2>

<table class="table table-bordered">
    <thead>
        <tr>
            <th>ID</th>
            <th>Fecha</th>
            <th>Shipper</th>
            <th>Consignee</th>
            <th>Origen</th>
            <th>Destino</th>
            <th>PDF</th>
        </tr>
    </thead>
    <tbody>
        <c:forEach var="dgd" items="${dgds}">
            <tr>
                <td>${dgd.id}</td>
                <td>${dgd.fecha}</td>
                <td>${dgd.shipper.nombre}</td>
                <td>${dgd.consignee.nombre}</td>
                <td>${dgd.aeropuertoOrigen.codigoIata}</td>
                <td>${dgd.aeropuertoDestino.codigoIata}</td>
                <td>
                    <c:if test="${not empty dgd.rutaPdf}">
                        <a href="${pageContext.request.contextPath}/pdfs/${dgd.rutaPdf}" target="_blank">Ver PDF</a>
                    </c:if>
                    <c:if test="${empty dgd.rutaPdf}">
                        No disponible
                    </c:if>
                </td>
            </tr>
        </c:forEach>
    </tbody>
</table>