<%@ page contentType="text/html; charset=iso-8859-1" language="java" import="java.sql.*" errorPage="" %>
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
var e=document.forms["f"]["mnth"].value;
var f=document.forms["f"]["year"].value;
var i=document.forms["f"]["date1"].value;
var g=document.forms["f"]["date2"].value;
var h=document.forms["f"]["date3"].value;

if (e=="o"||f=="o"||i=="o"||g=="o"||h=="o")
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
<%
String branch=request.getParameter("branch");
String sem=request.getParameter("sem");
String testno=request.getParameter("testno");
Class.forName("sun.jdbc.odbc.JdbcOdbcDriver");
int updateQuery=0;
Connection conn=DriverManager.getConnection("jdbc:odbc:rosh","root","root");
String imgid=null,date=null;
try
{ 
	Statement st=conn.createStatement();
	ResultSet rs=st.executeQuery("select * from iainfo where branch='"+branch+"' and sem='"+sem+"' and testno='"+testno+"'");

	                                                         while(rs.next())
				                                            {
	                                               
	                                                 imgid=rs.getString(2); 
	                                                 date=rs.getString(6); 
	                                                       }	
	         if(date==null||date==""){
	        	 out.println("no records found for your selection..!!");
	         }
	         else
	         {
	        	session.setAttribute("b", branch);
	        	session.setAttribute("s", sem);
	        	session.setAttribute("t", testno);
	        	session.setAttribute("adi", imgid);
	        	session.setAttribute("d", date);
	        	%>
	        	<h3>Current date</h3><br />
	        	<textarea cols=30 rows=5 style="resize: none;" readonly><%=date%></textarea><br /><br />
	        	<form name="f"  action="upiainfodb.jsp" method="get" onsubmit="return validateForm()">
	        	<input type="hidden" name=imgid value="<%=imgid%>" /><br />
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
</option></select><br /><br />
<input type="submit" value="  Submit  " style="background-color:#000; font-family:Times new roman; color:#fff; font-size:19px" /><br /><br />
</form>
<form  name="fs" ENCTYPE="multipart/form-data" action="upiainfoimg.jsp" onsubmit="return validateForm1()" method="post">
Update the image for your IA test choose file below and click on update button. <br /><br />
 <INPUT NAME="wall" TYPE="file" accept="image/*" style="background-color:#000; font-family:Times new roman; color:#fff; font-size:20px;">  
<INPUT TYPE="submit" VALUE="Update the image" style="background-color:#000; font-family:Times new roman; color:#fff; font-size:20px;">   
 </form>
	        	<%
	        	
	         }
}

catch(Exception e){
out.println(e);	
}
%>
</center>
</body>
</html>