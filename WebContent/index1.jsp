<%@ page language="java" contentType="text/html; charset=ISO-8859-1" 
 language="java" import="java.sql.*" errorPage="" pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Home</title>
<link type="text/css" href="b.css" rel="stylesheet" />
<link rel="icon" href="index.jpg" type="image/png" /> 
<style type="text/css">
.hlinks{
color:#00000;
font-family:"Times New Roman";
text-decoration:none;
}
</style>
<script>
function validateForm()
{
var a=document.forms["f"]["uid"].value;
var b=document.forms["f"]["upass"].value;
if (a==null || a=="" || b==null || b=="")
  {
  alert("Please fill all the input fields..!!");
  return false;
  }
}
</script>
</head>
<body>
<center>
<h1>WELCOME TO NOTICE BOARD FRONT END</h1>

<h1>Lecturer</h1>

<img src="images/lect.jpg" /><br /><br />


<form name="f" method="get" action="checklogin.jsp" onsubmit="return validateForm()">
<input type="text" name="uid" class="resized" size="27" placeholder="Your username" />
<br /><br />
<input type="password" name="upass" class="resized" size="20" maxlength="18" placeholder="Your password" />
<br /><br />
 <input type="submit" value="  Sign in  " style="background-color:#000; font-family:Times new roman; color:#fff; font-size:19px" />
<br />
<h2><a href="signup.jsp" class ="hlinks" title="Click on this link to Sign up">New user? Sign up here</a></h2>
<h2><a href="preforpass.jsp" class ="hlinks" title="Click on this link to reset your password.">Forgot password ?</a></h2>
</form></center>
</body>

</body>
</html>