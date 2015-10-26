import java.sql.*;
import java.io.*;
import javax.servlet.*;
import javax.servlet.http.*;

public class cimg extends HttpServlet{
	


   public void doGet(HttpServletRequest req, HttpServletResponse res)
   throws IOException , ServletException{
           handle(req , res);
    }


 public void handle(HttpServletRequest req, HttpServletResponse res)
  throws IOException , ServletException{

          PrintWriter out=res.getWriter();

String s1 = req.getParameter("id");
String path = "";

                    path = "D:\\workspace\\noticeboard\\WebContent\\images\\"+s1+".jpg";

                    File file=new File(path);

                    boolean exists = file.exists();

if(!exists)
{
out.println("no");
}
else
{
out.println("yes");
}
  }

}