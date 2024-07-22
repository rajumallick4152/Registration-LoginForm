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
Example Code:

Register Servlet:
package in.sp.backend;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.sql.DataSource;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/regForm")
public class Register extends HttpServlet {

    private DataSource dataSource;

    @Override
    public void init() throws ServletException {
        try {
            InitialContext ctx = new InitialContext();
            dataSource = (DataSource) ctx.lookup("java:comp/env/jdbc/YourDataSource");
        } catch (NamingException e) {
            throw new ServletException("Cannot retrieve java:comp/env/jdbc/YourDataSource", e);
        }
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        PrintWriter out = resp.getWriter();

        String myname = req.getParameter("name1");
        String myemail = req.getParameter("email1");
        String mypass = req.getParameter("pass1");
        String mygender = req.getParameter("gender1");
        String mycity = req.getParameter("city1");

        if (myname == null || myemail == null || mypass == null || mygender == null || mycity == null) {
            resp.setContentType("text/html");
            out.print("<h3 style='color:red'> All fields are required. </h3>");
            RequestDispatcher rd = req.getRequestDispatcher("/register.jsp");
            rd.include(req, resp);
            return;
        }

        try (Connection con = dataSource.getConnection();
                PreparedStatement ps = con.prepareStatement(
                        "INSERT INTO register (name, email, password, gender, city) VALUES (?, ?, ?, ?, ?)")) {
            
            ps.setString(1, myname);
            ps.setString(2, myemail);
            ps.setString(3, mypass);
            ps.setString(4, mygender);
            ps.setString(5, mycity);

            int count = ps.executeUpdate();
            resp.setContentType("text/html");
            if (count > 0) {
                out.print("<h3 style='color:green'> User Registered Successfully </h3>");
            } else {
                out.print("<h3 style='color:red'> User Not Registered Due to some error. </h3>");
            }
            RequestDispatcher rd = req.getRequestDispatcher("/register.jsp");
            rd.include(req, resp);

        } catch (SQLException e) {
            e.printStackTrace();
            resp.setContentType("text/html");
            out.print("<h3 style='color:red'> Database connection failed: " + e.getMessage() + "</h3>");
            RequestDispatcher rd = req.getRequestDispatcher("/register.jsp");
            rd.include(req, resp);
        }
    }
}


Conclusion:
This web application demonstrates a fundamental user management system using Java, JSP, Servlets, and JDBC with an Oracle database. It provides a foundation upon which more complex features and security measures can be built, such as password encryption, session management, and more advanced validation techniques.
