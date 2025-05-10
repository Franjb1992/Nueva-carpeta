/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.tfgdgd.tfgdgd;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
/**
 *
 * @author Francisco
 */


import java.util.List;

@Controller
@RequestMapping("/shippers")
public class ShipperController {

    @Autowired
    private ShipperRepository shipperRepository;

    @GetMapping
    public String list(Model model) {
        List<Shipper> shippers = shipperRepository.findAll();
        model.addAttribute("shippers", shippers);
        model.addAttribute("pageContent", "shippers/list.jsp");
        return "index"; 
    }

    @GetMapping("/new")
    public String form(Model model) {
        model.addAttribute("shipper", new Shipper());
        model.addAttribute("pageContent", "shippers/form.jsp");
        return "index";
    }

    @PostMapping("/save")
    public String save(@ModelAttribute Shipper shipper) {
        shipperRepository.save(shipper);
        return "redirect:/shippers";
    }

    @GetMapping("/edit/{id}")
    public String edit(@PathVariable Long id, Model model) {
    model.addAttribute("shipper", shipperRepository.findById(id).orElse(null));
    model.addAttribute("shippers", shipperRepository.findAll());
    model.addAttribute("pageContent", "shippers/list.jsp");  
    return "index";
}


    @GetMapping("/delete/{id}")
    public String delete(@PathVariable Long id) {
        shipperRepository.deleteById(id);
        return "redirect:/shippers";
    }
}
