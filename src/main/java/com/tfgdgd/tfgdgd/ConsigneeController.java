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
@RequestMapping("/consignees")
public class ConsigneeController {

    @Autowired
    private ConsigneeRepository consigneeRepository;

    @GetMapping
    public String list(Model model) {
        List<Consignee> consignees = consigneeRepository.findAll();
        model.addAttribute("consignees", consignees);
        model.addAttribute("consignee", new Consignee()); // objeto para el formulario
        model.addAttribute("pageContent", "consignees/list.jsp");
        return "index";
    }

    @PostMapping("/save")
    public String save(@ModelAttribute Consignee consignee) {
        consigneeRepository.save(consignee);
        return "redirect:/consignees";
    }

    @GetMapping("/edit/{id}")
    public String edit(@PathVariable Long id, Model model) {
        model.addAttribute("consignees", consigneeRepository.findAll());
        model.addAttribute("consignee", consigneeRepository.findById(id).orElse(new Consignee()));
        model.addAttribute("pageContent", "consignees/list.jsp");
        return "index";
    }

    @GetMapping("/delete/{id}")
    public String delete(@PathVariable Long id) {
        consigneeRepository.deleteById(id);
        return "redirect:/consignees";
    }
}
