<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>  
<%-- <%@jsp:include page="../TestEngine/WebContent/NoCacheServlet"%> --%>
<%-- <%
/* response.setHeader("Cache-Control", "private, no-store, no-cache, must-revalidate");
response.setDateHeader("Expires", 0);
response.setHeader("Pragma", "no-cache");*/
RequestDispatcher rd = request.getRequestDispatcher("NoCacheServlet");
rd.include(request, response);
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
<html lang="en">
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta name="description" content="">
<meta name="author" content="">
<title>Faculty: Sunil</title>
<link href="css/bootstrap.min.css" rel="stylesheet" type="text/css">
<!--<link href="css/freelancer.min.css" rel="stylesheet" type="text/css">-->
<link href="css/font-awesome.min.css" rel="stylesheet" type="text/css">
<link href="https://fonts.googleapis.com/css?family=Ubuntu:500|Vollkorn" rel="stylesheet">
<link rel="stylesheet" href="css/animate.css">
<link rel="stylesheet" href="css/adminpage.css">
<link rel="stylesheet" href="css/addtest.css">
</head>
<body id="page-top" class="index">
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
                    <a href="#" onclick="logout()">Logout</a>
      			</li>
            </ul>
        </div>
        <!-- /.navbar-collapse -->
    </div>
    <!-- /.container-fluid -->
</nav>
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
        <li><a href="viewcourse.jsp"> View Course</a></li>
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
        <li style="background-color: gray;"><a href="addtestnew.jsp">Add Test</a></li>
        <li><a href="viewtest.jsp">Test View</a></li>
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
        <li><a href="">View Student</a></li>
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
			<li><a href="Adminresetpassword.jsp"> Change Password</a></li>
			<li><a href="Admineditprofile.jsp"> Edit Profile</a></li>
          </ul>
      </div>
  </div>
       </div>
    </div>
</aside>
<!--<section class="right">-->
<div class="col-xs-9">
		<div class="row">
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
			</div>
			<div class="row">
         	   <div id="mainContent" class="col-lg-12">
            		<table class="sidestyle">
            <form action="" method="post" name="addtest" onsubmit="return validate();">
            <tr>
                <td class="tablestyle"><label for="facultyid">Faculty ID</label>
                    <Select name="faculty_id">
                     <!--<datalist id="Faculty">-->
                            <option value="Mean1">Mean1</option>
                            <option value="Java2">Java2</option>
                            <option value="PHP23">PHP23</option>
                            <option value="ADVJAVA35">ADVJAVA35</option>
                            <option value="RUBY23">RUBY23</option>
                    </Select>
                     <!--</datalist>-->
                    <label for="course_id">Course ID</label>
                    <select name="course_id" placeholder="Select Course ID">
                        <!--<datalist id="CourseID">-->
                            <option value="MEAN1">MEAN1</option>
                            <option value="Java2">Java2</option>
                            <option value="PHP2">PHP2</option>
                            <option value="ADVJAVA5">ADVJAVA5</option>
                            <option value="RUBY3">RUBY3</option>
                         <!--</datalist>-->
                </select>
                    </td>
            </tr>
               <tr>
                <td class="tablestyle"><label for="testname">Test Name</label>
                    <input type="text" name="testname" placeholder="Test Name">
                    <label for="testtime">Test Timing</label>
                    <input type="number" name="testtime" placeholder="Test Duration"></td>
            </tr>
            <tr>
                <td  class="tablestyle">
                    <label for="minmarks">Minimum Marks</label>
                    <input type="number" name="minmarks" placeholder="MinMarks">
                    <label for="testtime">Total Marks</label>
                    <input type="number" name="totalmarks" placeholder="Total Marks">
                </td>
            </tr>
            <tr>
                <td>
                    <hr/>
                    <label for="textareaname" >Question </label>
                    <textarea  class="textareadetails" name="testquestion" id="textareaname" placeholder="Write Question here...." cols="50px" rows="4"/></textarea>
                </td>
                <tr><td>
            <label for="option_a">Option A</label>
            <input type="text" placeholder="Option A" name="a"/>
                </td></tr>
            <tr><td>
                <label for="option_a">Option B</label>
                <input type="text" placeholder="Option B" name="b"/>
            </td></tr>
            <tr><td>
                <label for="option_a">Option C</label>
                <input type="text" placeholder="Option C" name="c"/>
            </td></tr>
            <tr><td>
                <label for="option_a">Option D</label>
                <input type="text" placeholder="Option D" name="d"/>
            </td></tr>
            <tr>
                <td>
                    <input type="submit" name="add" class="button" value="Add"><button onclick="" name="publish test">Publish Test</button>
                </td>
            </tr>
            </table>
        <hr/>
        <table class="table sidestyle2">
            <thead>
            <tr>
                <th>Q</th>
                <th>Question:</th>
                <th>Option A</th>
                <th>Option B</th>
                <th>Option C</th>
                <th>Option D</th>
            </tr>
            </thead>
            <tbody>
            <tr>
                <th scope="row">1</th>
                <td>Java</td>
                <td>Otto</td>
                <td>@mdo</td>
                <td>Otto</td>
                <td>@mdo</td>
            </tr>
            <tr>
                <th scope="row">2</th>
                <td>Jacob</td>
                <td>Thornton</td>
                <td>@fat</td>
                <td>Thornton</td>
                <td>@fat</td>
            </tr>
            <tr>
                <th scope="row">3</th>
                <td>Larry</td>
                <td>the Bird</td>
                <td>@twitter</td>
                <td>the Bird</td>
                <td>@twitter</td>
            </tr>
            <tr>
                <th scope="row">4</th>
                <td>Larry</td>
                <td>the Bird</td>
                <td>@twitter</td>
                <td>the Bird</td>
                <td>@twitter</td>
            </tr>
            <tr>
                <th scope="row">5</th>
                <td>Larry</td>
                <td>the Bird</td>
                <td>@twitter</td>
                <td>the Bird</td>
                <td>@twitter</td>
            </tr>
            <tr>
                <th scope="row">7</th>
                <td>Larry</td>
                <td>the Bird</td>
                <td>@twitter</td>
                <td>the Bird</td>
                <td>@twitter</td>
            </tr>
            </tbody>
        </form>
        </table>
         <br>
		</div>
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
<script type="application/javascript" src="js/jquery-1.12.3.min.js"></script>
<script type="application/javascript" src="js/bootstrap.min.js"></script>
<script src="js/ajax.js"></script>
<script src="js/lumino.glyphs.js"></script>
<script type="application/javascript" src="js/addtest.js"></script>

</body>
</html>
<%-- <%}%> --%>