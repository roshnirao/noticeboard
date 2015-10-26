<%@ page contentType="text/html; charset=iso-8859-1" language="java" import="java.sql.*" errorPage="" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
<link type="text/css" href="b.css" rel="stylesheet" />
<link rel="icon" href="images/ads.png" type="image/png" /> 
<style type="text/css">
.hlinks{
color:#fff;
font-family:"Times New Roman";
text-decoration:none;
}
</style>
</head>
<script type="text/javascript">
function sends(x)
{
//document.location.href="mdisplay.jsp?value="+x;
window.open ('mdisplay.jsp','_self',false);
}
</script>
<body>
<center>
<br /><br />
<table width="100%" BORDER=1 CELLPADDING=3 CELLSPACING=1 RULES=ROWS FRAME=HSIDES style="background-color:#FFF">
<tr class="tab">
<td width="20%">Information</td>
<td width="20%">Start Date</td>
<td width="20%">Last Date</td>
</tr>
</table>
<%
String s=request.getParameter("cat");
Class.forName("sun.jdbc.odbc.JdbcOdbcDriver");
String img=null,info=null,sdate=null,ldate=null;
Connection conn=DriverManager.getConnection("jdbc:odbc:rosh","root","root");
ResultSet rst = null;
Statement stmt=null;
try
{ 


stmt=conn.createStatement();

rst=stmt.executeQuery("select * from money where cat='"+s+"'");
  	        	
}
catch(Exception e)
{
out.println("Exception is "+e);
}
while(rst.next())
{
	img=rst.getString(2);
	info=rst.getString(3);
	sdate=rst.getString(5);
	ldate=rst.getString(6);
%>
<table width="100%" BORDER=1 CELLPADDING=3 CELLSPACING=1 RULES=ROWS FRAME=HSIDES style="background-color:#000">
<tr class="tab">
<td width="20%"><a class="hlinks" href="mdisplay.jsp?value=<%=img%>"><%=info%></a></td>
<td width="20%"><a class="hlinks" href="#" onclick="sends('<%=img%>')"><%=sdate%></a></td>
<td width="20%"><a class="hlinks" href="#" onclick="sends('<%=img%>')"><%=ldate%></a></td>
</tr>
</table>
<%
}
%>
<br />
</center>
</body>
</html>