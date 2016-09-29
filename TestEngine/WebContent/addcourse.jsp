<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Courses</title>
    <link href="css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="css/addcourse.css">
    <script type="application/javascript" src="js/jquery-1.12.3.min.js"></script>
    <script type="application/javascript" src="js/bootstrap.min.js"></script>
</head>
<body>
    <section class="main">
    <div id="form">
<form action="courseServlet" method="post" name="registration" class="register">
    <fieldset>
        <label for="ImageUpload">Browse Image:</label>
        <input type="file" value="Browse...." name="uploadimage"/>
        <label for="datalist">Title:</label>
        <input id="text" id="datalist" list="coursetitle" name="course"/>
        <label for="title">Details:</label>
        <textarea class="textareadetails" name="coursedetails" id="title" cols="50px" rows="4"></textarea>
    	<input type="submit" name="submit" class="button" value="Submit" />
    </fieldset>
  </form>
</div>
    </section>
</body>
</html>