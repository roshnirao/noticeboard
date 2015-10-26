<%@ page contentType="text/html; charset=iso-8859-1" language="java" import="java.sql.*" errorPage="" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1" />
<title>Home</title>
<link type="text/css" href="b.css" rel="stylesheet" />
<link rel="icon" href="index.jpg" type="image/png" /> 
<style type="text/css">
.hlinks{
color:#43e8d8;
font-family:"Times New Roman";
text-decoration:none;
}
</style>
</head>
<body>
<%
String did = request.getParameter("uid");
String ddpass = request.getParameter("upass");
String check="";
String dpass=null,dname=null;
try{

Class.forName("sun.jdbc.odbc.JdbcOdbcDriver");

Connection con=DriverManager.getConnection("jdbc:odbc:rosh","root","root");


Statement st=con.createStatement();
ResultSet rs=st.executeQuery("select * from lecturer where email='"+did+"'");

                                                         while(rs.next())
			                                            {
                                               
                                                 dpass=rs.getString(2); //PSSWORD
                                                 dname=rs.getString(3); //NAME
                                                       }
if(dpass.equals(ddpass))
{
session.setAttribute( "userid",did);
session.setAttribute( "uname",dname);
response.sendRedirect("mainpage.jsp");
}
else
{
%>
<html>
<center><h2>Entered password is wrong..!!</h2>
<a href="index1.jsp"><img src="index.jpg" /></a></center>
</html>
<%
}

}
catch(Exception e)
{
	%>
	<html>
	<center><h2>This account does not exist in the database</h2>
	<a href="index1.jsp"><img src="index.jpg" /></a></center>
	</html>
	<%
}
%>
</body>
</html>