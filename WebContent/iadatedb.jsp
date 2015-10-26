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
String branch=request.getParameter("branch");
String sem=request.getParameter("sem");
String testno=request.getParameter("testno");
String mnth=request.getParameter("mnth");
String year=request.getParameter("year");
String date1=request.getParameter("date1");
String date2=request.getParameter("date2");
String date3=request.getParameter("date3");
String d="~";
String fin=date1+d+date2+d+date3+d+mnth+d+year;
String del="`";
String str1="";
String str2="";
String em[]=null;
String date=null,imgid=null;
String id=session.getAttribute("adi").toString();
String did=null,dts=null;
try{
	Class.forName("sun.jdbc.odbc.JdbcOdbcDriver");
	Connection con=DriverManager.getConnection("jdbc:odbc:rosh","root","root");

	Statement st1=con.createStatement();
	ResultSet rs1=st1.executeQuery("select * from iainfo where branch='"+branch+"' and sem='"+sem+"' and testno='"+testno+"'");

	                                                         while(rs1.next())
				                                            {
	                                               
	                                                 imgid=rs1.getString(1); 
	                                               
	                                                       }	
   	                                                         
   	        if(imgid==""||imgid==null){
   	        	int updateQuery=0;

   	    	 	PreparedStatement psr = null;
   	    	 	psr=con.prepareStatement("INSERT INTO iainfo VALUES(?,?,?,?,?,?,?)");
   	    	 psr.setNull(1, java.sql.Types.INTEGER);
   	    	 	psr.setString(2,id);
   	    	 	psr.setString(3,branch);
   	    	 	psr.setString(4,sem);
   	    	 	psr.setString(5,testno);
   	    	 	psr.setString(6,fin);
   	    	 psr.setNull(7, java.sql.Types.INTEGER);
   	    	 	psr.executeUpdate();
   	    	 	
   	    	 Statement st2=con.createStatement();
	    	 	ResultSet rs2=st2.executeQuery("select * from iainfo where date='"+fin+"'");
	    	 	
	    	 	while(rs2.next())
	    	 	{
	    	                                            did=rs2.getString("id");
	    	                                           
	    	                                           dts=rs2.getString("ts");
	    	                                          
	    	                                       
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
   	    	 em=s.split("`");

   	    	String sub="Mail from Notice Board..!!";

    	 	String msgg="IA info has been inserted into the database, Notification id is : "+did+", Timestamp(YYYY-MM-DD HH:MM:SS) is :"+dts+" and date is :"+fin+", please open android app and check, Thank you.";

    	 	smail.sendmail(em,sub,msgg);
    	 	
    	 	out.println("Ok, IA info has been inserted into the database..!!, Notification id is : "+did+", Timestamp(YYYY-MM-DD HH:MM:SS) is :"+dts+" and date is :"+fin+"");
   	    	       	     
   	        }
   	        else{
   	        	out.println("Duplicate entry..!!");
   	        }
}
catch(Exception e){
out.println(e);	
}
%>
</body>
</html>