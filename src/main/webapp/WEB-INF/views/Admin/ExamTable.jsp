<!DOCTYPE html>
<html lang="en">
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<head>

    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="">
    <meta name="author" content="">

    <title>EduTech Admin Section</title>

    <!-- Bootstrap Core CSS -->
    <link href="<%=request.getContextPath()%>/resources/Admin/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">

    <!-- MetisMenu CSS -->
    <link href="<%=request.getContextPath()%>/resources/Admin/vendor/metisMenu/metisMenu.min.css" rel="stylesheet">

    <!-- DataTables CSS -->
    <link href="<%=request.getContextPath()%>/resources/Admin/vendor/datatables-plugins/dataTables.bootstrap.css" rel="stylesheet">

    <!-- DataTables Responsive CSS -->
    <link href="<%=request.getContextPath()%>/resources/Admin/vendor/datatables-responsive/dataTables.responsive.css" rel="stylesheet">

    <!-- Custom CSS -->
    <link href="<%=request.getContextPath()%>/resources/Admin/dist/css/sb-admin-2.css" rel="stylesheet">

    <!-- Custom Fonts -->
    <link href="<%=request.getContextPath()%>/resources/Admin/vendor/font-awesome/css/font-awesome.min.css" rel="stylesheet" type="text/css">

    <!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
    <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
    <!--[if lt IE 9]>
        <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
        <script src="https://oss.maxcdn.com/libs/respond.js/1.4.2/respond.min.js"></script>
    <![endif]-->

</head>

<body>

    <div id="wrapper">

        <!-- Navigation -->
        <jsp:include page="navbar.jsp"></jsp:include>

        <div id="page-wrapper">
            <div class="row">
                <div class="col-lg-12">
                    <h1 class="page-header">Tables</h1>
                </div>
                <!-- /.col-lg-12 -->
            </div>
            <!-- /.row -->
            <div class="row">
                <div class="col-lg-12">
                    <div class="panel panel-default">
                        <div class="panel-heading">
                            Exam Tables
                        </div>
                        
                        <!-- /.panel-heading -->
                        <div class="panel-body">
                        <div class="form-group">
                                            <label>${message }</label>
                                        </div>
                            <table width="100%" class="table table-striped table-bordered table-hover" id="dataTables-example">
                                <thead>
                                    <tr>
                                        <th>Course Name</th>
                                        <th>Test Name</th>
                                        <th>	</th>
                                        <th>    </th>
                                        <th>    </th>
                                    </tr>
                                </thead>
                                
                                <tbody>
                                   <c:forEach var="data" items="${testtable }" varStatus="status">
                                      <tr class="odd gradeX">
                                        <td>${data.getDescription() }</td>
                                        <td>${data.getTestid() }</td>
                                        <td class="center">
                                        <form action="${pageContext.request.contextPath}/Admin/examtabledata/${data.getTestid() }" method="post">
                                            <input  type="submit" name="deleteexam" value="Delete Test">
                                        </form>
                                        </td>
                                        <td class="center">
                                        <c:choose>
                                            <c:when test="${data.getStatus().equalsIgnoreCase('unavailable')}">
                                            <form action="${pageContext.request.contextPath}/Admin/examtabledata/${data.getTestid() }" method="post">
                                                    <input  type="submit" name="enableexam" value="Enable Test">
                                             </form>
                                            </c:when>
                                            <c:otherwise>
                                            <form action="${pageContext.request.contextPath}/Admin/examtabledata/${data.getTestid() }" method="post">
                                                <input  type="submit" name="disableexam" value="Disabled Test">
                                            </form>
                                             </c:otherwise>
                                         </c:choose>
                                        </td>
                                        <td class="center">
                                        <form action="${pageContext.request.contextPath}/Admin/updatequiz/${data.getTestid() }" method="post">
                                            <input  type="submit" name="deleteexam" value="Update Test">
                                        </form>
                                        </td>
                                         </tr>
                                       
                                       
                                     </c:forEach>
                                     
                                    
                                </tbody>
                              
                            </table>
                            
                        </div>
                        <!-- /.panel-body -->
                    </div>
                    <!-- /.panel -->
                </div>
                <!-- /.col-lg-12 -->
            </div>
            
        </div>
        <!-- /#page-wrapper -->

    </div>
    <!-- /#wrapper -->

    <!-- jQuery -->
    <script src="<%=request.getContextPath()%>/resources/Admin/vendor/jquery/jquery.min.js"></script>

    <!-- Bootstrap Core JavaScript -->
    <script src="<%=request.getContextPath()%>/resources/Admin/vendor/bootstrap/js/bootstrap.min.js"></script>

    <!-- Metis Menu Plugin JavaScript -->
    <script src="<%=request.getContextPath()%>/resources/Admin/vendor/metisMenu/metisMenu.min.js"></script>

    <!-- DataTables JavaScript -->
    <script src="<%=request.getContextPath()%>/resources/Admin/vendor/datatables/js/jquery.dataTables.min.js"></script>
    <script src="<%=request.getContextPath()%>/resources/Admin/vendor/datatables-plugins/dataTables.bootstrap.min.js"></script>
    <script src="<%=request.getContextPath()%>/resources/Admin/vendor/datatables-responsive/dataTables.responsive.js"></script>

    <!-- Custom Theme JavaScript -->
    <script src="<%=request.getContextPath()%>/resources/Admin/dist/js/sb-admin-2.js"></script>

    <!-- Page-Level Demo Scripts - Tables - Use for reference -->
    <script>
    $(document).ready(function() {
        $('#dataTables-example').DataTable({
            responsive: true
        });
    });
    </script>

</body>

</html>
