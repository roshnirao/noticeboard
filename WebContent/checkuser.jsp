<jsp:useBean id="smail" class="send.mail" />
<%@ page contentType="text/html; charset=iso-8859-1" language="java" import="java.sql.*" errorPage="" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1" />
<title>Home</title>
<link type="text/css" href="b.css" rel="stylesheet" />
<style type="text/css">
h2{
color:#fff;
font-family:"Times New Roman";
text-decoration:none;
}
h3{
color:#ACACFF;
 font: italic bold 40px/80px Georgia, serif;
font-family:"Times New Roman";
text-decoration:none;
}
</style>
</head>
<body>
<%
String did = request.getParameter("uid");
String dpass=null;
try{

Class.forName("sun.jdbc.odbc.JdbcOdbcDriver");

Connection con=DriverManager.getConnection("jdbc:odbc:rosh","root","root");


Statement st=con.createStatement();
ResultSet rs=st.executeQuery("select * from lecturer where email='"+did+"'");

                                                         while(rs.next())
			{
                                                 dpass=rs.getString("email"); 

                                                       }
if(dpass==null||dpass=="")
{
%>
<center>
<h2>Entered Email id </h2><h3>'<%=did%>'</h3> <h2>does not exist  in Student agenda database, please try again.</h2>
<a href="preforpass.jsp"><img src="images/back.JPG" /></a>
</center>
<%
}
else
{
if(dpass.equals(did))
{
String sub="Student agenda service : Link to reset your password ";

String msgg="Link to reset your password : http://localhost:8080/noticeboard/forgotwebpass.jsp?acc="+did+" , Thank you.";

smail.sendmail(did,sub,msgg);
%>
<center>
<h2>Link to reset your account password has been sent to your Email id : '<%=did%>', please visit that link, Thank you.</h2>
<a href="index.jsp">Go to Sign in page.</a>
</center>
<%
}

}
}
catch(Exception e)
{
out.println(e);
}
%>
</body>
</html>