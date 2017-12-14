/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.hinet.storage.utility;

import java.io.File;
import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.multipart.MultipartFile;
import org.apache.commons.io.FilenameUtils;

/**
 *
 * @author duynn
 * @create_date 12/12/2017
 */
public class Utilities {

    public boolean uploadFiles(HttpServletRequest request, List<MultipartFile> files,
            int attachmentTypeIdentity, String attachtmentTypeName, long entityId) {
        boolean result = false;
        if (files != null && files.size() > 0) {
            for (MultipartFile file : files) {
                if (file.isEmpty() == false) {
                    try {
                        String directoryPath = request.getSession().getServletContext().getRealPath("/WEB-INF")
                                + "/resources/attachments/" + attachtmentTypeName + "/" + entityId;

                        File directory = new File(directoryPath);
                        if (directory.exists() == false) {
                            directory.mkdirs();
                        }
                        String filePath = directoryPath + "/" + file.getOriginalFilename();

                        File item = new File(filePath);
                        if (item.exists()) {
                            String extension = FilenameUtils.getExtension(file.getOriginalFilename());
                            SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd HH-mm-ss");
                            String customFileName = file.getName() + dateFormat.format(new Date()) + "." + extension;
                            filePath = filePath.replace(file.getOriginalFilename(), customFileName);
                        }

                        Path path = Paths.get(filePath, new String[]{});
                        byte[] bytes = file.getBytes();
                        Files.write(path, bytes);
                    } catch (IOException ex) {
                        Logger.getLogger(Utilities.class.getName()).log(Level.SEVERE, null, ex);
                        result = false;
                    }
                }
            }
        }
        return result;
    }
}
