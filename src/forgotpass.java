import java.sql.*;
import java.io.*;
import javax.servlet.*;
import javax.servlet.http.*;


public class forgotpass extends HttpServlet{
	 String s=null;


   public void doGet(HttpServletRequest req, HttpServletResponse res)
   throws IOException , ServletException{
           handle(req , res);
    }


 public void handle(HttpServletRequest req, HttpServletResponse res)
  throws IOException , ServletException{



          PrintWriter out=res.getWriter();
         String s1 = req.getParameter("acc");
String s2 = req.getParameter("lin");
        
   
try{         
Class.forName("sun.jdbc.odbc.JdbcOdbcDriver");
			Connection con=DriverManager.getConnection("jdbc:odbc:rosh","root","root");
			Statement st=con.createStatement();
			 ResultSet rs=st.executeQuery("select * from student where usn='"+s1+"'");

                                        rs.next();
String s=rs.getString("email");
String msgg="Please visit the link : "+s2+" to reset your Notice Board account password, Thank you.";
String sub="Link to reset your Notice Board account password..!!";
mail.sendmail(s,sub,msgg);

out.println("done");
}

catch(Exception e)
{
out.println("acc does not exist");
}


  }

}
