package in.sp.backend;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebServlet("/LoginForm")
public class Login extends HttpServlet
{
@Override
protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException
{  
	PrintWriter out = resp.getWriter();
	resp.setContentType("text/html");
	String myemail = req.getParameter("email");
	String mypass = req.getParameter("pass1");
	try 
	{
		Class.forName("oracle.jdbc.driver.OracleDriver");
		Connection con = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521/orclpdb", "hr", "123");
		
		PreparedStatement ps = con.prepareStatement("Select * from register where email=? and password=?");
		ps.setString(1, myemail);
		ps.setString(2, mypass);
		ResultSet rs = ps.executeQuery();
		if (rs.next())
		{
			HttpSession session = req.getSession();
			session.setAttribute("session_name", rs.getString("name"));
			RequestDispatcher rd = req.getRequestDispatcher("/profile.jsp");
			rd.include(req, resp);
		}
		else
		{  
			
		    out.print("<h3 style='color:red'>Email Id And Password Dindn't Matched</h3>");
			RequestDispatcher rd = req.getRequestDispatcher("/login.jsp");
			rd.include(req, resp);
		}
	} 
	catch (Exception e)
	{
		e.printStackTrace();
		
	    out.print("<h3 style='color:red'>" +e.getMessage()+"</h3>");
		RequestDispatcher rd = req.getRequestDispatcher("/login.jsp");
		rd.include(req, resp);
	}
}
}
