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

public class UpdateDesignationServlet extends HttpServlet {

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setContentType("text/html");
        PrintWriter out = response.getWriter();

        String email = request.getParameter("email");
        String newDesignation = request.getParameter("designation");

        try {
            Class.forName("com.mysql.jdbc.Driver");
            Connection connection = DriverManager.getConnection("jdbc:mysql://localhost:3306/budget", "root", "root");
            String query = "UPDATE Employees SET designation = ? WHERE email = ?";
            PreparedStatement preparedStatement = connection.prepareStatement(query);
            preparedStatement.setString(1, newDesignation);
            preparedStatement.setString(2, email);

            int rowsAffected = preparedStatement.executeUpdate();

            if (rowsAffected > 0) {
                // Designation updated successfully
                response.sendRedirect("designation_updated.jsp");
            } else {
                // No rows updated, possibly due to incorrect email
                out.println("<h2>No employee found with the provided email</h2>");
            }
        } catch (Exception e) {
            e.printStackTrace();
            out.println("<h2>Error updating designation</h2>");
        }
    }
}
