import java.sql.*;
import java.io.*;
import javax.servlet.*;
import javax.servlet.http.*;

public class intraevedet extends HttpServlet{
	


   public void doGet(HttpServletRequest req, HttpServletResponse res)
   throws IOException , ServletException{
           handle(req , res);
    }


 public void handle(HttpServletRequest req, HttpServletResponse res)
  throws IOException , ServletException{

          PrintWriter out=res.getWriter();
          
          String s1 = req.getParameter("ename");
         

         String d="~";
String imgid=null,einfo=null,edate=null;
try{

Class.forName("sun.jdbc.odbc.JdbcOdbcDriver");

Connection con=DriverManager.getConnection("jdbc:odbc:rosh","root","root");



	Statement st=con.createStatement();
	ResultSet rs=st.executeQuery("select * from incoll where ename='"+s1+"'");




while(rs.next())
		{
           imgid=rs.getString("imgid");
           einfo=rs.getString("einfo");
           edate=rs.getString("edate");                             
           }

String fin=imgid+d+einfo+d+edate;
out.println(fin);


                        
}
catch(Exception e)
{
out.println(e);
}

  }

}