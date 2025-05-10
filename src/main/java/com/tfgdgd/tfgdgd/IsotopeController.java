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

import java.util.List;

@Controller
@RequestMapping("/isotopes")
public class IsotopeController {

    @Autowired
    private IsotopeRepository isotopeRepository;

    @GetMapping
    public String list(Model model) {
        List<Isotope> isotopes = isotopeRepository.findAll();
        model.addAttribute("isotopes", isotopes);
        model.addAttribute("isotope", new Isotope()); // para el formulario
        model.addAttribute("pageContent", "isotopes/list.jsp");
        return "index";
    }

    @PostMapping("/save")
    public String save(@ModelAttribute Isotope isotope) {
        isotopeRepository.save(isotope);
        return "redirect:/isotopes";
    }

    @GetMapping("/edit/{id}")
    public String edit(@PathVariable Long id, Model model) {
        Isotope isotope = isotopeRepository.findById(id).orElse(new Isotope());
        model.addAttribute("isotope", isotope);
        model.addAttribute("isotopes", isotopeRepository.findAll()); // recargar lista
        model.addAttribute("pageContent", "isotopes/list.jsp");
        return "index";
    }

    @GetMapping("/delete/{id}")
    public String delete(@PathVariable Long id) {
        isotopeRepository.deleteById(id);
        return "redirect:/isotopes";
    }
}
