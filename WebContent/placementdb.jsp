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
String imgid=session.getAttribute("adi").toString();
String branch=request.getParameter("branch");
String pname=request.getParameter("pname");
String pinfo=request.getParameter("pinfo");
String date=request.getParameter("date");
String mnth=request.getParameter("mnth");
String tyear=request.getParameter("year");
String fin="Placement Event date :"+date+", month:"+mnth+", year:"+tyear;
String del="~";
String str1="";
String str2="";
String em[]=null;
String did=null,dts=null;
try{
	Class.forName("sun.jdbc.odbc.JdbcOdbcDriver");
	Connection con=DriverManager.getConnection("jdbc:odbc:rosh","root","root");
	PreparedStatement psr = null;
   	        	int updateQuery=0;
   	        	
   	        	
   	    	 	
   	    	 	psr=con.prepareStatement("INSERT INTO placement VALUES(?,?,?,?,?,?,?)");
   	    		psr.setNull(1, java.sql.Types.INTEGER);
   	    	 	psr.setString(2,imgid);
   	    	 	psr.setString(3,branch);
   	    	 psr.setString(4,pname);
   	    	 	psr.setString(5,pinfo);
   	    	 	psr.setString(6,fin);
   	    		psr.setNull(7, java.sql.Types.INTEGER);
   	    	 	psr.executeUpdate();
   	        	
   	    	 Statement st1=con.createStatement();
	    	 	ResultSet rs1=st1.executeQuery("select * from placement where pname='"+pname+"'");
	    	 	
	    	 	while(rs1.next())
	    	 	{
	    	                                            did=rs1.getString("id");
	    	                                           
	    	                                           dts=rs1.getString("ts");
	    	                                          
	    	                                       
	    	                                   }
   	        	
   	    	 	Statement st=con.createStatement();
   	    	 	ResultSet rs=st.executeQuery("select email from student");
   	    	 	
   	    	 	while(rs.next())
   	    	 	{
   	    	                                            str1=rs.getString("email");
   	    	                                           
   	    	                                           str2=str2+del+str1;
   	    	                                          
   	    	                                       
   	    	                                   }

   	    	 String s = str2;
   	    	 s = s.substring(1);
   	    	 em=s.split("~");

   	    	String sub="Mail from Notice Board..!!";

	    	 	String msgg="Placement event has been inserted into the database, Notification id is : "+did+", Timestamp is :"+dts+" and Notification info is :"+pinfo+", please open android app and check, Thank you.";

	    	 	smail.sendmail(em,sub,msgg);
	    	 	
	    	 	out.println("Ok, Placement event has been inserted into the database..!!, Notification id is : "+did+", Timestamp is :"+dts+" and Notification info is :"+pinfo+"");
   	    	       	       	       
}
catch(Exception e){
out.println(e);	
}
%>
</body>
</html>