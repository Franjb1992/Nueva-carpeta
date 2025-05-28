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
import com.itextpdf.kernel.pdf.canvas.PdfCanvas;
import com.itextpdf.kernel.pdf.xobject.PdfFormXObject;
import com.itextpdf.layout.Document;
import com.itextpdf.layout.element.Paragraph;
import com.itextpdf.layout.properties.TextAlignment;
import com.itextpdf.layout.properties.VerticalAlignment;
import java.io.ByteArrayOutputStream;

import java.io.File;
import java.io.IOException;
import java.util.List;

public class DgdPdfGenerator {
    
    private static void insertarDatosComunes(Document document, PdfFont font, Dgd dgd, int pageNum) {
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

    }

    public static void generarPdfDesdePlantilla(Dgd dgd, List<Bulto> bultos, String plantillaPath, String salidaPath) throws IOException {

        
      // Paso 2: Crear el nuevo documento
        PdfWriter writer = new PdfWriter(salidaPath);
        PdfDocument pdfDoc = new PdfDocument(writer);
        Document document = new Document(pdfDoc, PageSize.A4);
        PdfFont font = PdfFontFactory.createFont();

       PdfDocument plantillaDocTemp = new PdfDocument(new PdfReader(plantillaPath));
        PdfFormXObject plantillaXObject = plantillaDocTemp.getPage(1).copyAsFormXObject(pdfDoc);
         plantillaDocTemp.close();
         
         
         
        int totalPages = (int) Math.ceil((double) bultos.size() /3);
        int currentPage = 1;
        
             
        
     for (int i = 0; i<bultos.size(); i+=3){
            
         PdfPage newPage = pdfDoc.addNewPage();
             PdfCanvas canvas = new PdfCanvas(newPage);
             canvas.addXObjectAt(plantillaXObject,0,0);
     
         
         insertarDatosComunes(document, font, dgd, currentPage);
         
         for(int j=0; j<3 && (i+j) < bultos.size(); j++){
             Bulto bulto = bultos.get(i+j);
             int y =360 - j *60;
             
             String linea = String.format(" %s \n %s \n %.0f %s \n %d x Type A package",
                    bulto.getIsotope().getNombre(),
                    bulto.getIsotope().getEstadoFisico(),
                    bulto.getActividad(),
                    bulto.getunidadActividad(),
                    bulto.getCantidadBultos()
            );
            
            String infoDerecha = String.format("%s \n TI: %.1f\n%s\nCM", bulto.getCategoria(),bulto.getTi(), bulto.getDimensiones());

            
            document.showTextAligned(new Paragraph(bulto.getUnId()).setFont(font).setFontSize(10),
                39, y, currentPage, TextAlignment.LEFT, VerticalAlignment.TOP, 0);
            
            document.showTextAligned(new Paragraph("RADIOACTIVE MATERIAL,").setFont(font).setFontSize(10),
                85, y, currentPage, TextAlignment.LEFT, VerticalAlignment.TOP, 0);
            
            document.showTextAligned(new Paragraph("Type A package ").setFont(font).setFontSize(10),
                85, y-12, currentPage, TextAlignment.LEFT, VerticalAlignment.TOP, 0);
            
            document.showTextAligned(new Paragraph(" 7 ").setFont(font).setFontSize(10),
                275, y, currentPage, TextAlignment.LEFT, VerticalAlignment.TOP, 0);
            
            document.showTextAligned(new Paragraph(linea).setFont(font).setFontSize(10),
               350, y, currentPage, TextAlignment.LEFT, VerticalAlignment.TOP, 0);
            
            //bultos
            
            document.showTextAligned(new Paragraph(linea).setFont(font).setFontSize(10),
               350, y, currentPage, TextAlignment.LEFT, VerticalAlignment.TOP, 0);
            
            document.showTextAligned(new Paragraph(infoDerecha).setFont(font).setFontSize(8),
               465, y, currentPage, TextAlignment.LEFT, VerticalAlignment.TOP, 0);
         //pag
         
         
         }
         document.showTextAligned(new Paragraph(" " +currentPage).setFont(font).setFontSize(10),
               350, 785, currentPage, TextAlignment.LEFT, VerticalAlignment.TOP, 0);
         
         document.showTextAligned(new Paragraph(" "+ totalPages).setFont(font).setFontSize(10),
               388, 785, currentPage, TextAlignment.LEFT, VerticalAlignment.TOP, 0);
         
         currentPage++;
        
        }
      document.close();

    }
   
}
