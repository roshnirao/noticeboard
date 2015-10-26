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
</head>
<body>
<%
String p=request.getParameter("pass");
String u=request.getParameter("usid");

 Class.forName("sun.jdbc.odbc.JdbcOdbcDriver");

Connection conn=DriverManager.getConnection("jdbc:odbc:rosh","root","root");

int updateQuery=0;

PreparedStatement ps = null;


String sql = "update lecturer set pass='"+p+"' where email='"+u+"'";
	ps = conn.prepareStatement(sql);
	updateQuery = ps.executeUpdate();

String sub="Your account password has been successfully changed..!!";

String msgg="Your account with the email id : "+u+" and its new password : "+p+", Thank you.";

smail.sendmail(u,sub,msgg);


%>
<center>
<br /><br />
<h2>
Password changed successfully, Your account with the Email id : "<%=u%>" and its new password : "<%=p%>", Thank you.<br />
<a href="index.jsp">Go to Sign in page.</a>
</h2>
</center>
</body>
</html>