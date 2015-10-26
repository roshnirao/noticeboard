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
	var c=document.forms["f"]["cat"].value;
var d=document.forms["f"]["sdate"].value;
var e=document.forms["f"]["smnth"].value;
var f=document.forms["f"]["syear"].value;
var g=document.forms["f"]["ldate"].value;
var h=document.forms["f"]["lmnth"].value;
var i=document.forms["f"]["lyear"].value;

if (c=="o" ||d=="o" ||  e=="o" || f=="o" || g=="o" || h=="o" || i=="o")
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
<%
int ran=(int)(Math.random() * 439639268);
String rstr=Integer.toString(ran);
session.setAttribute("adi", rstr);
session.setAttribute("rpage", "money1.jsp");
%>
<center>
<br /><br />
<h1>Welcome to Money event page..!!</h1>
<form  name="fs" ENCTYPE="multipart/form-data" action="imageupload.jsp" onsubmit="return validateForm1()" method="post">
Upload the image for your IA test choose file below and click on upload button. <br /><br />
 <INPUT NAME="wall" TYPE="file" accept="image/*" style="background-color:#000; font-family:Times new roman; color:#fff; font-size:20px;">  
<INPUT TYPE="submit" VALUE="Upload the image" style="background-color:#000; font-family:Times new roman; color:#fff; font-size:20px;">   
 </form><br /><br />
 <form name="f"  action="moneydb.jsp" method="get" onsubmit="return validateForm()">


 <textarea name="info" cols=100 rows=5 style="resize: none;" maxlength="500" placeholder="Information" required></textarea><br /><br />
<select  name="cat" id="us" class="resized">
<option value="o">select the category
<option value=fee>fee
<option value=scholarship>scholarship
</select><br /><br />
 <h3>Start date : </h3>  
<select  name="sdate" id="d" class="resized" rowspan=2 colspan=2>
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

<select  name="smnth" id="m" class="resized" rowspan=2 colspan=2>
<option value="o">select the month
<% 
for( int i=1;i<=12;i++)
{
	%>
	<option id=i value="<%=+i %>"><%=+i %>
	<% 
}
%>
</select>
<select  name="syear" id="y" class="resized" rowspan=2 colspan=2>
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

<h3>Last date : </h3>  
<select  name="ldate" id="d" class="resized" rowspan=2 colspan=2>
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

<select  name="lmnth" id="m" class="resized" rowspan=2 colspan=2>
<option value="o">select the month
<% 
for( int i=1;i<=12;i++)
{
	%>
	<option id=i value="<%=+i %>"><%=+i %>
	<% 
}
%>
</select>
<select  name="lyear" id="y" class="resized" rowspan=2 colspan=2>
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