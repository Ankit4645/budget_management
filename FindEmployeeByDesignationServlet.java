package budget_project;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/FindEmployeeByDesignationServlet")
public class FindEmployeeByDesignationServlet extends HttpServlet {

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setContentType("text/html");
        PrintWriter out = response.getWriter();

        // Get designation parameter from the request
        String designation = request.getParameter("designation");

        try {
            // Load JDBC driver
            Class.forName("com.mysql.jdbc.Driver");

            // Establish database connection
            Connection connection = DriverManager.getConnection("jdbc:mysql://localhost:3306/budget", "root", "root");

            // Prepare SQL statement to select employees by designation
            String sql = "SELECT name, email, salary FROM Employees WHERE designation=?";
            PreparedStatement preparedStatement = connection.prepareStatement(sql);
            preparedStatement.setString(1, designation);

            // Execute the query
            ResultSet resultSet = preparedStatement.executeQuery();

            // Generate HTML response
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<meta charset=\"UTF-8\">");
            out.println("<meta name=\"viewport\" content=\"width=device-width, initial-scale=1.0\">");
            out.println("<title>Employee Details</title>");
            out.println("</head>");
            out.println("<body>");

            // Check if any data is found for the given designation
            if (!resultSet.next()) {
                out.println("<h2>No employees found with designation: " + designation + "</h2>");
            } else {
                out.println("<h2>Employees with Designation: " + designation + "</h2>");
                out.println("<table border=\"1\">");
                out.println("<tr><th>Name</th><th>Email</th><th>Salary</th></tr>");

                // Reset the result set cursor
                resultSet.beforeFirst();

                // Iterate through the result set and generate table rows
                while (resultSet.next()) {
                    out.println("<tr>");
                    out.println("<td>" + resultSet.getString("name") + "</td>");
                    out.println("<td>" + resultSet.getString("email") + "</td>");
                    out.println("<td>" + resultSet.getDouble("salary") + "</td>");
                    out.println("</tr>");
                }

                out.println("</table>");
            }

            out.println("</body>");
            out.println("</html>");

            // Close resources
            resultSet.close();
            preparedStatement.close();
            connection.close();

        } catch (Exception e) {
            out.println("<h2>Error occurred: " + e.getMessage() + "</h2>");
            e.printStackTrace();
        }
    }
}
