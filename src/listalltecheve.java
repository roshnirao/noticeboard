import java.sql.*;
import java.io.*;
import javax.servlet.*;
import javax.servlet.http.*;

public class listalltecheve extends HttpServlet{
	


   public void doGet(HttpServletRequest req, HttpServletResponse res)
   throws IOException , ServletException{
           handle(req , res);
    }


 public void handle(HttpServletRequest req, HttpServletResponse res)
  throws IOException , ServletException{

          PrintWriter out=res.getWriter();
          
          String s1 = req.getParameter("branch");
          String s2 = req.getParameter("year");
          String s3 = req.getParameter("cat");
         

         String del="~";
String str1="";
String str2="";
String sample="No events to display";
try{

Class.forName("sun.jdbc.odbc.JdbcOdbcDriver");

Connection con=DriverManager.getConnection("jdbc:odbc:rosh","root","root");



	Statement st=con.createStatement();
	ResultSet rs=st.executeQuery("select tname from technical where branch='"+s1+"' and year='"+s2+"' and cat='"+s3+"'");




while(rs.next())
		{
           str1=rs.getString("tname");
                                              
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