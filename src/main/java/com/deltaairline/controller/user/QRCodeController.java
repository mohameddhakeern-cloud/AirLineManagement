package com.deltaairline.controller.user;

import java.awt.image.BufferedImage;
import java.io.IOException;

import javax.imageio.ImageIO;

import org.springframework.web.bind.annotation.*;

import com.google.zxing.BarcodeFormat;
import com.google.zxing.MultiFormatWriter;
import com.google.zxing.common.BitMatrix;

import jakarta.servlet.http.HttpServletResponse;

@RestController
@RequestMapping("/user")
public class QRCodeController {

    @GetMapping("/qr")
    public void qr(@RequestParam String text,
                   HttpServletResponse response) throws Exception {

        BitMatrix matrix =
                new MultiFormatWriter().encode(
                        text,
                        BarcodeFormat.QR_CODE,
                        250,
                        250);

        BufferedImage image =
                new BufferedImage(
                        250,
                        250,
                        BufferedImage.TYPE_INT_RGB);

        for (int x = 0; x < 250; x++) {

            for (int y = 0; y < 250; y++) {

                image.setRGB(
                        x,
                        y,
                        matrix.get(x, y)
                                ? 0xFF000000
                                : 0xFFFFFFFF);
            }
        }

        response.setContentType("image/png");

        ImageIO.write(image, "PNG", response.getOutputStream());
    }
}