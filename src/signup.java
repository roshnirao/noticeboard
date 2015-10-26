import java.sql.*;
import java.io.*;
import javax.servlet.*;
import javax.servlet.http.*;

public class signup extends HttpServlet{
	


   public void doGet(HttpServletRequest req, HttpServletResponse res)
   throws IOException , ServletException{
           handle(req , res);
    }


 public void handle(HttpServletRequest req, HttpServletResponse res)
  throws IOException , ServletException{

          PrintWriter out=res.getWriter();

         String s1 = req.getParameter("usn");
         String s2 = req.getParameter("pass");
         String s3 = req.getParameter("name");
         String s4 = req.getParameter("branch");
         String s5 = req.getParameter("email");
 String s6 = req.getParameter("mob");
 String s7="no";
    

try{         
Class.forName("sun.jdbc.odbc.JdbcOdbcDriver");
Connection conn= DriverManager.getConnection("jdbc:odbc:rosh", "root", "root");
int updateQuery=0;
PreparedStatement ps;

java.util.Date date = new java.util.Date();

ps=conn.prepareStatement("INSERT INTO student(usn,pass,name,branch,email,mob,studleft)VALUES(?,?,?,?,?,?,?)");
ps.setString(1,s1 );
ps.setString(2,s2 );
ps.setString(3,s3);
ps.setString(4,s4);
ps.setString(5,s5);
ps.setString(6,s6);
ps.setString(7,s7);

ps.executeUpdate();

String msgg="Student agenda mail service: USN : "+s1+" and Password : "+s2+",Thank you.";
String sub="Your Student Agenda account has been created..!!";
mail.sendmail(s5,sub,msgg);

out.println("done");
}

catch(Exception e)
{
out.println("wrong");
}


  }

}
