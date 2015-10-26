import java.sql.*;
import java.io.*;
import javax.servlet.*;
import javax.servlet.http.*;


public class login extends HttpServlet{
	 String s=null;


   public void doGet(HttpServletRequest req, HttpServletResponse res)
   throws IOException , ServletException{
           handle(req , res);
    }


 public void handle(HttpServletRequest req, HttpServletResponse res)
  throws IOException , ServletException{



          PrintWriter out=res.getWriter();
         String s1 = req.getParameter("acc");
         String pass=req.getParameter("pa");
    

try{         
Class.forName("sun.jdbc.odbc.JdbcOdbcDriver");
			Connection con=DriverManager.getConnection("jdbc:odbc:rosh","root","root");
			Statement st=con.createStatement();
			 ResultSet rs=st.executeQuery("select * from student where usn='"+s1+"'");

                                        rs.next();
String s=rs.getString(2);//password
if(s.equals(pass))
{
out.println("done");
}
else{
out.println("wrong");
}
}

catch(Exception e)
{
out.println("acc does not exist");
}


  }

}
