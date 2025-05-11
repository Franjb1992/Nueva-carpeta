<%-- 
    Document   : generar-dgd
    Created on : 9 may 2025, 17:02:46
    Author     : Francisco
--%>
<%@ page contentType="text/html;charset=UTF-8" %>


<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<h2>Generar DGD - Material Radiactivo</h2>

<form action="${pageContext.request.contextPath}/generate-dgd/add-bulto" method="post">


    <!-- Bultos ---------------------------------------------------------------------------->
      <h4 class="mt-4">Añadir Bulto</h4>

<!-- Primera fila -->
<div class="row mb-3">
    <div class="col-md-3">
        <label class="form-label fw-bold">UN</label>
        <select name="unId" class="form-control" required>
            <option value="UN2915" selected>UN2915</option>
            <option value="UN3332">UN3332</option>
        </select>
    </div>

    <div class="col-md-5">
        <label class="form-label fw-bold">Isótopo</label>
        <select id="isotopeSelect" name="isotopeId" class="form-control" onchange="actualizarEstadoFisico()" required>
            <c:forEach var="i" items="${isotopes}">
                <option value="${i.id}" data-estado="${i.estadoFisico}">${i.nombre}</option>
            </c:forEach>
        </select>
    </div>

    <div class="col-md-4">
        <label class="form-label fw-bold">Estado Físico</label>
        <input type="text" id="estadoFisico" class="form-control" readonly />
    </div>
</div>

<!-- Segunda fila -->
<div class="row mb-3">
    <div class="col-md-3">
        <label class="form-label fw-bold">Actividad</label>
        <input type="number" name="actividad" class="form-control" value="${bultoTemp.actividad}" required />

    </div>

    <div class="col-md-2">
        <label class="form-label fw-bold">Unidad</label>
        <select name="unidadActividad" class="form-control">
            <option value="Bq">Bq</option>
            <option value="MBq" selected>MBq</option>
            <option value="GBq">GBq</option>
        </select>
    </div>

    <div class="col-md-2">
        <label class="form-label fw-bold">Cantidad</label>
        <select name="cantidadBultos" class="form-control">
            <c:forEach begin="1" end="10" var="n">
                <option value="${n}">${n}</option>
            </c:forEach>
        </select>
    </div>

    <div class="col-md-3">
        <label class="form-label fw-bold">Categoría</label>
        <select name="categoria" class="form-control">
            <option value="I-BLANCA">I-BLANCA</option>
            <option value="II-AMARILLA">II-AMARILLA</option>
            <option value="III-AMARILLA">III-AMARILLA</option>
        </select>
    </div>

    <div class="col-md-2">
        <label class="form-label fw-bold">TI</label>
        <input type="number" step="0.01" name="ti" class="form-control" required/>
    </div>
    <div id="categoriaAlerta" class="text-danger fw-bold mt-2" style="display: none;"></div>

</div>

<!-- Tercera fila -->
<div class="row mb-3">
    <div class="col-md-3">
        <label class="form-label fw-bold">Dimensiones</label>
        <input type="text" name="dimensiones" class="form-control" value="28*28*33" required/>
    </div>

    <div class="col-md-4">
        <label class="form-label fw-bold">Autorización</label>
        <input type="text" name="autorizacion" class="form-control" />
    </div>

    <div class="col-md-3">
        <label class="form-label fw-bold">Packing Inst.</label>
        <input type="text" name="packingInstruction" class="form-control" value="-" />
    </div>

    <div class="col-md-2 d-flex align-items-end">
        <button type="submit" class="btn btn-primary w-100">Añadir Bulto</button>
    </div>
</div>


</form>

<hr>

<!-- Tabla de bultos añadidos -->
<h4>Bultos añadidos</h4>
<table class="table table-bordered">
    <thead>
        <tr>
            <th>Isótopo</th>
            <th>UN ID</th>
            <th>Actividad</th>
            <th>Cantidad</th>
            <th>Categoría</th>
            <th>TI</th>
            <th>Dimensiones</th>
            <th>Acciones</th>
        </tr>
    </thead>
    <tbody>
        <c:forEach var="b" items="${bultosTemporales}">
            <tr>
                <td>${b.nombreIsotopo}</td>
                <td>${b.unId}</td>
                <td>${b.actividad} MBq</td>
                <td>${b.cantidadBultos}</td>
                <td>${b.categoria}</td>
                <td>${b.ti}</td>
                <td>${b.dimensiones}</td>
                <td>
             
                    <a href="${pageContext.request.contextPath}/generate-dgd/delete-bulto?id=${b.id}" class="btn btn-danger btn-sm">Eliminar</a>

                </td>
            </tr>
        </c:forEach>
    </tbody>
</table>

<hr>

<!-- Guardar la DGD y generar PDF -->
<form id="formularioDGD" action="${pageContext.request.contextPath}/generate-dgd/pdf" method="post">
      <!-- Datos generales del envio ------------------------------------------------>
<div class="row mb-4">
    <div class="col-md-6">
        <label class="form-label fw-bold">Shipper</label>
        <select name="shipperId" class="form-control" style="min-width: 100%;" required>
            <c:forEach var="s" items="${shippers}">
                <option value="${s.id}">${s.nombre}</option>
            </c:forEach>
        </select>
    </div>
    <div class="col-md-6">
        <label class="form-label fw-bold">Consignee</label>
        <select name="consigneeId" class="form-control" style="min-width: 100%;" required>
            <c:forEach var="c" items="${consignees}">
                <option value="${c.id}">${c.nombre}</option>
            </c:forEach>
        </select>
    </div>
</div>

<div class="row mb-4">
    <div class="col-md-6">
        <label class="form-label fw-bold">Aeropuerto de Salida</label>
        <select name="aeropuertoOrigenId" class="form-control" style="min-width: 100%;" required>
            <c:forEach var="a" items="${aeropuertos}">
                <option value="${a.id}" ${a.codigoIata == 'MAD' ? 'selected' : ''}>
                    ${a.codigoIata} - ${a.nombre} (${a.ciudad})
                </option>
            </c:forEach>

        </select>
    </div>
    <div class="col-md-6">
        <label class="form-label fw-bold">Aeropuerto de Destino</label>
        <select name="aeropuertoDestinoId" class="form-control" style="min-width: 100%;" required>
            <c:forEach var="a" items="${aeropuertos}">
                <option value="${a.id}">${a.codigoIata} - ${a.nombre} (${a.ciudad})</option>
            </c:forEach>
        </select>
        <div id="aeropuertoAlerta" class="text-danger fw-bold mt-2" style="display: none;"></div>

    </div>
</div>
    <div class="row mb-3">
        <div class="col-md-4">
            <label>Teléfono Emergencia</label>
            <input type="text" name="telefonoEmergencia" class="form-control" value="987654321" required />
        </div>
        <div class="col-md-4">
            <label>Firmado por</label>
            <input type="text" name="firmante" class="form-control"  value="Francisco J. Bernal" required/>
        </div>
        <div class="col-md-4">
            <label>Lugar</label>
            <input type="text" name="lugarFirma" class="form-control" value="Salamanca" required />
        </div>
    </div>
    <label>Fecha</label>
    <input type="date" name="fecha" class="form-control mb-3" id="fechaDgd" required />
    <button class="btn btn-success">Guardar y Generar DGD</button>
</form>
    

<!-- JavaScript para autocompletar estado físico -->
<script>
function actualizarEstadoFisico() {
    const select = document.getElementById("isotopeSelect");
    const selectedOption = select.options[select.selectedIndex];
    const estado = selectedOption.getAttribute("data-estado");
    document.getElementById("estadoFisico").value = estado || "";
}

// Al cargar la página, autocompletar si ya hay valor seleccionado
window.onload = actualizarEstadoFisico;
</script>


<script>
function verificarCategoriaTI() {
    const tiInput = document.querySelector('input[name="ti"]');
    const categoriaSelect = document.querySelector('select[name="categoria"]');
    const alertaDiv = document.getElementById("categoriaAlerta");

    const ti = parseFloat(tiInput.value);
    const categoria = categoriaSelect.value;

    let mensaje = "";
    if (!isNaN(ti)) {
        if (categoria === "I-BLANCA" && ti !== 0) {
            mensaje = "Un bulto con TI > 0 no puede tener etiqueta Blanca I.";
        } else if (categoria === "II-AMARILLA" && (ti <= 0 || ti > 1)) {
            mensaje = "TI fuera del rango típico para etiqueta Amarilla II (0 < TI <= 1).";
        } else if (categoria === "III-AMARILLA" && (ti <= 1 || ti > 10)) {
            mensaje = "TI fuera del rango típico para etiqueta Amarilla III (1 < TI <= 10).";
        }
    }

    if (mensaje) {
        alertaDiv.textContent = mensaje;
        alertaDiv.style.display = "block";
    } else {
        alertaDiv.style.display = "none";
    }
}

// Detectar cambio en TI o categoría
document.addEventListener("DOMContentLoaded", () => {
    document.querySelector('input[name="ti"]').addEventListener("input", verificarCategoriaTI);
    document.querySelector('select[name="categoria"]').addEventListener("change", verificarCategoriaTI);
});
</script>

<script>
function validarAeropuertos() {
    const origen = document.querySelector('select[name="aeropuertoOrigenId"]');
    const destino = document.querySelector('select[name="aeropuertoDestinoId"]');
    const alerta = document.getElementById("aeropuertoAlerta");

    if (origen.value && destino.value && origen.value === destino.value) {
        alerta.textContent = "El aeropuerto de salida no puede ser el mismo que el de destino.";
        alerta.style.display = "block";
    } else {
        alerta.style.display = "none";
    }
}

// Detectar cambios en ambos selects
document.addEventListener("DOMContentLoaded", () => {
    document.querySelector('select[name="aeropuertoOrigenId"]').addEventListener("change", validarAeropuertos);
    document.querySelector('select[name="aeropuertoDestinoId"]').addEventListener("change", validarAeropuertos);
});
</script>


<script>
    document.addEventListener("DOMContentLoaded", () => {
        const form = document.getElementById("formularioDGD");

        form.addEventListener("submit", function (e) {
            const filasBultos = document.querySelectorAll("table tbody tr");
            if (filasBultos.length === 0) {
                e.preventDefault(); // evita el envío
                alert("Debes añadir al menos un bulto antes de generar la DGD.");
            }
        });
    });
</script>

