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

public class SalaryUpdateServlet extends HttpServlet {

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setContentType("text/html");
        PrintWriter out = response.getWriter();

        String email = request.getParameter("email");
        double salary = Double.parseDouble(request.getParameter("salary"));

        try {
            Class.forName("com.mysql.jdbc.Driver");
            Connection connection = DriverManager.getConnection("jdbc:mysql://localhost:3306/budget", "root", "root");
            String query = "UPDATE Employees SET salary = ? WHERE email = ?";
            PreparedStatement preparedStatement = connection.prepareStatement(query);
            preparedStatement.setDouble(1, salary);
            preparedStatement.setString(2, email);

            int rowsAffected = preparedStatement.executeUpdate();

            if (rowsAffected > 0) {
                // Salary updated successfully
                response.sendRedirect("salary_updated.jsp");
            } else {
                // No rows updated, possibly due to incorrect email
                out.println("<h2>No employee found with the provided email</h2>");
            }
        } catch (Exception e) {
            e.printStackTrace();
            out.println("<h2>Error updating salary</h2>");
        }
    }
}
