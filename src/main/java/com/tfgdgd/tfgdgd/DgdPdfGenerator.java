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
import com.itextpdf.kernel.pdf.canvas.PdfCanvas;
import com.itextpdf.kernel.geom.PageSize;
import com.itextpdf.layout.Document;
import com.itextpdf.layout.element.Paragraph;
import com.itextpdf.layout.properties.TextAlignment;
import com.itextpdf.kernel.font.PdfFontFactory;


import java.io.File;
import java.io.IOException;
import java.util.List;

public class DgdPdfGenerator {

    public static void generarPdfDesdePlantilla(Dgd dgd, List<Bulto> bultos, String plantillaPath, String salidaPath) throws IOException {

        PdfReader reader = new PdfReader(plantillaPath);
        PdfWriter writer = new PdfWriter(salidaPath);
        PdfDocument pdfDoc = new PdfDocument(reader, writer);
        Document document = new Document(pdfDoc);

        PdfCanvas canvas = new PdfCanvas(pdfDoc.getFirstPage());

        // 🧾 Insertar campos básicos (ajustar coordenadas según plantilla)
        canvas.beginText()
            .setFontAndSize(PdfFontFactory.createRegisteredFont("Helvetica"), 10)


            .moveText(50, 750).showText(dgd.getShipper().getNombre()) // Shipper
            .moveText(0, -40).showText(dgd.getConsignee().getNombre()) // Consignee
            .moveText(0, -60).showText(dgd.getAeropuertoOrigen().getNombre()) // Airport Departure
            .moveText(0, -20).showText(dgd.getAeropuertoDestino().getNombre()) // Airport Destination
            .moveText(0, -20).showText("RADIOACTIVE") // Shipment Type
            .moveText(0, -20).showText("PASSENGER AND CARGO AIRCRAFT") // Transport Type
            .moveText(0, -20).showText("Tel. emergencia: " + dgd.getTelefonoEmergencia()) // Emergency
            .moveText(0, -40).showText("Firmado por: " + dgd.getFirmante() + " - " + dgd.getLugarFirma()) // Firma
            .moveText(0, -20).showText("Fecha: " + dgd.getFecha().toString())
            .endText();

        // 🧾 Insertar tabla de bultos
        float startX = 50;
        float startY = 500;
        float lineHeight = 20;
        int bultosPorPagina = 10;
        int totalPaginas = (int) Math.ceil(bultos.size() / (float) bultosPorPagina);

        int index = 0;
        for (int pagina = 1; pagina <= totalPaginas; pagina++) {
            if (pagina > 1) {
                pdfDoc.addNewPage(PageSize.A4);
                document.showTextAligned(new Paragraph("Page " + pagina + " of " + totalPaginas),
                        pdfDoc.getLastPage().getPageSize().getWidth() - 100, 20,
                        pagina, TextAlignment.RIGHT, com.itextpdf.layout.properties.VerticalAlignment.BOTTOM, 0);
            }

            PdfCanvas bultoCanvas = new PdfCanvas(pdfDoc.getPage(pagina));
            bultoCanvas.beginText()
                .setFontAndSize(PdfFontFactory.createFont(), 9);

            float y = startY;

            for (int i = 0; i < bultosPorPagina && index < bultos.size(); i++, index++) {
                Bulto b = bultos.get(index);
                String linea = b.getUnId() + " - " + b.getIsotope().getNombre() +
                        " - Actividad: " + b.getActividad() + " MBq - TI: " + b.getTi() +
                        " - Cantidad: " + b.getCantidadBultos() + " - " + b.getCategoria();
                bultoCanvas.moveText(startX, y).showText(linea);
                y -= lineHeight;
            }

            bultoCanvas.endText();
        }

        // Pie de página
        for (int i = 1; i <= pdfDoc.getNumberOfPages(); i++) {
            document.showTextAligned(
                    new Paragraph("Page " + i + " of " + pdfDoc.getNumberOfPages()),
                    pdfDoc.getPage(i).getPageSize().getWidth() - 50, 20,
                    i, TextAlignment.RIGHT, com.itextpdf.layout.properties.VerticalAlignment.BOTTOM, 0);
        }

        document.close();
    }
}

