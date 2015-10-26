<%@ page contentType="text/html; charset=iso-8859-1" language="java" import="java.sql.*" errorPage="" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1" />
<title>Home</title>
<link type="text/css" href="b.css" rel="stylesheet" />
<style type="text/css">
.hlinks{
color:#fff;
font-family:"Times New Roman";
text-decoration:none;
}
</style>
<script>
function validateForm()
{
var a=document.forms["c"]["uid"].value;
if(a==null||a==""){
alert("Please enter your Email id..!!");
return false;
}
else
{
return true;
}
}
</script>
</head>
<body>
<br />
<br />
<center>
<h1>Please enter your Email id, we will send an Email to reset your password..!!</h1>
<form name="c" action="checkuser.jsp" method="get" onsubmit="return validateForm()">
<input type="text" name="uid" class="resized" size="27" maxlength="99" placeholder="Your Email id" />
<br /><br />
 <input type="submit" value="  Send Email  " style="background-color:#000; font-family:Times new roman; color:#fff; font-size:19px" />
<br /><br />
<br />
<br />
</center>
</body>
</html>