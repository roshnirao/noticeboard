<%@ page contentType="text/html; charset=iso-8859-1" language="java" import="java.sql.*" errorPage="" %>
<%@ page import="java.io.*,java.util.*, javax.servlet.*" %>
<%@ page import="javax.servlet.http.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>

<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
<link type="text/css" href="b.css" rel="stylesheet" />
<style type="text/css">
.hlinks{
color:#fff;
font-family:"Times New Roman";
text-decoration:none;
}
</style>
<script type="text/javascript">
function validateForm()
{
	var a=document.forms["f"]["branch"].value;
	var b=document.forms["f"]["year"].value;
	var c=document.forms["f"]["cat"].value;
var d=document.forms["f"]["date"].value;
var e=document.forms["f"]["mnth"].value;
var f=document.forms["f"]["year"].value;
var g=document.forms["f"]["cat"].value;
if (a=="o" || b=="o" || c=="o" ||d=="o" ||  e=="o" || f=="o" || g=="o")
  {
  alert("Select the values other than default values..!!");
  return false;
  }
}

function validateForm1()
{
var a=document.forms["fs"]["wall"].value;

if (a==null || a=="")
  {
  alert("Please Choose the image file first then click on Upload the image button");
  return false;
  }
}
</script>
</head>
<body>
<center>
<br /><br />
<h1>Welcome to Technical event page..!!</h1><br /><br />
Ok, image has been uploaded, please submit event details...<br /><br />

 <form name="f"  action="technicaldb.jsp" method="get" onsubmit="return validateForm()">
 <select  name="branch" id="us" class="resized">
<option value="o">select the branch
<option value=CS>CS
<option value=IS>IS
<option value=EC>EC
<option value=EE>EE
<option value=EE>EE
<option value=EI>EI
<option value=IP>IP
<option value=MECH>MECH
</select><br /><br />
 <select  name="year" id="is" class="resized">
<option value="o">select the year
<option value=1>1
<option value=2>2
<option value=3>3
<option value=4>4
</select><br /><br />
 
 <input type="text" name="tname" size="100" maxlength="200" placeholder="Technical Event name" required /> <br /><br />
 
 <textarea name="tinfo" cols=100 rows=5 style="resize: none;" maxlength="500" placeholder="Technical Event Information" required></textarea><br /><br />
 <select  name="cat" id="d" class="resized" rowspan=2 colspan=2>
 <option value="o">select the category
 <option value="workshop">workshop
  <option value="seminar">seminar
  </select><br /><br />
   
<select  name="date" id="d" class="resized" rowspan=2 colspan=2>
<option value="o">select the date
<% 
for( int i=1;i<=31;i++)
{
	%>
	
	<option id=i value="<%=+i %>"><%=+i %>
	<% 
}
%>
</select>
<br /><br />

<select  name="mnth" id="m" class="resized" rowspan=2 colspan=2>
<option value="o">select the month
<% 
for( int i=1;i<=12;i++)
{
	%>
	<option id=i value="<%=+i %>"><%=+i %>
	<% 
}
%>
</select><br /><br />
<select  name="tyear" id="y" class="resized" rowspan=2 colspan=2>
<option value="o">select the year
<% 
for( int i=2010;i<=2020;i++)
{
	%>
	<option id=i value="<%=+i %>"><%=+i%>
	<% 
}
%>
</select>
<br /><br />
<input type="submit" value="  Submit  " style="background-color:#000; font-family:Times new roman; color:#fff; font-size:19px" /><br /><br />
</form>
</body>
</html>