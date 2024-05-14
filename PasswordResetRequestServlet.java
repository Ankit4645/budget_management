package budget_project;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.util.UUID;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

public class PasswordResetRequestServlet extends HttpServlet {

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setContentType("text/html");
        PrintWriter out = response.getWriter();

        String email = request.getParameter("email");

        try {
            Class.forName("com.mysql.jdbc.Driver");
            Connection connection = DriverManager.getConnection("jdbc:mysql://localhost:3306/budget", "root", "root");

            // Generate a unique token
            String token = UUID.randomUUID().toString();

            // Store the token in the database along with the email and timestamp
            String query = "INSERT INTO PasswordResetTokens (email, token, timestamp) VALUES (?, ?, NOW())";
            PreparedStatement preparedStatement = connection.prepareStatement(query);
            preparedStatement.setString(1, email);
            preparedStatement.setString(2, token);
            preparedStatement.executeUpdate();

            // Send email with reset link containing the token
            // Implement email sending logic here

            out.println("<h2>Password reset link sent to your email</h2>");
        } catch (Exception e) {
            e.printStackTrace();
            out.println("<h2>Error processing request</h2>");
        }
    }
}
