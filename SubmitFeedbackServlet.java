package budget_project;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/SubmitFeedbackServlet")
public class SubmitFeedbackServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html");
        PrintWriter out = response.getWriter();

        // Retrieving form parameters
        String name = request.getParameter("name");
        String phone = request.getParameter("phone");
        String question1 = request.getParameter("question1");
        String question2 = request.getParameter("question2");
        String question3 = request.getParameter("question3");
        String comment = request.getParameter("comment");

        // Inserting data into the database
        try {
            Class.forName("com.mysql.jdbc.Driver");
            Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/budget", "root", "root");
            PreparedStatement ps = con.prepareStatement("INSERT INTO Feedback (name, phone, question1, question2, question3, comment) VALUES (?, ?, ?, ?, ?, ?)");
            ps.setString(1, name);
            ps.setString(2, phone);
            ps.setString(3, question1);
            ps.setString(4, question2);
            ps.setString(5, question3);
            ps.setString(6, comment);
            ps.executeUpdate();
            con.close();
            out.println("<h3>Thank you for your feedback!</h3>");
        } catch (Exception e) {
            out.println(e);
        }

        out.close();
    }
}
