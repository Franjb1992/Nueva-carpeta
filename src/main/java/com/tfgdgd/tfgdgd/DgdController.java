/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.tfgdgd.tfgdgd;

/**
 *
 * @author Francisco
 */


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import jakarta.servlet.http.HttpSession;
import java.io.File;
import java.io.IOException;

import java.time.LocalDate;
import java.util.ArrayList;
import java.util.List;
import java.util.Optional;
import org.springframework.data.domain.Sort;

@Controller
@RequestMapping("/generate-dgd")
public class DgdController {

    @Autowired private ShipperRepository shipperRepository;
    @Autowired private ConsigneeRepository consigneeRepository;
    @Autowired private AirportRepository airportRepository;
    @Autowired private IsotopeRepository isotopeRepository;
    @Autowired private DgdRepository dgdRepository;
    @Autowired private BultoRepository bultoRepository;

    @GetMapping
    public String showForm(Model model, HttpSession session) {
        model.addAttribute("shippers", shipperRepository.findAll());
        model.addAttribute("consignees", consigneeRepository.findAll());
        model.addAttribute("aeropuertos", airportRepository.findAll());
        model.addAttribute("isotopes", isotopeRepository.findAll());

        if (session.getAttribute("bultos") == null) {
            session.setAttribute("bultos", new ArrayList<BultoTemp>());
        }

        model.addAttribute("bultosTemporales", session.getAttribute("bultos"));
        model.addAttribute("pageContent", "dgd/generate-dgd.jsp");
        return "index";
    }

    @PostMapping("/add-bulto")
    public String addBulto(@ModelAttribute BultoTemp bulto, HttpSession session) {
        List<BultoTemp> bultos = (List<BultoTemp>) session.getAttribute("bultos");
        bulto.setId(System.currentTimeMillis());

        Optional<Isotope> iso = isotopeRepository.findById(bulto.getIsotopeId());
        iso.ifPresent(i -> {
            bulto.setNombreIsotopo(i.getNombre());
        });

        bultos.add(bulto);
        return "redirect:/generate-dgd";
    }

    @GetMapping("/delete-bulto")
    public String deleteBulto(@RequestParam("id") long id, HttpSession session) {
        List<BultoTemp> bultos = (List<BultoTemp>) session.getAttribute("bultos");
        bultos.removeIf(b -> b.getId() == id);
        return "redirect:/generate-dgd";
    }
    
    @GetMapping("/edit-bulto")
    public String editarBulto(@RequestParam("id") long id, HttpSession session, Model model) {
    List<BultoTemp> bultos = (List<BultoTemp>) session.getAttribute("bultos");
    BultoTemp bultoEditar = null;
    for (BultoTemp b : bultos) {
        if (b.getId() == id) {
            bultoEditar = b;
            break;
        }
    }

    // Eliminar el antiguo de la lista
    if (bultoEditar != null) {
        bultos.removeIf(b -> b.getId() == id);
        model.addAttribute("bultoTemp", bultoEditar);
    }

    // Preparar el resto de datos para el formulario
    model.addAttribute("shippers", shipperRepository.findAll());
    model.addAttribute("consignees", consigneeRepository.findAll());
    model.addAttribute("aeropuertos", airportRepository.findAll());
    model.addAttribute("isotopes", isotopeRepository.findAll());
    model.addAttribute("bultosTemporales", bultos);
    model.addAttribute("pageContent", "dgd/generate-dgd.jsp");
    return "index";
}


    @PostMapping("/pdf")
    public String guardarDgd(
            @RequestParam Long shipperId,
            @RequestParam Long consigneeId,
            @RequestParam Long aeropuertoOrigenId,
            @RequestParam Long aeropuertoDestinoId,
            
            @RequestParam String telefonoEmergencia,
            @RequestParam String firmante,
            @RequestParam String lugarFirma,
            @RequestParam String fecha,
            HttpSession session) {

        List<BultoTemp> bultosTemp = (List<BultoTemp>) session.getAttribute("bultos");

        // Guardar la DGD
        Dgd dgd = new Dgd();
        dgd.setFecha(LocalDate.parse(fecha));
        dgd.setShipper(shipperRepository.findById(shipperId).orElse(null));
        dgd.setConsignee(consigneeRepository.findById(consigneeId).orElse(null));
        dgd.setAeropuertoOrigen(airportRepository.findById(aeropuertoOrigenId).orElse(null));
        dgd.setAeropuertoDestino(airportRepository.findById(aeropuertoDestinoId).orElse(null));
        
        dgd.setTelefonoEmergencia(telefonoEmergencia);
        dgd.setFirmante(firmante);
        dgd.setLugarFirma(lugarFirma);
        dgdRepository.save(dgd);

        // Guardar los bultos
        for (BultoTemp bt : bultosTemp) {
            Bulto b = new Bulto();
            b.setDgd(dgd);
            b.setIsotope(isotopeRepository.findById(bt.getIsotopeId()).orElse(null));
            b.setUnId(bt.getUnId());
            b.setActividad(bt.getActividad());
            b.setCantidadBultos(bt.getCantidadBultos());
            b.setCategoria(bt.getCategoria());
            b.setTi(bt.getTi());
            b.setDimensiones(bt.getDimensiones());
            b.setAutorizacion(bt.getAutorizacion());
            b.setPackingInstruction(bt.getPackingInstruction());
            bultoRepository.save(b);
        }

        
        
        try {
            String plantilla = "src/main/resources/static/plantilla DGD.pdf";
            String destino = "src/main/resources/static/pdfs/DGD_" + dgd.getId() + ".pdf";
            
            new File("src/main/resources/static/pdfs/").mkdirs();

            List<Bulto> bultosFinales = bultoRepository.findByDgd(dgd);
            DgdPdfGenerator.generarPdfDesdePlantilla(dgd, bultosFinales, plantilla, destino);

            dgd.setRutaPdf("DGD_" + dgd.getId() + ".pdf");
            dgdRepository.save(dgd);
            } catch (IOException e) {
                e.printStackTrace(); // para depuración
            }

        // Limpiar sesión
        session.removeAttribute("bultos");

        return "redirect:/generate-dgd/history";  // o a una confirmación
    }

    @GetMapping("/history")
    public String verHistorial(Model model) {
        List<Dgd> historial = dgdRepository.findAll(Sort.by(Sort.Direction.DESC, "id"));
        model.addAttribute("dgds", historial);
        model.addAttribute("pageContent", "dgd/history.jsp");
        return "index";
    }
}