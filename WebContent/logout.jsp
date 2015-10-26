<%@ page contentType="text/html; charset=iso-8859-1" language="java" import="java.sql.*" errorPage="" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1" />
<title>Logout of iMAS Ads</title>
<link rel="icon" href="ads.png" type="image/png" /> 
<link type="text/css" href="b.css" rel="stylesheet" />
</head>
<body>
<%
session.invalidate();
response.setHeader("Cache-Control", "no-cache"); //Forces caches to obtain a new copy of the page from the origin server  
 response.setHeader("Cache-Control", "no-store"); //Directs caches not to store the page under any circumstance  
 response.setDateHeader("Expires", 0); //Causes the proxy cache to see the page as "stale"  
 response.setHeader("Pragma", "no-cache"); //HTTP 1.0 backward compatibility  
%>
<center>
<h2>Logout successfull, Please click on the below icon to return to home page<br /><br />
<a href="index.jsp"><img src="images/home.png" width="150" height="150" /></a></h2>

</center>
</body>
</html>