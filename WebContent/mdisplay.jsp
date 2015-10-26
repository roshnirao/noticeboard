<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    
    <%@page import="java.io.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
<link type="text/css" href="b.css" rel="stylesheet" />
</head>
<body>
<%
String id=request.getParameter("value");
String path = "";

path = "D:\\VNB_workspace_indigo\\notice_board\\WebContent\\images\\"+id+".jpg";

File file=new File(path);

boolean exists = file.exists();

if(!exists)
{
%>
<center><h2>Image has not been uploaded..!!</h2></center>
<%
}
else
{
	%>
	<center><img src="images/<%=id%>.jpg" /></center>
	<%
}
%>
</body>
</html>