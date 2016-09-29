<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Test :</title>
    <link href="css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="css/question.css">
    <script type="application/javascript" src="js/jquery-1.12.3.min.js"></script>
    <script type="application/javascript" src="js/bootstrap.min.js"></script>
    
    
    <script src="controller/angular.min.js"></script>
    <script src="controller/mainController.js"></script>
    <script src="controller/testStartController.js"></script>
    
</head>
<body class="container">
<form method="post"  ng-app="myApp" ng-controller="testController" ng-init="loadTest()">
<div ng-show="testVisible" > 
  <div class="head">
   <header class="group" >
     <div class="studentdetails">
            <ul>
                <li><img src="images/Admin.ico" alt=""></li></h4>
                <li><h4>Name : Sunil</h4></li>
                <li><h4>Exam Test Name: {{testDetails.testName}}</h4></li>
                <li><h4>Exam Test ID: {{testDetails.testid}}</h4></li>
                <li><h4>Test Duration: {{testDetails.testTime}}</h4></li>
                <li><h4>Minimum Marks: {{testDetails.minMarks}}</h4></li>
                <li><h4>Total Marks: {{testDetails.totalMarks}}</h4></li>
                <li><h4>Time Left :  <label ng-bind="Message"></label></h4></li>
                
                
                
            </ul>
            
    </div>
    <div class="navigation-menu">
        
    </div>
   </header>
   </div>
   <div id="content">
    <main class="main">
          <div class="question-contant">
              <h1><strong>Question {{questionNo}} : </strong>{{question}}</h1>
                <h3><input type="radio" name="question" ng-click="answered('A')"> {{optionA}}<br></h3>
                <h3><input type="radio" name="question" ng-click="answered('B')"> {{optionB}}<br></h3>
                <h3><input type="radio" name="question" ng-click="answered('C')"> {{optionC}}<br></h3>
                <h3><input type="radio" name="question" ng-click="answered('D')"> {{optionD}}</h3>
              </p>
          </div>

    </main>
        <aside class="sidebar">
            <Ul>
                <li>
                    <h3>Missed</h3>
                </li>
                <li>
                    <h3>Attemped</h3>
                </li>
                <li>
                    <h3>Wrong</h3>
                </li>
                <li>
                    <h3>Left</h3>
                </li>
            </Ul>
        </aside>
   </div>
   <footer class="footeroption">
       <button value="Previous" ng-click="previousQ()">Previous</button><button value="Next" ng-click="nextQ()">Next</button><button value="Submit" ng-click="submit()">Submit</button>
   </footer>
   
   </div>
   
   <div ng-hide="testVisible" style="font-size: large;text-align: center;width: 800px">
   <div style="text-align: center;">
   Total marks : <b>{{result.totalMarks}} </b><br>
   Marks : <b>{{result.marks}} </b><br>
   Correct answer : <b>{{result.correctAnswer}} </b><br> 
   Wrong answer :<b> {{result.wrongAnswer}}</b><br>
   Skipped question : <b>{{result.skipQuestion}}</b><br> 
   Result : <b>{{result.status}}</b><br>
   <br> <br>
   </div>
   <div style="text-align: center;width: 800px" >
   <table border="2" style="text-align: center;width: 600px" >
   <tr>
   <td style="padding: 5px;">
   Question No :
   </td>
   <td style="padding: 5px;">
   Status :
   </td>
   </tr>
   <tr ng-repeat="question in result.result" align="center">
   <td> 
   Q . {{question.questionNo}}
   </td>
   <td>
    {{question.result}}
   </td>
   </tr>
   </table>
   </div>
   </div>
   </form>
</body>
</html>