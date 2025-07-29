package com.eduflex.common.converter;

import com.aspose.cells.PdfSaveOptions;
import com.aspose.cells.Workbook;
import com.aspose.slides.Presentation;
import com.aspose.slides.SaveFormat;
import com.aspose.words.Document;
import com.itextpdf.text.Paragraph;
import com.itextpdf.text.pdf.PdfWriter;
import org.apache.pdfbox.Loader;
import org.apache.pdfbox.pdmodel.PDDocument;
import org.apache.pdfbox.rendering.PDFRenderer;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Component;

import javax.imageio.ImageIO;
import java.awt.image.BufferedImage;
import java.io.*;
import java.util.ArrayList;
import java.util.List;

@Component
public class PDFConverter {

    private static final Logger log = LoggerFactory.getLogger(PDFConverter.class);

    public static ByteArrayOutputStream convertTxtToPDF(String filePath) {
        com.itextpdf.text.Document document = new com.itextpdf.text.Document();
        ByteArrayOutputStream baos = new ByteArrayOutputStream();
        try {
            PdfWriter.getInstance(document, baos);

            document.open();

            BufferedReader reader = new BufferedReader(new FileReader(filePath));

            String line;
            while ((line = reader.readLine()) != null) {
                document.add(new Paragraph(line));
            }

            reader.close();
            document.close();
        } catch (Exception e) {
            log.error("转换失败", e);
        }
        return baos;
    }

    /**
     * Word转换为PDF
     *
     * @param filePath 文件路径
     * @return
     */
    public static ByteArrayOutputStream convertWordToPDF(String filePath) {
        ByteArrayOutputStream baos = new ByteArrayOutputStream();
        try {
            Document document = new Document(new FileInputStream(filePath));

            document.getPageCount();
            Document page = document.extractPages(0, document.getPageCount());
            page.save(baos, com.aspose.words.SaveFormat.PDF);

        } catch (Exception e) {
            log.error("转换失败", e);
        }
        return baos;
    }

    /**
     * Excel转换为PDF
     *
     * @param filePath 文件路径
     * @return
     */
    public static ByteArrayOutputStream convertExcelToPDF(String filePath) {
        ByteArrayOutputStream baos = new ByteArrayOutputStream();
        try {
            Workbook workbook = new Workbook(new FileInputStream(filePath));
            PdfSaveOptions pdfSaveOptions = new PdfSaveOptions();
            pdfSaveOptions.setOnePagePerSheet(false);
            workbook.save(baos, pdfSaveOptions);
        } catch (Exception e) {
            log.error("转换失败", e);
        }
        return baos;
    }

    /**
     * PPT转换为PDF
     *
     * @param filePath 文件路径
     * @return
     */
    public static ByteArrayOutputStream convertPPTToPDF(String filePath) {
        ByteArrayOutputStream baos = new ByteArrayOutputStream();
        try {
            Presentation presentation = new Presentation(new FileInputStream(filePath));
            presentation.save(baos, SaveFormat.Pdf);
        } catch (Exception e) {
            log.error("转换失败", e);
        }
        return baos;
    }

    public static List<byte[]> convertPDFToImages(ByteArrayOutputStream baos) {
        List<byte[]> imageList = new ArrayList<>();
        byte[] byteArray = baos.toByteArray();
        try (PDDocument document = Loader.loadPDF(byteArray)) {
            int dpi = 300;
            PDFRenderer pdfRenderer = new PDFRenderer(document);
            for (int page = 0; page < document.getNumberOfPages(); page++) {
                float scale = dpi / 72f;
                BufferedImage bufferedImage = pdfRenderer.renderImage(page, scale);
                ByteArrayOutputStream imageBaos = new ByteArrayOutputStream();

                ImageIO.write(bufferedImage, "PNG", imageBaos);
                imageList.add(imageBaos.toByteArray());
            }
        } catch (Exception e) {
            log.error("转换失败", e);
        }
        return imageList;
    }

    public static List<byte[]> convertPDFToImages(String filePath) {
        List<byte[]> imageList = new ArrayList<>();
        try (PDDocument document = Loader.loadPDF(new File(filePath))) {
            int dpi = 300;
            PDFRenderer pdfRenderer = new PDFRenderer(document);
            for (int page = 0; page < document.getNumberOfPages(); page++) {
                float scale = dpi / 72f;
                BufferedImage bufferedImage = pdfRenderer.renderImage(page, scale);
                ByteArrayOutputStream imageBaos = new ByteArrayOutputStream();
                ImageIO.write(bufferedImage, "PNG", imageBaos);
                imageList.add(imageBaos.toByteArray());
            }
        } catch (Exception e) {
            log.error("转换失败", e);
        }
        return imageList;
    }
}
