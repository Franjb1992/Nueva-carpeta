/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.tfgdgd.tfgdgd;

import org.springframework.web.bind.annotation.GetMapping;

/**
 *
 * @author Francisco
 */
public class HomeController {

    @GetMapping("/")
    public String index() {
        return "index"; // Se refiere a index.jsp en /WEB-INF/views/
    }
}
