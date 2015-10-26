import java.sql.*;
import java.io.*;
import javax.servlet.*;
import javax.servlet.http.*;

public class exam extends HttpServlet{
	


   public void doGet(HttpServletRequest req, HttpServletResponse res)
   throws IOException , ServletException{
           handle(req , res);
    }


 public void handle(HttpServletRequest req, HttpServletResponse res)
  throws IOException , ServletException{

          PrintWriter out=res.getWriter();
          
          String branch = req.getParameter("branch");
          String sem = req.getParameter("sem");

         String del="`";
         String d="~";
         
String str1="";
String str2="";
String str3="";
String str4="";
String str0="";

try{

Class.forName("sun.jdbc.odbc.JdbcOdbcDriver");

Connection con=DriverManager.getConnection("jdbc:odbc:rosh","root","root");



	Statement st=con.createStatement();
	ResultSet rs=st.executeQuery("select * from exam where branch='"+branch+"' and sem='"+sem+"'");




while(rs.next())
		{
	
	str0=rs.getString("imgid");
           str1=rs.getString("sub");
                                              
           str2=str2+del+str1;
           
                       
           str3=rs.getString("date");
           
           str4=str4+del+str3;
           
                                  
           }

if(str2!=null && str2!=""){
String s1 = str2;
s1 = s1.substring(1);

String s2 = str4;
s2 = s2.substring(1);



String fin=str0+d+s1+d+s2;
out.println(fin);
}
else
{
out.println("error");

}
                        
}
catch(Exception e)
{
out.println(e);
}

  }

}