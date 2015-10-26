import java.sql.*;
import java.io.*;
import javax.servlet.*;
import javax.servlet.http.*;


public class retstud extends HttpServlet{
	 String s=null;


   public void doGet(HttpServletRequest req, HttpServletResponse res)
   throws IOException , ServletException{
           handle(req , res);
    }


 public void handle(HttpServletRequest req, HttpServletResponse res)
  throws IOException , ServletException{



          PrintWriter out=res.getWriter();
         String s1 = req.getParameter("usn");
         
    
String pass=null,name=null,email=null,mob=null;
String fin=null;
try{         
Class.forName("sun.jdbc.odbc.JdbcOdbcDriver");
			Connection con=DriverManager.getConnection("jdbc:odbc:rosh","root","root");
			Statement st=con.createStatement();
			 ResultSet rs=st.executeQuery("select * from student where usn='"+s1+"'");

rs.next();
pass=rs.getString("pass");
name=rs.getString("name");
email=rs.getString("email");
mob=rs.getString("mob");

fin=pass+"~"+name+"~"+email+"~"+mob;
out.println(fin);
}

catch(Exception e)
{
out.println("wrong");
}


  }

}
