<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
     <%
     String user = null;
     if(session.getAttribute("username") == null || session.getAttribute("roles")==null){
     	
     	response.sendRedirect("index.jsp");
     	
     }else{ 
     	if(session.getAttribute("roles").toString().equals("3")){
     	user = (String) session.getAttribute("username");
     	}
     	else{
     		response.sendRedirect("index.jsp");
     	}
     		
     	}

String userName = null;
String sessionID = null;
Cookie[] cookies = request.getCookies();
if(cookies !=null){
for(Cookie cookie : cookies){
	if(cookie.getName().equals("username")) userName = cookie.getValue();
	if(cookie.getName().equals("JSESSIONID")) sessionID = cookie.getValue();
}
%> 
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta name="description" content="">
<meta name="author" content="">
<title>View Test</title>
<link href="css/bootstrap.min.css" rel="stylesheet" type="text/css">
<link href="css/bootstrap.min2.css" rel="stylesheet">
<!--<link href="css/freelancer.min.css" rel="stylesheet" type="text/css">-->
<link href="css/font-awesome.min.css" rel="stylesheet" type="text/css">
<link href="https://fonts.googleapis.com/css?family=Ubuntu:500|Vollkorn" rel="stylesheet">
<link rel="stylesheet" href="css/animate.css">
<link rel="stylesheet" href="css/adminpage.css">
<link rel="stylesheet" href="css/modify.css">

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
            <a class="navbar-brand" href="#page-top">Online Test Engine</a>
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
<aside class="left col-xs-3">
   <div class="panel-group" id="accordion" role="tablist" aria-multiselectable="true">
  <div class="panel panel-default">
   <div class="panel-heading" role="tab" id="headingtwo">
      <h4 class="panel-title">
        <a role="button" data-toggle="collapse" data-parent="#accordion" href="#" aria-expanded="true" aria-controls="collapsetwo">
          Course 
        </a>
      </h4>
    </div>
    <div id="collapsetwo" class="panel-collapse collapse in" role="tabpanel" aria-labelledby="headingtwo">
      <div class="panel-body">
       <ul class="nav-sidebar nav">
        <li><a href="viewcourse.jsp">Course View</a></li>
          </ul>
      </div>
  </div>
    <div class="panel-heading" role="tab" id="headingOne">
      <h4 class="panel-title">
        <a role="button" data-toggle="collapse" data-parent="#accordion" href="#" aria-expanded="false" aria-controls="collapseOne">
         Test Details
        </a>
      </h4> 
    </div>
    <div id="collapseOne" class="panel-collapse collapse in" role="tabpanel" aria-labelledby="headingOne">
      <div class="panel-body">
       <ul class="nav-sidebar nav">
        <li><a onclick="showContent('addteacher.jsp')" href="#"> Test Result</a></li>
        <li><a href="#page-top"> View Test</a></li>
          </ul>
      </div>
  </div>
   <div class="panel-heading" role="tab" id="headingfour">
      <h4 class="panel-title">
        <a role="button" data-toggle="collapse" data-parent="#accordion" href="#" aria-expanded="true" aria-controls="collapsefour">
         Studnet Details
        </a>
      </h4>
    </div>
    <div id="collapsefour" class="panel-collapse collapse in" role="tabpanel" aria-labelledby="headingfour">
      <div class="panel-body">
       <ul class="nav-sidebar nav">
        <li><a href="register.jsp"> Edit Profile </a></li>
        <li><a href="forgetpassword.jsp"> Change Password</a></li>
        <li><a href="sendquery.jsp"> Send Query</a></li>
          </ul>
        </div>
  </div>
       </div>
    </div>
</aside>
<!--<section class="right">-->
<div class="col-xs-9">
			<div class="col-xs-12 col-md-6 col-lg-3">
				<div class="panel panel-blue panel-widget ">
					<div class="row no-padding">
						<div class="col-sm-3 col-lg-5 widget-left">
							<svg class="glyph stroked bag"><use xlink:href="#stroked-male-user"></use></svg>
						</div>
						<div class="col-sm-9 col-lg-7 widget-right">
							<div class="large">120</div>
							<div class="text-muted">Total Students</div>
						</div> 
					</div>
				</div>
			</div>
			<div class="col-xs-12 col-md-6 col-lg-3">
				<div class="panel panel-orange panel-widget">
					<div class="row no-padding">
						<div class="col-sm-3 col-lg-5 widget-left">
							<svg class="glyph stroked empty-message"><use xlink:href="#stroked-empty-message"></use></svg>
						</div>
						<div class="col-sm-9 col-lg-7 widget-right">
							<div class="large">52</div>
							<div class="text-muted">Query</div>
						</div>
					</div>
				</div>
			</div>
			<div class="col-xs-12 col-md-6 col-lg-3">
				<div class="panel panel-teal panel-widget">
					<div class="row no-padding">
						<div class="col-sm-3 col-lg-5 widget-left">
							<svg class="glyph stroked male-user"><use xlink:href="#stroked-male-user"></use></svg>
						</div>
						<div class="col-sm-9 col-lg-7 widget-right">
							<div class="large">50</div>
							<div class="text-muted">Total Faculty</div>
						</div>
					</div>
				</div>
			</div>
			<div class="col-xs-12 col-md-6 col-lg-3">
				<div class="panel panel-widget">
					<div class="row no-padding">
						<div class="col-sm-3 col-lg-5 widget-left panel-red">
							<svg class="glyph stroked app-window-with-content"><use xlink:href="#stroked-app-window-with-content"></use></svg>
						</div>
						<div class="col-sm-9 col-lg-7 widget-right">
							<div class="large">20</div>
							<div class="text-muted">Total Tests</div>
						</div>
					</div>
				</div>
			</div>
          <div id="mainContent">
          <h2 style="text-align: center;">Total Tests</h2>
          <hr>
        <table class="table sidestyle2">
            <thead>
            <tr>
                <th>S.No.</th>
                <th>Faculty ID</th>
                <th>Course ID</th>
                <th>Test Name</th>
                <th>Test Timing</th>
                <th>Minimum Marks</th>
                <th>Total Marks</th>
                
            </tr>
            </thead>
            <tbody>
            <tr>
                <th scope="row">1</th>
                <td>J12345</td>
                <td>JV125</td>
                <td>JAVA_Core</td>
                <td>180 Minutes</td>
                <td>40</td>
                <td>100</td>
            </tr>
            <tr>
                <th scope="row">2</th>
                <td>C12345</td>
                <td>CP125</td>
                <td>C_Basic</td>
                <td>180 Minutes</td>
                <td>40</td>
                <td>100</td>
            </tr>
            <tr>
                <th scope="row">3</th>
                <td>JV12345</td>
                <td>JDV125</td>
                <td>JADV</td>
                <td>180 Minutes</td>
                <td>40</td>
                <td>100</td>
            </tr>
            <tr>
                <th scope="row">4</th>
                <td>ANLR12345</td>
                <td>ANLR125</td>
                <td>AngularJS</td>
                <td>180 Minutes</td>
                <td>40</td>
                <td>100</td>
            </tr>
            <tr>
                <th scope="row">5</th>
                <td>MONG12345</td>
                <td>MONGO125</td>
                <td>MONGODB</td>
                <td>180 Minutes</td>
                <td>40</td>
                <td>100</td>
            </tr>
            <tr>
                <th scope="row">7</th>
                <td>HTML</td>
                <td>HTML125</td>
                <td>User Interface</td>
                <td>180 Minutes</td>
                <td>40</td>
                <td>100</td>
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
<script src="js/jquery-2.0.3.js"></script>
<script type="application/javascript" src="js/bootstrap.min.js"></script>
<script src="js/lumino.glyphs.js"></script>
<script src="js/ajax.js"></script>
</body>
</html>
 <%}%> 