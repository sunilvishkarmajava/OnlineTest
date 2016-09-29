<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%--     <%
response.setHeader("Cache-Control", "private, no-store, no-cache, must-revalidate");
response.setDateHeader("Expires", 0);
response.setHeader("Pragma", "no-cache");
String user = null;
if(session.getAttribute("username") == null){
	response.sendRedirect("index.jsp");
}else user = (String) session.getAttribute("username");
String userName = null;
String sessionID = null;
Cookie[] cookies = request.getCookies();
if(cookies !=null){
for(Cookie cookie : cookies){
	if(cookie.getName().equals("username")) userName = cookie.getValue();
	if(cookie.getName().equals("JSESSIONID")) sessionID = cookie.getValue();
}
%> --%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta name="description" content="">
<meta name="author" content="">
<title>Faculty: Sunil</title>
<link href="css/bootstrap.min.css" rel="stylesheet" type="text/css">
<link href="css/bootstrap.min2.css" rel="stylesheet">
<!--<link href="css/freelancer.min.css" rel="stylesheet" type="text/css">-->
<link href="css/font-awesome.min.css" rel="stylesheet" type="text/css">
<link href="https://fonts.googleapis.com/css?family=Ubuntu:500|Vollkorn" rel="stylesheet">
<link rel="stylesheet" href="css/animate.css">
<link rel="stylesheet" href="css/adminpage.css">
<link rel="stylesheet" href="css/modify.css">
<script src="js/jquery-2.0.3.js"></script>
<script type="application/javascript" src="js/bootstrap.min.js"></script>
<script src="js/lumino.glyphs.js"></script>
<script src="js/ajax.js"></script>
</head>
<body id="page-top" class="index">
    <div class="col-xl-12">
    <nav id="mainNav" class="navbar navbar-default navbar-fixed-top navbar-custom colornav">
    <div class="container">
        <!-- Brand and toggle get grouped for better mobile display -->
        <div class="navbar-header page-scroll">
            <button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1">
                <span class="sr-only">Toggle navigation</span> Menu <i class="fa fa-bars"></i>
            </button>
            <a class="navbar-brand" href="index.jsp">Online Test Engine</a>
        </div>

        <!-- Collect the nav links, forms, and other content for toggling -->
        <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
            <ul class="nav navbar-nav navbar-right">
                <li class="page-scroll">
                    <a onclick="logout()" href="#">Logout</a>
                </li>
            </ul>
        </div>        
        <!-- /.navbar-collapse -->
    </div>
    <!-- /.container-fluid -->
</nav>
</div>
<div class="group col-xs-12">
<aside class="left col-xs-3 col-md-6 col-sm-12 col-lg-3">
   <div class="panel-group" id="accordion" role="tablist" aria-multiselectable="true">
  <div class="panel panel-default">
   <div class="panel-heading" role="tab" id="headingtwo">
      <h4 class="panel-title">
        <a role="button" data-toggle="collapse" data-parent="#accordion" href="#" aria-expanded="true" aria-controls="collapsetwo">
        	Course Details	
        </a>
      </h4>
    </div>
    <div id="collapsetwo" class="panel-collapse collapse in" role="tabpanel" aria-labelledby="headingtwo">
      <div class="panel-body">
       <ul class="nav-sidebar nav">
        <li><a href="facultyviewcourse.jsp"> View Course</a></li>
        	<li><a onclick="showContent('addcourse.jsp')" href="#"> Add Course</a></li>
          </ul>
      </div>
  </div>
  <div class="panel-heading" role="tab" id="headingthree">
      <h4 class="panel-title">
        <a role="button" data-toggle="collapse" data-parent="#accordion" href="" aria-expanded="true" aria-controls="collapsethree">
         Test Details
        </a>
      </h4>
    </div>
    <div id="collapsethree" class="panel-collapse collapse in" role="tabpanel" aria-labelledby="headingthree">
      <div class="panel-body">
       <ul class="nav-sidebar nav">
        <li><a href="addtestnew.jsp">Add Test</a></li>
        <li><a href="facultyviewtest.jsp">Test View</a></li>
          </ul>
      </div>
  </div>
   <div class="panel-heading" role="tab" id="headingfour">
      <h4 class="panel-title">
        <a role="button" data-toggle="collapse" data-parent="#accordion" href="#" aria-expanded="true" aria-controls="collapsefour">
         Student Details
        </a>
      </h4>
    </div>
    <div id="collapsefour" class="panel-collapse collapse in" role="tabpanel" aria-labelledby="headingfour">
      <div class="panel-body">
       <ul class="nav-sidebar nav">
        <li style="background-color: gray;"><a href="facultyviewstudent.jsp">View Student</a></li>
          </ul>
        </div>
  	</div>
  	<div class="panel-heading" role="tab" id="headingthree">
      <h4 class="panel-title">
        <a role="button" data-toggle="collapse" data-parent="#accordion" href="#" aria-expanded="true" aria-controls="collapsethree">
         Faculty Details
        </a>
      </h4>
    </div>
    <div id="collapsethree" class="panel-collapse collapse in" role="tabpanel" aria-labelledby="headingthree">
      <div class="panel-body">
       <ul class="nav-sidebar nav">
			<li><a href="facultyresetpassword.jsp"> Change Password</a></li>
			<li><a href="facultyeditprofile.jsp"> Edit Profile</a></li>
          </ul>
      </div>
  </div>
       </div>
    </div>
</aside>
<!--<section class="right">-->
<div class="col-xs-9">
			<div class="col-xs-12 col-md-6 col-lg-4">
				<div class="panel panel-blue panel-widget ">
					<div class="row no-padding">
						<div class="col-sm-3 col-lg-5 widget-left">
							<svg class="glyph stroked male-user"><use xlink:href="#stroked-male-user"></use></svg>
						</div>
						<div class="col-sm-9 col-lg-7 widget-right">
							<div class="large">120</div>
							<div class="text-muted">Total Admins</div>
						</div> 
					</div>
				</div>
			</div>
			<div class="col-xs-12 col-md-6 col-lg-4">
				<div class="panel panel-teal panel-widget">
					<div class="row no-padding">
						<div class="col-sm-3 col-lg-5 widget-left">
							<svg class="glyph stroked male-user"><use xlink:href="#stroked-male-user"></use></svg>
						</div>
						<div class="col-sm-9 col-lg-7 widget-right">
							<div class="large">24</div>
							<div class="text-muted">Total Students</div>
						</div>
					</div>
				</div>
			</div>
			<div class="col-xs-12 col-md-6 col-lg-4">
				<div class="panel panel-widget">
					<div class="row no-padding">
						<div class="col-sm-3 col-lg-5 widget-left panel-red">
							<svg class="glyph stroked email"><use xlink:href="#stroked-email"/></svg>
						</div>
						<div class="col-sm-9 col-lg-7 widget-right">
							<div class="large">24</div>
							<div class="text-muted">Total test</div>
						</div>
					</div>
				</div>
			</div>
          <div id="mainContent">
          <h2 style="text-align: center;">Total Student</h2>
          <hr>
        <table class="table sidestyle2">
            <thead>
            <tr>
                <th>S.No.</th>
                <th>Name </th>
                <th>Address</th>
                <th>DOB</th>
                <th>Contant No.</th>
                <th>Institute Name</th>
            </tr>
            </thead>
            <tbody>
            <tr>
                <th scope="row">1</th>
                <td>Mark</td>
                <td>Goa</td>
                <td>05-7-1989</td>
                <td>0458268452</td>
                <td>BMPL</td>
            </tr>
            <tr>
                <th scope="row">2</th>
                <td>Jacob</td>
                <td>New York</td>
                <td>12-8-1993</td>
                <td>07185268395</td>
                <td>BMPL</td>
            </tr>
            <tr>
                <th scope="row">3</th>
                <td>Rani</td>
                <td>Delhi</td>
                <td>23-5-1993</td>
                <td>8447586953</td>
                <td>BMPL</td>
            </tr>
            <tr>
                <th scope="row">4</th>
                <td>Shayam</td>
                <td>Haryana</td>
                <td>1-06-1992</t1d>
                <td>8447585248</td>
                <td>BMPL</td>
            </tr>
            <tr>
                <th scope="row">5</th>
                <td>Larry</td>
                <td>Bostan</td>
                <td>12-6-1992</td>
                <td>4587758693</td>
                <td>BMPL</td>
            </tr>
            <tr>
                <th scope="row">7</th>
                <td>Riya</td>
                <td>Delhi</td>
                <td>06-11-1993</td>
                <td>9650922123</td>
                <td>BMPL</td>
            </tr>
            </tbody>
        </form>
        </table>
    </div>
    </div>
    </div>
<footer class="footer">
   <div class="container">
            <div class="row">
                <div class="col-lg-12">
                    Copyright &copy; Your Website 2016
                </div>
            </div>
        </div>
</footer>
</body>
</html>
<%-- <%}%> --%>