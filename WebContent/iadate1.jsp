
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
var b=document.forms["f"]["branch"].value;
var c=document.forms["f"]["sem"].value;
var d=document.forms["f"]["testno"].value;
var e=document.forms["f"]["mnth"].value;
var f=document.forms["f"]["year"].value;
var i=document.forms["f"]["date1"].value;
var g=document.forms["f"]["date2"].value;
var h=document.forms["f"]["date3"].value;

if (b=="o" || c=="o" || d=="o"|| e=="o"||f=="o"||i=="o"||g=="o"||h=="o")
  {
  alert("Select the values other than default values..!!");
  return false;
  }
}
</script>
</head>
<body>
<center>
<br /><br />
<h1>Welcome to IA Info insert page..!!</h1>
<form name="f"  action="iadatedb.jsp" method="get" onsubmit="return validateForm()">
<select  name="branch" id="us" class="resized">
<option value="o">select the branch
<option value=CS>CS
<option value=IS>IS
<option value=EC>EC
<option value=EE>EE
<option value=CIV>CIV
<option value=EI>EI
<option value=IP>IP
<option value=MECH>MECH
</select><br /><br />
<select  name="sem" id="sb" class="resized">
<option value="o">select the sem
<option value=1>1
<option value=2>2
<option value=3>3
<option value=4>4
<option value=5>5
<option value=6>6
<option value=7>7
<option value=8>8
</select><br /><br />
<select  name="testno" id="t" class="resized">
<option value="o">select the test number
<option value=1>1
<option value=2>2
<option value=3>3
</select><br /><br />



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
</select>
<select  name="year" id="y" class="resized" rowspan=2 colspan=2>
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



<br>


<h2>test day1</h2>
<select  name="date1" id="d" class="resized" rowspan=2 colspan=2>
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



<h2>test day2</h2>
<select  name="date2" id="d1" class="resized" rowspan=2 colspan=2 restricted>
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

<h2>test day3</h2>
<select  name="date3" id="d2" class="resized" rowspan=2 colspan=2>
<option value="o">select the date
<% 
for( int i=1;i<=31;i++)
{
	%>
	
	<option id=i value="<%=+i %>"><%=+i %>
	<% 
}
%>
</select><br /><br />
<input type="submit" value="  Submit  " style="background-color:#000; font-family:Times new roman; color:#fff; font-size:19px" /><br /><br />
</form>
Image uploaded successfully..!!, now select test details and click on "Submit" button.
 </center>
</body>
</html>