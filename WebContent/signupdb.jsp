<jsp:useBean id="smail" class="send.mail" />
<%@ page contentType="text/html; charset=iso-8859-1" language="java" import="java.sql.*" errorPage="" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1" />
<title>Sign up Result</title>
<link type="text/css" href="b.css" rel="stylesheet" />
<link rel="icon" href="images/ads.png" type="image/png" /> 
<style type="tex
t/css">
.hlinks{
color:#fff;
font-family:"Times New Roman";
text-decoration:none;
}
h2{
color:#000;
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
String mid = request.getParameter( "uid" );
String mpass = request.getParameter( "upass" );
String mname = request.getParameter( "uname" );
String mbranch = request.getParameter( "ubranch" );
String mmob = request.getParameter( "umob" );

try
{
Class.forName("sun.jdbc.odbc.JdbcOdbcDriver");
Connection con=DriverManager.getConnection("jdbc:odbc:rosh","root","root");

int updateQuery=0;

PreparedStatement psr = null;
psr=con.prepareStatement("INSERT INTO lecturer VALUES(?,?,?,?,?)");
psr.setString(1,mid);
psr.setString(2,mpass);
psr.setString(3,mname);
psr.setString(4,mbranch);
psr.setString(5,mmob);
psr.executeUpdate();

String sub="Mail from Notice Board..!!";

String msgg="Your account has been created, Your User id is : "+mid+" and Password is :"+mpass+"  , Thank you.";

smail.sendmail(mid,sub,msgg);
%>
<html>
<center>
<h2>Sign up successful, Email will be sent to your Email-id </h2>
<h3>'<%=mid%>'</h3> 
<h2>shortly, Thank you</h2>
<h2><a href="signup.jsp" class ="hlinks" title="Click on this link to go back">Go to sign up page</a></h2>
<h2><a href="index.jsp" class ="hlinks" title="Click on this link to go to signin page.">Sign in</a></h2>
</center></html>

<%
}
catch(Exception e)
{
%>
<html>
<center>
<h2>Duplicate Email id, it already exists in the database..!!</h2>
<h2><a href="signup.jsp" class ="hlinks" title="Click on this link to go back">Go back</a></h2>
</center>
</html>
<%
}
%>
</body>
</html>