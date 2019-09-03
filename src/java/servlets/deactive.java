/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package servlets;

import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import moduls.Getting;
import moduls.Setting;
import org.hibernate.Criteria;
import org.hibernate.Session;
import org.hibernate.Transaction;
import org.hibernate.criterion.Restrictions;
import pojo.EnumQuestionSetStatus;
import pojo.EnumQuestionStatus;
import pojo.NewHibernateUtil;
import pojo.Question;
import pojo.QuestionSet;

/**
 *
 * @author Deepamala
 */
public class deactive extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String qsid = req.getParameter("qsid");
        String qid = req.getParameter("qid");
        String sta = req.getParameter("sta");

        Session s = NewHibernateUtil.getSessionFactory().openSession();

        QuestionSet questionSet = (QuestionSet) s.load(QuestionSet.class, Integer.parseInt(qsid));
        Question question = (Question) s.load(Question.class, Integer.parseInt(qid));

        Criteria cc = s.createCriteria(EnumQuestionSetStatus.class);
        EnumQuestionSetStatus eqss = (EnumQuestionSetStatus) cc.add(Restrictions.eq("status", sta)).uniqueResult();

        Criteria cc1 = s.createCriteria(EnumQuestionStatus.class);
        EnumQuestionStatus eqs = (EnumQuestionStatus) cc1.add(Restrictions.eq("status", sta)).uniqueResult();

        Transaction tr = s.beginTransaction();
        questionSet.setEnumQuestionSetStatus(eqss);
        question.setEnumQuestionStatus(eqs);
        s.update(questionSet);
        s.update(question);
        tr.commit();
        s.close();

        resp.sendRedirect("manegePapers.jsp");
    }

}
