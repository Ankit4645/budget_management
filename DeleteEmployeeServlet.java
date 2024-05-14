package budget_project;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

public class DeleteEmployeeServlet extends HttpServlet {

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setContentType("text/html");
        PrintWriter out = response.getWriter();
        
        // Get email parameter from the request
        String email = request.getParameter("email");
        
        try {
            // Load JDBC driver
            Class.forName("com.mysql.jdbc.Driver");

            // Establish database connection
            Connection connection = DriverManager.getConnection("jdbc:mysql://localhost:3306/budget", "root", "root");

            // Prepare SQL statement to delete employee by email
            String sql = "DELETE FROM Employees WHERE email=?";
            PreparedStatement preparedStatement = connection.prepareStatement(sql);
            preparedStatement.setString(1, email);

            // Execute the delete statement
            int rowsDeleted = preparedStatement.executeUpdate();

            // Close resources
            preparedStatement.close();
            connection.close();

            if (rowsDeleted > 0) {
                out.println("<h2>Employee with email " + email + " deleted successfully.</h2>");
            } else {
                out.println("<h2>No employee found with email " + email + ".</h2>");
            }
        } catch (Exception e) {
            out.println("<h2>Error occurred: " + e.getMessage() + "</h2>");
            e.printStackTrace();
        }
    }
}
