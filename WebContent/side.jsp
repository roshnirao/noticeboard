<%@ page contentType="text/html; charset=iso-8859-1" language="java" import="java.sql.*" errorPage="" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
<link type="text/css" href="b.css" rel="stylesheet" />
<style type="text/css">

.hlinks{

color:#000;

font-family:"Times New Roman";

text-decoration:none;
 font-size: 25px;

}

tr:hover {
 background-color:#333;
}


		
</style>
</head>
<body>
<%
String user=session.getAttribute("uname").toString();
%>
Welcome, <br />
<%=user%><br /><br />
<table width="100%" CELLPADDING=3 CELLSPACING=1>

<tr class="tab">
<td><a href="chooseia.jsp" class="hlinks" target="main">IA DATES</a>
</tr>

<tr class="tab">
<td><a href="preexam.jsp" class="hlinks" target="main">Exam DATES</a>
</tr>

<tr class="tab">
<td><a href="incoll.jsp" class="hlinks" target="main">Intra college events</a>
</tr>

<tr class="tab">
<td><a href="outcoll.jsp" class="hlinks" target="main">Inter college events</a>
</tr>

<tr class="tab">
<td><a href="technical.jsp" class="hlinks" target="main">Technical events</a>
</tr>

<tr class="tab">
<td><a href="placement.jsp" class="hlinks" target="main">Placement events</a>
</tr>

<tr class="tab">
<td><a href="money.jsp" class="hlinks" target="main">Money</a>
</tr>

<tr class="tab">
<td><a href="about.jsp" class="hlinks" target="main">about</a>
</tr>

<tr class="tab">
<td><a href="confirmpass.jsp" class="hlinks" target="main">manage your account</a>
</tr>

<tr class="tab">
<td><a href="logout.jsp" class="hlinks" target="_top">Logout</a>
</tr>


</table>
</body>
</html>