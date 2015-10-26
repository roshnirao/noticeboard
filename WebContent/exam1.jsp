<jsp:useBean id="smail" class="send.mail" />
<%@ page contentType="text/html; charset=iso-8859-1" language="java" import="java.sql.*" errorPage="" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1" />
<title>Home</title>
<link type="text/css" href="b.css" rel="stylesheet" />
<style>
table, td, th {
    border: 1px solid;
}

td {
    padding: 10px;
}
</style>
</head>
<body>
<%
String branch=session.getAttribute("sb").toString();
String sem=session.getAttribute("ss").toString();
%>
<center>
<h3>Insert the EXAM details..</h3></center>
<form name="f" action="examdb.jsp" >
<table width="100%" style="background-color:#000">
<tr class="tab">
<td width="10%"><input type="text" name="branch" value="<%=branch%>" class="resized" readonly/></td>
<td width="10%"><input type="text" name="sem"  value="<%=sem%>" class="resized" readonly/></td>
</tr>
</table>
<table width="100%" style="background-color:#FFF">
<tr class="tab">
<td width="10%">SUB CODE</td>
<td width="10%">DATE</td>
<td width="10%">MONTH</td>
<td width="10%">YEAR</td>
</tr>
</table>

<%

Statement st=null,st1=null;
ResultSet rs=null,rs1=null;
String code[]=new String[10000];
String test=null,imgid=null;

int j=0;
try{

	Class.forName("sun.jdbc.odbc.JdbcOdbcDriver");

	Connection con=DriverManager.getConnection("jdbc:odbc:rosh","root","root");

	st=con.createStatement();
	rs=st.executeQuery("select * from exam where branch='"+branch+"' and sem='"+sem+"'");

		while(rs.next()){
			imgid=rs.getString("imgid");
	}
		
	if(imgid==null||imgid==""){
		
	st1=con.createStatement();
	rs1=st1.executeQuery("select * from subcode where branch='"+branch+"' and sem='"+sem+"'");

		while(rs1.next()){
			test=rs1.getString("code");
			
			code[j]=test;
			j++;
	}
		
	if(test==null||test==""){
		out.println("Sub codes doesn't exist in subcode table.");
	}
	else{
for(int k=0;k<j;k++){
	%>
	<table width="100%" style="background-color:#000">
<tr class="tab">
<td width="10%"><input type="text" name="code" class="resized" readonly="yes" value="<%=code[k]%>" /></td>
<td width="10%"><select  name="date" id="d" class="resized" rowspan=2 colspan=2>
<option value="o">select the date</option>
<% 
for( int i=1;i<=31;i++)
{
	%>
	
	<option id=i value="<%=+i %>"><%=+i %></option>
	<% 
}
%>
</select></td>
<td width="10%"><select  name="mnth" id="m" class="resized" rowspan=2 colspan=2>
<option value="o">select the month</option>
<% 
for( int i=1;i<=12;i++)
{
	%>
	<option id=i value="<%=+i %>"><%=+i %></option>
	<% 
}
%>
</select></td>
<td width="10%"><select  name="year" id="y" class="resized" rowspan=2 colspan=2>
<option value="o">select the year</option>
<% 
for( int i=2010;i<=2020;i++)
{
	%>
	<option id=i value="<%=+i %>"><%=+i%></option>
	<% 
}
%>
</select></td>
</tr>
</table>
	
	<%
}
%>
<br />
<center>
<input type="submit" value=" Submit " style="background-color:#000; font-family:Times new roman; color:#fff; font-size:19px"/><br /><br />
</center>
</form>
<center>OK, image has been uploaded, please select exam details and click on "Submit" button..</center>
<%

}
	}
	else{
		out.println("Exam details already exists for the selected values.");
	}
}
catch(Exception e){
	out.println(e);
}
%>
<br />
</body>
</html>