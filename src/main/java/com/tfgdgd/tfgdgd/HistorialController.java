/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.tfgdgd.tfgdgd;

import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.data.domain.Sort;

/**
 *
 * @author Francisco
 */
@Controller
public class HistorialController {

    @Autowired
    private DgdRepository dgdRepository;

    @GetMapping("/history")
    public String verHistorial(Model model) {
        List<Dgd> historial = dgdRepository.findAll(Sort.by(Sort.Direction.DESC, "id"));
        model.addAttribute("dgds", historial);
        model.addAttribute("pageContent", "dgd/history.jsp");
        return "index";
    }
}

