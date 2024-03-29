<%@page import="javafx.scene.layout.Background"%>
<%@page import="pojo.Question"%>
<%@page import="java.util.List"%>
<%@page import="moduls.Getting"%>
<%@page import="moduls.NewClass"%>
<%@page import="pojo.NewHibernateUtil"%>
<!DOCTYPE HTML>
<html lang="en">
    <head>
        <title>Smart EE</title>
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <meta charset="UTF-8">

        <!-- Font -->
        <!-- Stylesheets -->      
        <link href="assets/fonts/ionicons.css" rel="stylesheet">

        <!-- Stylesheets -->
        <link href="assets/plugin-frameworks/bootstrap.min.css" rel="stylesheet">
        <link href="assets/common/styles.css" rel="stylesheet">      
        <link href="assets/fontawesome/css/all.min.css" rel="stylesheet">
        <link href="assets/common/sb-admin-2.css" rel="stylesheet">
        <link rel="stylesheet" type="text/css" href="https://cdn.datatables.net/1.10.19/css/jquery.dataTables.css">


    </head>

    <body id="page-top" onload="javascript:ScaleSize();" onresize="history.go(0)">
        <%@include file="headerdash.jsp" %>



        <!-- Begin Page Content -->


        <div class="container-fluid">
            <h2>Manege Questions</h2>
            <div class="row">
                <div class="col-12">
                    <table class="table table-hover" id="Question">
                        <thead class="thead-dark">
                            <tr>
                                <th scope="col">#</th>
                                <th scope="col">Image</th>
                                <th scope="col">Question</th>
                                <th scope="col">Paper Title</th>
                                <th scope="col">Author</th>
                                <th scope="col">Status</th>
                                <th scope="col">Change Status</th>
                            </tr>
                        </thead>
                        <tbody>
                            <%                                int i = 1;
                                List<Question> qs = new Getting().getAllQuestions("Active",false);
                                for (Question q : qs) {
                                    String[] s = q.getImgpath().split("uploads");

                            %>

                            <tr class="center-text">
                                <th scope="row" class="center-text"><% out.write("" + i); %></th>
                                <td><img id="imgTag"  height="50px" style="width:50px;  background-image: url(<%  out.write("uploads" + s[1] + ".jpg");%>);
                                         background-repeat: no-repeat;
                                         background-size: 100% 100%;"  /></td>
                                <td class="center-text"><% out.write("" + q.getQuestiontext());%></td>
                                <td class="center-text"><% out.write("" + q.getQuestionSet().getName()); %></td>
                                <td class="center-text"><% out.write("" + q.getQuestionSet().getUser().getUsername()); %></td>
                                <td class="center-text"><% out.write("" + q.getEnumQuestionStatus().getStatus()); %></td>
                                <td class="center-text"><form action="deactive" method="Post">
                                        <input type="text" class="d-none" name="qsid" value="<% out.write(q.getQuestionSet().getIdquestionset()+""); %>">
                                        <input type="text" class="d-none" name="qid" value="<% out.write(q.getIdquestion()+""); %>">
                                        <%
                                            String sa = "Active";
                                            if (q.getEnumQuestionStatus().getStatus().equals("Deactive")) {
                                                sa = "Active";
                                            } else {
                                                sa = "Deactive";
                                            }
                                        %>

                                        <input type="submit" name="sta" class="btn btn-danger btn-primary" value="<% out.write(sa); %>">

                                    </form></td>

                            </tr>
                            <%      i++;
                                }

                            %>
                        </tbody>
                    </table>
                </div>



                <!-- /.container-fluid -->

            </div>
            <!-- End of Main Content -->

            <!-- staff footer -->
            <!-- Footer -->
            <footer class="sticky-footer bg-white">
                <div class="container my-auto">
                    <div class="copyright text-center my-auto">
                        <span>Copyright &copy; Smart EE</span>
                    </div>
                </div>
            </footer>
            <!-- End of Footer -->

        </div>
        <!-- End of Content Wrapper -->

    </div>
    <!-- End of Page Wrapper -->



    <!-- staff script -->


    <!-- Logout Modal-->
    <div class="modal fade" id="logoutModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
        <div class="modal-dialog" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="exampleModalLabel">Ready to Leave?</h5>
                    <button class="close" type="button" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">×</span>
                    </button>
                </div>
                <div class="modal-body">Select "Logout" below if you are ready to end your current session.</div>
                <div class="modal-footer">
                    <button class="btn btn-secondary" type="button" data-dismiss="modal">Cancel</button>
                    <a class="btn btn-primary" href="login.html">Logout</a>
                </div>
            </div>
        </div>
    </div>

    <!-- SCRIPTS -->



    <script src="assets/plugin-frameworks/popper.js"></script>
    <script src="assets/plugin-frameworks/jquery-3.2.1.min.js"></script>

    <script src="assets/plugin-frameworks/bootstrap.min.js"></script>

    <script type="text/javascript" charset="utf8" src="https://cdn.datatables.net/1.10.19/js/jquery.dataTables.js"></script>
    <script>
        $(document).ready(function () {
            $('#Question').DataTable();
        });
    </script>
    <script>
        function ScaleSize() {
            document.getElementById("imgTag").style.width = document.body.clientWidth;
            document.getElementById("imgTag").style.height = document.body.clientHeight;
        }
    </script>
</body>
</html>