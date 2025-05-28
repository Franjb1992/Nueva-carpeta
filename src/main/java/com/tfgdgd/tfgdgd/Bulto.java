/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.tfgdgd.tfgdgd;

/**
 *
 * @author Francisco
 */


import jakarta.persistence.*;

@Entity
public class Bulto {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    private String unId;
    private double actividad;
    private String unidadActividad;
    private int cantidadBultos;
    private String categoria;
    private double ti;
    private String dimensiones;
    private String autorizacion;
    private String packingInstruction;

    @ManyToOne
    private Isotope isotope;

    @ManyToOne
    private Dgd dgd;

    // Getters y setters
    public Long getId() { return id; }
    public void setId(Long id) { this.id = id; }

    public String getUnId() { return unId; }
    public void setUnId(String unId) { this.unId = unId; }

    public double getActividad() { return actividad; }
    public void setActividad(double actividad) { this.actividad = actividad; }
    
    public String getunidadActividad() { return unidadActividad; }
    public void setunidadActividad(String unidadActividad) { this.unidadActividad = unidadActividad; }

    public int getCantidadBultos() { return cantidadBultos; }
    public void setCantidadBultos(int cantidadBultos) { this.cantidadBultos = cantidadBultos; }

    public String getCategoria() { return categoria; }
    public void setCategoria(String categoria) { this.categoria = categoria; }

    public double getTi() { return ti; }
    public void setTi(double ti) { this.ti = ti; }

    public String getDimensiones() { return dimensiones; }
    public void setDimensiones(String dimensiones) { this.dimensiones = dimensiones; }

    public String getAutorizacion() { return autorizacion; }
    public void setAutorizacion(String autorizacion) { this.autorizacion = autorizacion; }

    public String getPackingInstruction() { return packingInstruction; }
    public void setPackingInstruction(String packingInstruction) { this.packingInstruction = packingInstruction; }

    public Isotope getIsotope() { return isotope; }
    public void setIsotope(Isotope isotope) { this.isotope = isotope; }

    public Dgd getDgd() { return dgd; }
    public void setDgd(Dgd dgd) { this.dgd = dgd; }
}
