<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Gestor de DGDs</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/style.css">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css">
</head>
<body>

    <!-- Menú lateral -->
    <div id="sidebar">
        <h4>Menú</h4>
        <a href="${pageContext.request.contextPath}generate-dgd"> Generar DGD</a>
        <a href="${pageContext.request.contextPath}/shippers">Shippers</a>
        <a href="${pageContext.request.contextPath}/consignees"> Consignees</a>
        <a href="${pageContext.request.contextPath}/isotopes"> Isótopos</a>
        <div style="flex-grow: 1;"></div> 
        <a href="${pageContext.request.contextPath}/history"> Historial DGDs</a>
    </div>

    <!-- Contenido principal -->
    <div id="main-content">
        <jsp:include page="${pageContent}" />
    </div>

</body>
</html>
