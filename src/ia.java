import java.sql.*;
import java.io.*;
import javax.servlet.*;
import javax.servlet.http.*;


public class ia extends HttpServlet{
	 String s=null;


   public void doGet(HttpServletRequest req, HttpServletResponse res)
   throws IOException , ServletException{
           handle(req , res);
    }


 public void handle(HttpServletRequest req, HttpServletResponse res)
  throws IOException , ServletException{



          PrintWriter out=res.getWriter();
         String s1 = req.getParameter("branch");
         String s2=req.getParameter("sem");
         String s3=req.getParameter("testno");
    String del="`";
    String imgid="";
    String d="";

try{         
Class.forName("sun.jdbc.odbc.JdbcOdbcDriver");
			Connection con=DriverManager.getConnection("jdbc:odbc:rosh","root","root");
			Statement st=con.createStatement();
			 ResultSet rs=st.executeQuery("select * from iainfo where branch='"+s1+"' and sem='"+s2+"' and testno='"+s3+"'");

                                        while(rs.next()){
                                        	imgid=rs.getString("imgid");
                            d=rs.getString("date");
                            
                                        }
                             if(imgid==null||imgid==""){
                            	out.println("error"); 
                             }
                             else{
                            	 String fin=imgid+del+d;
                            	   out.println(fin);
                             }
   
}

catch(Exception e)
{
out.println(e);
}


  }

}
