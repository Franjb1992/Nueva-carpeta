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
import java.time.LocalDate;

@Entity
public class Dgd {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    private LocalDate fecha;
    private String telefonoEmergencia;
    private String firmante;
    private String lugarFirma;
    private String modoTransporte;
    private String rutaPdf;

    @ManyToOne
    private Shipper shipper;

    @ManyToOne
    private Consignee consignee;

    @ManyToOne
    private Airport aeropuertoOrigen;

    @ManyToOne
    private Airport aeropuertoDestino;

    // Getters y setters
    public Long getId() { return id; }
    public void setId(Long id) { this.id = id; }

    public LocalDate getFecha() { return fecha; }
    public void setFecha(LocalDate fecha) { this.fecha = fecha; }

    public String getTelefonoEmergencia() { return telefonoEmergencia; }
    public void setTelefonoEmergencia(String telefonoEmergencia) { this.telefonoEmergencia = telefonoEmergencia; }

    public String getFirmante() { return firmante; }
    public void setFirmante(String firmante) { this.firmante = firmante; }

    public String getLugarFirma() { return lugarFirma; }
    public void setLugarFirma(String lugarFirma) { this.lugarFirma = lugarFirma; }

    public String getModoTransporte() { return modoTransporte; }
    public void setModoTransporte(String modoTransporte) { this.modoTransporte = modoTransporte; }

    public String getRutaPdf() { return rutaPdf; }
    public void setRutaPdf(String rutaPdf) { this.rutaPdf = rutaPdf; }

    public Shipper getShipper() { return shipper; }
    public void setShipper(Shipper shipper) { this.shipper = shipper; }

    public Consignee getConsignee() { return consignee; }
    public void setConsignee(Consignee consignee) { this.consignee = consignee; }

    public Airport getAeropuertoOrigen() { return aeropuertoOrigen; }
    public void setAeropuertoOrigen(Airport aeropuertoOrigen) { this.aeropuertoOrigen = aeropuertoOrigen; }

    public Airport getAeropuertoDestino() { return aeropuertoDestino; }
    public void setAeropuertoDestino(Airport aeropuertoDestino) { this.aeropuertoDestino = aeropuertoDestino; }
}
