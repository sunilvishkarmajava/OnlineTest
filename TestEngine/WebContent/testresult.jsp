<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%
response.setHeader("Cache-Control", "private, no-store, no-cache, must-revalidate");
response.setDateHeader("Expires", 0);
response.setHeader("Pragma", "no-cache");
String user = null;
if(session.getAttribute("username") == null || session.getAttribute("role") == null){
	response.sendRedirect("index.jsp");
}
else{ 
	int role=Integer.parseInt(session.getAttribute("role").toString());
	if(role!=3){
		response.sendRedirect("index.jsp");
	}
	else{
	user = (String) session.getAttribute("username");
	}
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
<title>Welcome: <%=session.getAttribute("username")%></title>
<link href="css/bootstrap.min.css" rel="stylesheet" type="text/css">
<link href="css/bootstrap.min2.css" rel="stylesheet">
<!--<link href="css/freelancer.min.css" rel="stylesheet" type="text/css">-->
<link href="css/font-awesome.min.css" rel="stylesheet" type="text/css">
<link href="https://fonts.googleapis.com/css?family=Ubuntu:500|Vollkorn" rel="stylesheet">
<link rel="stylesheet" href="css/animate.css">
<link rel="stylesheet" href="css/adminpage.css">
<link rel="stylesheet" href="css/modify.css">
<script src="controller/angular.min.js"></script>
<script>
var app=angular.module("myApp",[]);

app.factory("loginfactory",function($http,$q){
    var factoryObject = {};
    factoryObject.doLogin=function(){
       var defer = $q.defer(); $http.post("getTestResultServlet",{'action':'COMMONVALUES'}).then(function(data){
            defer.resolve(data)
        },function(error){
            defer.reject(error);
        });
    return defer.promise;
    }
    return factoryObject;
});
app.factory("pageValuefactory",function($http,$q){
    var factoryObject = {};
    factoryObject.getValue=function(){
       var defer = $q.defer(); $http.post("getPagesCommonDataServlet",{'action':'COMMONVALUES'}).then(function(data){
            defer.resolve(data)
        },function(error){
            defer.reject(error);
        });
    return defer.promise;
    }
    return factoryObject;
});


app.controller("resultCtrl",function($scope,loginfactory,pageValuefactory){

	//$scope.rolesList=[];
    $scope.fetchResults=function(){
	var promise = loginfactory.doLogin();  
        promise.then(function(data){
        	console.log("data is "+data.data);
            $scope.testResultList = data.data;
            //console.log(rolesList);
        },function(error){
            $scope.error = error;
        })
    }

    $scope.pageValue=function(){
    	var promise = pageValuefactory.getValue();  
            promise.then(function(data){
            	console.log("page data is "+data.data);
                $scope.pageData = data.data;
                //console.log(rolesList);
            },function(error){
                $scope.error = error;
            })
        }

    $scope.init=function(){
			$scope.fetchResults();
			$scope.pageValue();
        }
})
</script>
</head>
<body id="page-top" class="index"  ng-app="myApp" ng-controller="resultCtrl" ng-init="init()">
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
                    <a href="studentpage.jsp">Home</a>
                </li>
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
        <li style="background-color: gray;"><a href="testresult.jsp"> Test Result</a></li>
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
        <li><a href="editprofile.jsp"> Edit Profile </a></li>
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
			<div class="col-xs-12 col-md-6 col-lg-6">
				<div class="panel panel-teal panel-widget">
					<div class="row no-padding">
						<div class="col-sm-3 col-lg-5 widget-left">
							<svg class="glyph stroked male-user"><use xlink:href="#stroked-male-user"></use></svg>
						</div>
						<div class="col-sm-9 col-lg-7 widget-right">
							<div class="large">{{pageData.student}}</div>
							<div class="text-muted">Total Student</div>
						</div>
					</div>
				</div>
			</div>
			<div class="col-xs-12 col-md-6 col-lg-6">
				<div class="panel panel-widget">
					<div class="row no-padding">
						<div class="col-sm-3 col-lg-5 widget-left panel-red">
							<svg class="glyph stroked male-user"><use xlink:href="#stroked-male-user"></svg></svg>
						</div>
						<div class="col-sm-9 col-lg-7 widget-right">
							<div class="large">{{pageData.faculty}}</div>
							<div class="text-muted">Total Faculty</div>
						</div>
					</div>
				</div>
			</div>
          <div id="mainContent">
          <h2 style="text-align: center;">Tests Results</h2>
          <hr>
        <table class="table sidestyle2">
            <thead>
            <tr>
            	<th>S.No.</th>
                <th>Test ID</th>
                <th>Test Name</th>
                <th>Minimum Marks</th>
                <th>Total Marks</th>
                <th>Marks</th>
                <th>Date of Test</th> 
            </tr>
            </thead>
            <tbody>
            <tr ng-repeat="result in testResultList">
                <th scope="row">1</th>
                <td>{{result.testId}}</td>
                <td>{{result.testName}}</td>
                <td>{{result.minMarks}}</td>
                <td>{{result.totalMarks}}</td>
                <td>{{result.marks}}</td>
                <td>{{result.test_date}}</td>
            </tr>
            </tbody>
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
<script type="text/javascript" src="js/jquery-2.0.3.min.js"></script>
<script type="application/javascript" src="js/bootstrap.min.js"></script>
<script src="js/lumino.glyphs.js"></script>
<script src="js/ajax.js"></script>
</body>
</html>