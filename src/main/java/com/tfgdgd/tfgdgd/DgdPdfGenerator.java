/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.tfgdgd.tfgdgd;

/**
 *
 * @author Francisco
 */


import com.itextpdf.kernel.pdf.*;
import com.itextpdf.kernel.geom.PageSize;
import com.itextpdf.kernel.font.PdfFont;
import com.itextpdf.kernel.font.PdfFontFactory;
import com.itextpdf.layout.Document;
import com.itextpdf.layout.element.Paragraph;
import com.itextpdf.layout.properties.TextAlignment;
import com.itextpdf.layout.properties.VerticalAlignment;

import java.io.File;
import java.io.IOException;
import java.util.List;

public class DgdPdfGenerator {

    public static void generarPdfDesdePlantilla(Dgd dgd, List<Bulto> bultos, String plantillaPath, String salidaPath) throws IOException {

        PdfReader reader = new PdfReader(plantillaPath);
        PdfWriter writer = new PdfWriter(salidaPath);
        PdfDocument pdfDoc = new PdfDocument(reader, writer);
        Document document = new Document(pdfDoc);

        PdfFont font = PdfFontFactory.createFont();

        // Página única por ahora
        int pageNum = 1;

        // === Coordenadas base (ajustar según tu plantilla real) ===
        document.showTextAligned(new Paragraph(dgd.getShipper().getNombre()).setFont(font).setFontSize(10),
                50, 795, pageNum, TextAlignment.LEFT, VerticalAlignment.TOP, 0);//bien
        
        document.showTextAligned(new Paragraph(dgd.getShipper().getDireccion()).setFont(font).setFontSize(10),
                50, 785, pageNum, TextAlignment.LEFT, VerticalAlignment.TOP, 0);//bien
        
        document.showTextAligned(new Paragraph(dgd.getShipper().getCiudad()).setFont(font).setFontSize(10),
                50, 775, pageNum, TextAlignment.LEFT, VerticalAlignment.TOP, 0);//bien
        
        document.showTextAligned(new Paragraph(dgd.getShipper().getPais()).setFont(font).setFontSize(10),
                50, 765, pageNum, TextAlignment.LEFT, VerticalAlignment.TOP, 0);//bien

        document.showTextAligned(new Paragraph(dgd.getConsignee().getNombre()).setFont(font).setFontSize(10),
                50, 715, pageNum, TextAlignment.LEFT, VerticalAlignment.TOP, 0);//bien
        
        document.showTextAligned(new Paragraph(dgd.getConsignee().getDireccion()).setFont(font).setFontSize(10),
                50, 705, pageNum, TextAlignment.LEFT, VerticalAlignment.TOP, 0);//bien

        document.showTextAligned(new Paragraph(dgd.getAeropuertoOrigen().getCodigoIata()).setFont(font).setFontSize(10),
                200, 560, pageNum, TextAlignment.LEFT, VerticalAlignment.TOP, 0);//bien

        document.showTextAligned(new Paragraph(dgd.getAeropuertoDestino().getCodigoIata()).setFont(font).setFontSize(10),
                140, 485, pageNum, TextAlignment.LEFT, VerticalAlignment.TOP, 0);//bien

        document.showTextAligned(new Paragraph(dgd.getTelefonoEmergencia()).setFont(font).setFontSize(10),
                50, 160, pageNum, TextAlignment.LEFT, VerticalAlignment.TOP, 0);//bien

        document.showTextAligned(new Paragraph(dgd.getFirmante()).setFont(font).setFontSize(10),
                400, 130, pageNum, TextAlignment.LEFT, VerticalAlignment.TOP, 0);//bien

        document.showTextAligned(new Paragraph(dgd.getLugarFirma()).setFont(font).setFontSize(10),
                400, 110, pageNum, TextAlignment.LEFT, VerticalAlignment.TOP, 0);//bien

        document.showTextAligned(new Paragraph(dgd.getFecha().toString()).setFont(font).setFontSize(10),
                400, 90, pageNum, TextAlignment.LEFT, VerticalAlignment.TOP, 0);//bien

        // === Tabla de Bultos (máx. 6 por página en esta versión simplificada) ===
        float startY = 560;
        float lineHeight = 20;
        int i = 0;

        for (Bulto b : bultos) {
            float y = startY - (i * lineHeight);
            if (y < 180) break; // evitar solapar parte inferior

            String linea = String.format("%s | %s | Clase 7 | %s | Actividad: %.2f MBq | TI: %.2f",
                    b.getUnId(),
                    b.getIsotope().getNombre(),
                    b.getPackingInstruction(),
                    b.getActividad(),
                    b.getTi()
            );
            document.showTextAligned(new Paragraph("RADIOACTIVE MATERIAL, Type A package ").setFont(font).setFontSize(10),
                55, y, pageNum, TextAlignment.LEFT, VerticalAlignment.TOP, 0);//cambiar a tipo A
            
            document.showTextAligned(new Paragraph(linea).setFont(font).setFontSize(9),
                    50, y, pageNum, TextAlignment.LEFT, VerticalAlignment.TOP, 0);

            i++;
        }

        document.close();
    }
}
