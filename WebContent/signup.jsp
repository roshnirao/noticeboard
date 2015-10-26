<%@ page contentType="text/html; charset=iso-8859-1" language="java" import="java.sql.*" errorPage="" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1" />
<title>Sign up</title>
<link type="text/css" href="b.css" rel="stylesheet" />
<link rel="icon" href="images/ads.png" type="image/png" /> 
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
var a=document.forms["f"]["uid"].value;
var b=document.forms["f"]["upass"].value;
var c=document.forms["f"]["uname"].value;
var d=document.forms["f"]["ubranch"].value;
var e=document.forms["f"]["umob"].value;

if (a==null || a=="" || b==null || b=="" || c==null || c=="" || d=="o" || e==null || e=="")
  {
  alert("Please fill all the input fields..!!");
  return false;
  }
}
</script>

</head>
<body>
<center>
<br /><br /><br /><br />
<h1>Register your name here</h1>
<form name="f" action="signupdb.jsp" method="get" onsubmit="return validateForm()">
<input type="text" name="uid" class="resized" size="27" maxlength="99" placeholder="Your Email id" />
<br /><br />
<input type="password" name="upass" class="resized" size="20" maxlength="18" placeholder="Your password" />
<br /><br />
<input type="text" name="uname" class="resized" size="20" maxlength="99" placeholder="Your name" />
<br /><br />

<form name="f" action="preattnddb.jsp" method="get" onsubmit="return validateForm()">
<select  name="ubranch" id="ub" class="resized">
<option value="o">select the branch
<option value=CSE>CSE
<option value=CVL>CVL
<option value=EC>EC
<option value=EE>EE
<option value=EI>EI
<option value=IP>IP
<option value=MECH>MECH
</select><br /><br />

<input type="text" name="umob" id="n"class="resized" size="10" maxlength="10" minlength="10" placeholder="Your mobile number" />
<br /><br />
 <input type="submit" value="  Sign up  " style="background-color:#000; font-family:Times new roman; color:#fff; font-size:19px" />
 </form>
 </center>
</body>
</html>