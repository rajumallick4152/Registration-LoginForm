Web Application: User Registration and Login

Overview:
This web application provides a simple and secure user registration and login system. It allows users to register by providing their details, and subsequently log in using their registered email and password. The user's information is stored in an Oracle database, ensuring persistence and retrieval of data.

Technologies Used:

Java Servlets: Handle the backend logic for user registration and login.
JavaServer Pages (JSP): Serve as the view layer, providing a user-friendly interface for registration and login.
JDBC (Java Database Connectivity): Facilitate communication between the application and the Oracle database.
Oracle Database 19c: Store user information securely.
Functionality:

User Registration:

Form: A JSP page (register.jsp) contains a form where users input their details such as name, email, password, gender, and city.
Servlet: When the user submits the registration form, the Register servlet processes the request.
It retrieves the form data from the HTTP request.
Validates the input to ensure no fields are empty.
Establishes a connection to the Oracle database.
Executes an INSERT SQL query to store the user details in the register table.
Returns a success message if the operation is successful, or an error message if there is an issue (e.g., database connection failure).
User Login:

Form: A JSP page (login.jsp) contains a form where users input their registered email and password.
Servlet: When the user submits the login form, the Login servlet processes the request.
It retrieves the form data from the HTTP request.
Establishes a connection to the Oracle database.
Executes a SELECT SQL query to verify the email and password against the stored records in the register table.
If a match is found, the user is redirected to a welcome page (welcome.jsp) with their details.
If no match is found, an error message is displayed.
Database Schema:

Table Name: register
Columns:
name (VARCHAR)
email (VARCHAR) - Primary Key
password (VARCHAR)
gender (VARCHAR)
city (VARCHAR)
Servlets:

Register Servlet (Register.java):

Handles HTTP POST requests for user registration.
Validates and stores user details in the database.
Login Servlet (Login.java):

Handles HTTP POST requests for user login.
Validates user credentials against the database and manages the user session.

Conclusion:
This web application demonstrates a fundamental user management system using Java, JSP, Servlets, and JDBC with an Oracle database. It provides a foundation upon which more complex features and security measures can be built, such as password encryption, session management, and more advanced validation techniques.

Code:
----------
register.jsp
-------------
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Registration Form</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f2f2f2;
            margin: 0;
            padding: 0;
        }
        .container {
            max-width: 600px;
            margin: 50px auto;
            background-color: #fff;
            padding: 20px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
            border-radius: 8px;
        }
        h2 {
            text-align: center;
            color: #333;
        }
        .form-group {
            margin-bottom: 15px;
        }
        .form-group label {
            display: block;
            margin-bottom: 5px;
            color: #333;
        }
        .form-group input,
        .form-group select {
            width: 100%;
            padding: 10px;
            border: 1px solid #ccc;
            border-radius: 4px;
        }
        .form-group input[type="radio"] {
            width: auto;
            margin-right: 10px;
        }
        .form-group .radio-group {
            display: flex;
            align-items: center;
        }
        .form-group .radio-group label {
            margin-right: 20px;
        }
        .form-group select {
            padding: 8px;
        }
        .form-group input[type="submit"] {
            background-color: #4CAF50;
            color: #fff;
            border: none;
            cursor: pointer;
            padding: 12px;
            font-size: 16px;
            border-radius: 4px;
        }
        .form-group input[type="submit"]:hover {
            background-color: #45a049;
        }
    </style>
</head>
<body>
    <div class="container">
        <h2>Registration Form</h2>
        <form action="regForm" method="post">
            <div class="form-group">
                <label for="name">Name:</label>
                <input type="text" id="name" name="name1" required />
            </div>
            <div class="form-group">
                <label for="email">Email:</label>
                <input type="email" id="email" name="email1" required />
            </div>
            <div class="form-group">
                <label for="password">Password:</label>
                <input type="password" id="password" name="pass1" required />
            </div>
            <div class="form-group">
                <label>Gender:</label>
                <div class="radio-group">
                    <input type="radio" id="male" name="gender1" value="Male" required />
                    <label for="male">Male</label>
                    <input type="radio" id="female" name="gender1" value="Female" required />
                    <label for="female">Female</label>
                </div>
            </div>
            <div class="form-group">
                <label for="city">City:</label>
                <select id="city" name="city1" required>
                    <option value="">Select City</option>
                    <option value="Delhi">Delhi</option>
                    <option value="Mumbai">Mumbai</option>
                    <option value="Kolkata">Kolkata</option>
                    <option value="Bangalore">Bangalore</option>
                    <option value="Chennai">Chennai</option>
                    <option value="Hyderabad">Hyderabad</option>
                    <option value="Pune">Pune</option>
                    <option value="Ahmedabad">Ahmedabad</option>
                    <option value="Surat">Surat</option>
                    <option value="Jaipur">Jaipur</option>
                    <option value="Lucknow">Lucknow</option>
                    <option value="Kanpur">Kanpur</option>
                    <option value="Nagpur">Nagpur</option>
                    <option value="Indore">Indore</option>
                    <option value="Bhopal">Bhopal</option>
                    <option value="Patna">Patna</option>
                    <option value="Vadodara">Vadodara</option>
                    <option value="Vijayawada">Vijayawada</option>
                    <option value="Coimbatore">Coimbatore</option>
                    <option value="Mangalore">Mangalore</option>
                    <option value="Nashik">Nashik</option>
                    <option value="Amritsar">Amritsar</option>
                    <option value="Agra">Agra</option>
                    <option value="Thane">Thane</option>
                    <option value="Gurgaon">Gurgaon</option>
                    <option value="Noida">Noida</option>
                    <option value="Rajkot">Rajkot</option>
                    <option value="Jabalpur">Jabalpur</option>
                    <option value="Bhubaneswar">Bhubaneswar</option>
                    <option value="Dehradun">Dehradun</option>
                    <option value="Shimla">Shimla</option>
                    <option value="Shillong">Shillong</option>
                    <option value="Kochi">Kochi</option>
                    <option value="Trivandrum">Trivandrum</option>
                    <option value="Udaipur">Udaipur</option>
                    <option value="Aurangabad">Aurangabad</option>
                    <option value="Raipur">Raipur</option>
                    <option value="Gwalior">Gwalior</option>
                    <option value="Jodhpur">Jodhpur</option>
                    <option value="Kakinada">Kakinada</option>
                    <option value="Warangal">Warangal</option>
                    <option value="Ranchi">Ranchi</option>
                    <option value="Dhanbad">Dhanbad</option>
                    <option value="Bhilai">Bhilai</option>
                    <option value="Jamshedpur">Jamshedpur</option>
                    <option value="Siliguri">Siliguri</option>
                    <option value="Guwahati">Guwahati</option>
                </select>
            </div>
            <div class="form-group">
                <input type="submit" value="Register" />
            </div>
        </form>
    </div>
</body>
</html>
Register.java
----------------
package in.sp.backend;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/regForm")
public class Register extends HttpServlet {
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		PrintWriter out = resp.getWriter();

		String myname = req.getParameter("name1");
		String myemail = req.getParameter("email1");
		String mypass = req.getParameter("pass1");
		String mygender = req.getParameter("gender1");
		String mycity = req.getParameter("city1");

		Connection con = null;
		PreparedStatement ps = null;

		try {
			Class.forName("oracle.jdbc.driver.OracleDriver");
			con = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521/orclpdb", "hr", "123");

			ps = con.prepareStatement(
					"INSERT INTO register (name, email, password, gender, city) VALUES (?, ?, ?, ?, ?)");
			ps.setString(1, myname);
			ps.setString(2, myemail);
			ps.setString(3, mypass);
			ps.setString(4, mygender);
			ps.setString(5, mycity);

			int count = ps.executeUpdate();
			if (count > 0) {
				resp.setContentType("text/html");
				out.print("<h3 style='color:green'> User Registered Successfully </h3>");
				RequestDispatcher rd = req.getRequestDispatcher("/register.jsp");
				rd.include(req, resp);
			} else {
				resp.setContentType("text/html");
				out.print("<h3 style='color:red'> User Not Registered Due to some error. </h3>");
				RequestDispatcher rd = req.getRequestDispatcher("/register.jsp");
				rd.include(req, resp);
			}
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
			resp.setContentType("text/html");
			out.print("<h3 style='color:red'> Oracle JDBC Driver not found. </h3>");
			RequestDispatcher rd = req.getRequestDispatcher("/register.jsp");
			rd.include(req, resp);
		} catch (SQLException e) {
			e.printStackTrace();
			resp.setContentType("text/html");
			out.print("<h3 style='color:red'> Database connection failed: " + e.getMessage() + "</h3>");
			RequestDispatcher rd = req.getRequestDispatcher("/register.jsp");
			rd.include(req, resp);
		} finally {
			// Close resources
			try {
				if (ps != null)
					ps.close();
				if (con != null)
					con.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
	}
}
login.jsp
-----------
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Login Form</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f2f2f2;
            margin: 0;
            padding: 0;
        }
        .container {
            max-width: 400px;
            margin: 100px auto;
            background-color: #fff;
            padding: 20px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
            border-radius: 8px;
        }
        h2 {
            text-align: center;
            color: #333;
        }
        .form-group {
            margin-bottom: 15px;
        }
        .form-group label {
            display: block;
            margin-bottom: 5px;
            color: #333;
        }
        .form-group input {
            width: 100%;
            padding: 10px;
            border: 1px solid #ccc;
            border-radius: 4px;
        }
        .form-group input[type="submit"] {
            background-color: #4CAF50;
            color: #fff;
            border: none;
            cursor: pointer;
            padding: 12px;
            font-size: 16px;
            border-radius: 4px;
        }
        .form-group input[type="submit"]:hover {
            background-color: #45a049;
        }
    </style>
</head>
<body>
    <div class="container">
        <h2>Login Form</h2>
        <form action="LoginForm" method="post">
            <div class="form-group">
                <label for="email">Email:</label>
                <input type="text" id="email" name="email" required />
            </div>
            <div class="form-group">
                <label for="password">Password:</label>
                <input type="password" id="password" name="pass1" required />
            </div>
            <div class="form-group">
                <input type="submit" value="Login" />
            </div>
        </form>
    </div>
</body>
</html>
Login.java
-----------
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
profile.jsp
-------------
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Welcome</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f2f2f2;
            margin: 0;
            padding: 0;
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
        }
        .container {
            background-color: #fff;
            padding: 20px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
            border-radius: 8px;
            text-align: center;
        }
        h3 {
            color: #333;
        }
    </style>
</head>
<body>
    <div class="container">
        <h3>Welcome : ${session_name}</h3>
    </div>
</body>
</html>

