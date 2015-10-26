import java.sql.*;
import java.io.*;
import javax.servlet.*;
import javax.servlet.http.*;

public class updatestud extends HttpServlet{
	


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
         String s4 = req.getParameter("email");
         String s5 = req.getParameter("mob");

    

try{         
Class.forName("sun.jdbc.odbc.JdbcOdbcDriver");
Connection conn= DriverManager.getConnection("jdbc:odbc:rosh", "root", "root");
int updateQuery=0;
PreparedStatement ps;


String sql = "update student set pass='"+s2+"', name='"+s3+"', email='"+s4+"', mob='"+s5+"' where usn='"+s1+"'";
	ps = conn.prepareStatement(sql);
	updateQuery = ps.executeUpdate();

out.println("done");
}

catch(Exception e)
{
out.println(e);
}


  }

}
