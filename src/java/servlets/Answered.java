/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package servlets;

import java.io.IOException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import moduls.Getting;
import moduls.Setting;
import pojo.Answers;
import pojo.PracticeQuestionSet;
import pojo.Question;
import pojo.User;

/**
 *
 * @author Deepamala
 */
public class Answered extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

        String qe = req.getParameter("Qe");
        int select = Integer.parseInt(req.getParameter("sele"));
        String seleq = req.getParameter("seleq");
        String type = req.getParameter("type");
        System.out.println(seleq);
        String userid = "";
        Cookie[] cookies = req.getCookies();
        for (Cookie cooky : cookies) {
            if (cooky.getName().equals("id")) {
                userid = cooky.getValue();
            }
        }
        try {
            Getting getting = new Getting();
            User userById = getting.getUserById(userid);
            Question q = getting.getQuestionByQuestionId(qe);
            Answers an = getting.getAnswersesByQuetionId(q);
            int scor = 0;
            if (an.getIscorrect() == select) {
                scor = 10;
            }
            String format = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").format(new Date());
            Date parse = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").parse(format);
            PracticeQuestionSet pq = new Setting().setPracticeQuestionSet(q, scor, userById, parse);
            new Setting().setAnswersHistory(pq, userById, type, an, seleq, q.getQuestionSet());

        } catch (Exception ex) {
            ex.printStackTrace();
        }
    }

}
