import java.sql.*;
import java.io.*;
import javax.servlet.*;
import javax.servlet.http.*;

public class feed extends HttpServlet{
	


   public void doGet(HttpServletRequest req, HttpServletResponse res)
   throws IOException , ServletException{
           handle(req , res);
    }


 public void handle(HttpServletRequest req, HttpServletResponse res)
  throws IOException , ServletException{

          PrintWriter out=res.getWriter();

         String s1 = req.getParameter("b");
         String s2 = req.getParameter("s");
         String s3 = req.getParameter("i");
         

try{         
Class.forName("sun.jdbc.odbc.JdbcOdbcDriver");
Connection conn= DriverManager.getConnection("jdbc:odbc:rosh", "root", "root");
int updateQuery=0;
PreparedStatement ps;

ps=conn.prepareStatement("INSERT INTO feedback(branch,subject,info)VALUES(?,?,?)");
ps.setString(1,s1 );
ps.setString(2,s2 );
ps.setString(3,s3);
ps.executeUpdate();

out.println("done");
}

catch(Exception e)
{
out.println("wrong");
}


  }

}
