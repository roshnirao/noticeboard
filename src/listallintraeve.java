import java.sql.*;
import java.io.*;
import javax.servlet.*;
import javax.servlet.http.*;

public class listallintraeve extends HttpServlet{
	


   public void doGet(HttpServletRequest req, HttpServletResponse res)
   throws IOException , ServletException{
           handle(req , res);
    }


 public void handle(HttpServletRequest req, HttpServletResponse res)
  throws IOException , ServletException{

          PrintWriter out=res.getWriter();
          
          String s1 = req.getParameter("cat");
         

         String del="~";
String str1="";
String str2="";
String sample="No events to display";
try{

Class.forName("sun.jdbc.odbc.JdbcOdbcDriver");

Connection con=DriverManager.getConnection("jdbc:odbc:rosh","root","root");



	Statement st=con.createStatement();
	ResultSet rs=st.executeQuery("select ename from incoll where cat='"+s1+"'");




while(rs.next())
		{
           str1=rs.getString("ename");
                                              
           str2=str2+del+str1;
                                             
                                          
           }

if(str2!=null && str2!=""){
String s = str2;
s = s.substring(1);
out.println(s);
}
else
{
out.println(sample);

}
                        
}
catch(Exception e)
{
out.println(e);
}

  }

}