<jsp:useBean id="smail" class="send.mail" />
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
var a=document.forms["c"]["pass"].value;
var b=document.forms["c"]["cpass"].value;
if (a==null || a=="" || b==null || b=="")
  {
alert("Please fill all the input fields..!!");
return false;
}
else{
if(a==b){
return true;
}
else{
alert("Entered passwords didn't match each other..!!");
return false;
}
}
}

</script>
</head>
<body>
<%


String id=request.getParameter("acc");
%>
<center>
<br /><br />
<h2>
Please enter new password for your Notice Board account with the USN : '<%=id%>' .

<form name="c" action="resetapppass.jsp" method="get" onsubmit="return validateForm()">

<input type="hidden" name="usid" class="resized" size="27" value="<%=id%>" />
<br /><br />

<input type="password" name="pass" class="resized" size="27" placeholder="New password" />
<br /><br />
<input type="password" name="cpass" class="resized" size="20" maxlength="18" placeholder="Confirm password" />
<br /><br />
 <input type="submit" value="  Reset password  " style="background-color:#000; font-family:Times new roman; color:#fff; font-size:19px" />
<br /><br />
</form>
</h2>
</center>
</body>
</html>