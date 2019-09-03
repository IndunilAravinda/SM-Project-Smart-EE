/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package servlets;

import java.io.File;
import java.io.IOException;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import moduls.Getting;
import moduls.Setting;

import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.FileItemFactory;
import org.apache.commons.fileupload.FileUploadException;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;
import pojo.Question;
import pojo.QuestionSet;

/**
 *
 * @author Deepamala
 */
@MultipartConfig
public class Addpaper_en extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse resp) throws ServletException, IOException {

        boolean isMultipart = ServletFileUpload.isMultipartContent(request);
        if (isMultipart) {
            // Create a factory for disk-based file items     	 
            FileItemFactory factory = new DiskFileItemFactory();
            // Create a new file upload handler
            ServletFileUpload upload = new ServletFileUpload(factory);
            String title = "";
            String sub = "";
            QuestionSet addPaperset = null;
            try {
                // Parse the request       	 
                List /* FileItem */ items = upload.parseRequest(request);
                Iterator iterator = items.iterator();

                String en_que = null;
                String en_options = null;
                String en_A = null;
                String en_B = null;
                String en_C = null;
                String en_D = null;
                String en_E = null;

                String paths = "";

                HashMap<String, Object> map = new HashMap<>();

                int questionmaxid = new Getting().getQuestionmaxid();
                while (iterator.hasNext()) {
                    FileItem item = (FileItem) iterator.next();
                    if (!item.isFormField()) {
//                        item.getFieldName().substring(0, 0)
                        String name = questionmaxid + "" + item.getFieldName() + ".jpg";
                        String root = getServletContext().getRealPath("/");
                        File path = new File(root + "/uploads");
                        if (!path.exists()) {
                            path.mkdirs();
                        }
                        paths = path + "/";
                        File uploadedFile = new File(path + "/" + name);
//                        System.out.println(uploadedFile.getAbsolutePath());
                        item.write(uploadedFile);
                    } else {

                        map.put(item.getFieldName(), item.getString());
                        System.out.println(item.getFieldName() + "   " + item.getString());
                    }
                }

                if (addPaperset == null) {

                    title = map.get("titele-en").toString();
                    sub = map.get("subject-en").toString();

                    if (title != "" && sub != "") {
                        Cookie[] cookies = request.getCookies();
                        String id = "";
                        for (Cookie cooky : cookies) {
                            if (cooky.getName().equals("id")) {
                                id = cooky.getValue();
                            }
                        }
                        addPaperset = new Setting().addPaperset(questionmaxid, title+"_en", sub, id);

                    }
                }
                for (int i = 1; i <= 50; i++) {
                    en_que = map.get("en_que_" + i).toString();
                    en_options = map.get("en_" + i + "options").toString();
                    en_A = map.get("en_" + i + "_A").toString();
                    en_B = map.get("en_" + i + "_B").toString();
                    en_C = map.get("en_" + i + "_C").toString();
                    en_D = map.get("en_" + i + "_D").toString();
                    en_E = map.get("en_" + i + "_E").toString();

                    if (en_que != null && en_options != null && en_A != null && en_B != null && en_C != null && en_D != null && en_E != null) {
                        Question AddQueaction = new Setting().AddQueaction(en_que, addPaperset, paths + "/" + questionmaxid + "en_file_" + i);


                        new Setting().AddAnswers(AddQueaction, en_A + "_" + en_B + "_" + en_C + "_" + en_D + "_" + en_E, en_options);
                        en_que = null;
                        en_options = null;
                        en_A = null;
                        en_B = null;
                        en_C = null;
                        en_D = null;
                        en_E = null;

                    }
                }

            } catch (FileUploadException e) {
                e.printStackTrace();
            } catch (Exception e) {
                e.printStackTrace();
            }
        }

//        req.getRequestDispatcher("/AddPaper.jsp").forward(req, resp);
//        try {
//
//            if (new File(path).exists()) {
//
//                for (int i = 1; i <= 1; i++) {
//                    Part part = req.getPart("file_" + i);
//                    InputStream is = part.getInputStream();
//
//                    FileOutputStream os = new FileOutputStream(path);
//
//                    int read = is.read();
//                    while (read != -1) {
//                        os.write(read);
//                        read = is.read();
//                    }
//                    os.close();
//
//                }
//            } else {
//                System.out.println("gsdhasgdhghgd file eka na ");
//            }
//        } catch (Exception e) {
//            e.printStackTrace();
//        }
    }

}
