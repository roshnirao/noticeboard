<jsp:useBean id="smail" class="send.ya" />
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
</head>
<body>
<%
String d="~";
String imgid=request.getParameter("imgid");
String mnth=request.getParameter("mnth");
String year=request.getParameter("year");
String date1=request.getParameter("date1");
String date2=request.getParameter("date2");
String date3=request.getParameter("date3");
String fin=date1+d+date2+d+date3+d+mnth+d+year;
String del="`";
String str1="";
String str2="";
String em[]=null;

Class.forName("sun.jdbc.odbc.JdbcOdbcDriver");

Connection conn=DriverManager.getConnection("jdbc:odbc:rosh","root","root");

int updateQuery=0;

PreparedStatement ps = null;


String sql = "update iainfo set date='"+fin+"' where imgid='"+imgid+"'";
	ps = conn.prepareStatement(sql);
	updateQuery = ps.executeUpdate();
	
	Statement st=conn.createStatement();
	 	ResultSet rs=st.executeQuery("select email from student");
	 	
	 	while(rs.next())
	 	{
	                                            str1=rs.getString("email");
	                                           
	                                           str2=str2+del+str1;
	                                          
	                                       
	                                   }

	 String s = str2;
	 s = s.substring(1);
	 em=s.split("`");

	 	String sub="Mail from Notice Board..!!";

	 	String msgg="IA info has been updated, please open android app and check, Thank you.";

	 	smail.sendmail(em,sub,msgg);
	 	
	 	out.println("Ok, test details has been updated in the database..!!");
%>
</body>
</html>