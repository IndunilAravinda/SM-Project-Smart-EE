
<%@page import="pojo.User"%>
<%@page import="java.util.Random"%>
<%@page import="pojo.Answers"%>
<%@page import="java.util.List"%>
<%@page import="pojo.Question"%>
<%@page import="pojo.QuestionSet"%>
<%@page import="moduls.Getting"%>
<%
    String type = request.getParameter("type");
    if (type != null) {

        if (type.equals("time")) {
            String subject = request.getParameter("sub");
            String la = request.getParameter("lan");
            String name1 = request.getParameter("id");
            String nu = request.getParameter("no");

            System.out.println(subject + " " + la + " " + name1 + " " + nu);
            if (subject != null && la != null) {

                Getting getting = new Getting();
                Random r = new Random();
                User u = getting.getUserById(name1);
                List<Question> l = getting.getQuestionByQuestionsetlan(la, subject, "time", u);

                System.out.println(l.size());
                Question q1 = l.get(r.nextInt(l.size()));
//            response.sendRedirect("Exam.jsp?lan=" + la + "&subject=" + request.getParameter("Subject"));

//            QuestionSet qs = new Getting().getAQuestionSetById(idqeset);
//            List<Question> q = new Getting().getQuestionByQuestionset(qs);
//            Question q1 = q.get(id);
                String[] s = q1.getImgpath().split("uploads");

                Answers a = new Getting().getAnswersesByQuetionId(q1);
                String[] que = a.getText().split("_");

%>
<div class="col-12">
    <div class="card mb-3" >
        <div class="row no-gutters">
            <!-- remove this div if there are no image to show -->
            <div class="col-md-4">
                <img src="<%  out.write("uploads" + s[1] + ".jpg");  %>" class="card-img"  height="300"alt="...">
            </div>
            <div class="col-md-8">
                <div class="card-body">
                    <h5 class="card-title"> Question No <% out.write(nu + ""); %> </h5>
                    <p class="card-text" id="qu"><% out.write(q1.getQuestiontext()); %>.</p>
                    <p>Select Your Answer:</p>
                    <div class="btn-group btn-group-toggle" data-toggle="buttons">
                        <input type="button" class="btn btn-warning col-3" value="Answer A"  style="margin-right: 5px" onclick="selectanswer(1,<% out.write(q1.getIdquestion() + ""); %>)"  name="options" id="option1" autocomplete="off">   
                        <input type="button"  class="btn btn-warning col-3" value="Answer B"  style="margin-right: 5px" onclick="selectanswer(2,<% out.write(q1.getIdquestion() + ""); %>)" name="options" id="option2" autocomplete="off">   
                        <input type="button"  class="btn btn-warning col-3" value="Answer C" style="margin-right: 5px"  onclick="selectanswer(3,<% out.write(q1.getIdquestion() + ""); %>)"  name="options" id="option3" autocomplete="off">  
                        <input type="button"  class="btn btn-warning col-3" value="Answer D" style="margin-right: 5px"  onclick="selectanswer(4,<% out.write(q1.getIdquestion() + ""); %>)"  name="options" id="option4" autocomplete="off">  
                        <input type="button" class="btn btn-warning col-3" value="Answer E" style="margin-right: 5px"  onclick="selectanswer(5,<% out.write(q1.getIdquestion() + ""); %>)"  name="options" id="option5" autocomplete="off">  

                    </div>
                    <div class="btn-group float-right" role="group" aria-label="Third group">
                        <!--<button type="button" class="btn btn-success" onclick="back(<% out.write(nu + ""); %>)">Back</button>-->
                        <button type="button" id="next" class="btn btn-danger" onclick="next(<% out.write(nu + ""); %>)">Next </button>

                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
<div class="col-6">
    <div class="card border-dark mb-3" >
        <div class="card-header">Answer A</div>
        <div class="card-body text-dark">

            <p class="card-text" id="answer1"><% out.write(que[0]);  %>.</p>
        </div>
    </div>
</div>
<div class="col-6">
    <div class="card border-dark mb-3" >
        <div class="card-header">Answer B</div>
        <div class="card-body text-dark">

            <p class="card-text"id="answer2"><% out.write(que[1]);  %>.</p>
        </div>
    </div>
</div>
<div class="col-6">
    <div class="card border-dark mb-3" >
        <div class="card-header">Answer C</div>
        <div class="card-body text-dark">

            <p class="card-text"id="answer3"><% out.write(que[2]);  %>.</p>
        </div>
    </div>
</div>
<div class="col-6">
    <div class="card border-dark mb-3" >
        <div class="card-header">Answer D</div>
        <div class="card-body text-dark">

            <p class="card-text"id="answer4"><% out.write(que[3]);  %>.</p>
        </div>
    </div>
</div>
<div class="col-6">
    <div class="card border-dark mb-3" >
        <div class="card-header">Answer E</div>
        <div class="card-body text-dark">

            <p class="card-text"id="answer5"><% out.write(que[4]);  %>.</p>
        </div>
    </div>
</div>
<%
        }
    }
} else {
    System.out.println("asdasd");

    String idqeset = request.getParameter("QeSet");
    int id = Integer.parseInt(request.getParameter("Qe"));

    if (idqeset.equals("")) {
//        response.sendRedirect("EXam.jsp");
    } else {
        QuestionSet qs = new Getting().getAQuestionSetById(idqeset);
        List<Question> q = new Getting().getQuestionByQuestionset(qs);

        Question q1 = q.get(id);
        String[] s = q1.getImgpath().split("uploads");

        Answers a = new Getting().getAnswersesByQuetionId(q1);
        String[] que = a.getText().split("_");


%>
<div class="col-12">
    <div class="card mb-3" >
        <div class="row no-gutters">
            <!-- remove this div if there are no image to show -->
            <div class="col-md-4">
                <img src="<%  out.write("uploads" + s[1] + ".jpg");  %>" class="card-img"  height="300"alt="...">
            </div>
            <div class="col-md-8">
                <div class="card-body">
                    <h5 class="card-title">Question No <% out.write((id + 1) + ""); %> </h5>
                    <p class="card-text" id="qu"><% out.write(q1.getQuestiontext()); %>.</p>
                    <p>Select Your Answer:</p>
                    <div class="btn-group btn-group-toggle" data-toggle="buttons">
                        <input type="button" class="btn btn-warning col-3" value="Answer A"  style="margin-right: 5px" onclick="selectanswer(1,<% out.write(q1.getIdquestion() + ""); %>)"  name="options" id="option1" autocomplete="off">   
                        <input type="button"  class="btn btn-warning col-3" value="Answer B"  style="margin-right: 5px" onclick="selectanswer(2,<% out.write(q1.getIdquestion() + ""); %>)" name="options" id="option2" autocomplete="off">   
                        <input type="button"  class="btn btn-warning col-3" value="Answer C" style="margin-right: 5px"  onclick="selectanswer(3,<% out.write(q1.getIdquestion() + ""); %>)"  name="options" id="option3" autocomplete="off">  
                        <input type="button"  class="btn btn-warning col-3" value="Answer D" style="margin-right: 5px"  onclick="selectanswer(4,<% out.write(q1.getIdquestion() + ""); %>)"  name="options" id="option4" autocomplete="off">  
                        <input type="button" class="btn btn-warning col-3" value="Answer E" style="margin-right: 5px"  onclick="selectanswer(5,<% out.write(q1.getIdquestion() + ""); %>)"  name="options" id="option5" autocomplete="off">  

                    </div>
                    <div class="btn-group float-right" role="group" aria-label="Third group">
                        <button type="button" class="btn btn-success" onclick="back(<% out.write(id + ""); %>)">Back</button>
                        <button type="button" class="btn btn-danger" onclick="next(<% out.write(id + ""); %>)">Next </button>

                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
<div class="col-6">
    <div class="card border-dark mb-3" >
        <div class="card-header">Answer A</div>
        <div class="card-body text-dark">

            <p class="card-text" id="answer1"><% out.write(que[0]);  %>.</p>
        </div>
    </div>
</div>
<div class="col-6">
    <div class="card border-dark mb-3" >
        <div class="card-header">Answer B</div>
        <div class="card-body text-dark">

            <p class="card-text"id="answer2"><% out.write(que[1]);  %>.</p>
        </div>
    </div>
</div>
<div class="col-6">
    <div class="card border-dark mb-3" >
        <div class="card-header">Answer C</div>
        <div class="card-body text-dark">

            <p class="card-text"id="answer3"><% out.write(que[2]);  %>.</p>
        </div>
    </div>
</div>
<div class="col-6">
    <div class="card border-dark mb-3" >
        <div class="card-header">Answer D</div>
        <div class="card-body text-dark">

            <p class="card-text"id="answer4"><% out.write(que[3]);  %>.</p>
        </div>
    </div>
</div>
<div class="col-6">
    <div class="card border-dark mb-3" >
        <div class="card-header">Answer E</div>
        <div class="card-body text-dark">

            <p class="card-text"id="answer5"><% out.write(que[4]);  %>.</p>
        </div>
    </div>
</div>
<% }
    }
%>