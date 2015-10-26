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
String sem=request.getParameter("sem");
String code[]=request.getParameterValues("code");
String date[]=request.getParameterValues("date");
String mnth[]=request.getParameterValues("mnth");
String year[]=request.getParameterValues("year");
String del="~";
String str1="";
String str2="";
String em[]=null;
String id=session.getAttribute("adi").toString();
try{
	Class.forName("sun.jdbc.odbc.JdbcOdbcDriver");
	Connection con=DriverManager.getConnection("jdbc:odbc:rosh","root","root");
	PreparedStatement psr = null;
   	        	int updateQuery=0;
   	        	
   	        	for(int i=0;i<code.length;i++)	{
   	    	 	
   	    	 	psr=con.prepareStatement("INSERT INTO exam VALUES(?,?,?,?,?)");
   	    	 	psr.setString(1,imgid);
   	    	 	psr.setString(2,branch);
   	    	 	psr.setString(3,sem);
   	    	 	psr.setString(4,code[i]);
   	    	 	psr.setString(5,"Date:"+date[i]+", Month:"+mnth[i]+", Year:"+year[i]+"");
   	    	 	psr.executeUpdate();
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

   	    	 	String msgg="EXAM info has been inserted into the database, please open android app and check, Thank you.";

   	    	 	smail.sendmail(em,sub,msgg);
   	    	 	
   	    	 	out.println("Ok, EXAM details has been inserted into the database..!!");
   	    	       	       	       
}
catch(Exception e){
out.println(e);	
}
%>
</body>
</html>