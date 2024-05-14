package budget_project;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

public class ExpenseServlet extends HttpServlet {

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	    response.setContentType("text/html");
	    PrintWriter out = response.getWriter();

	    try {
	        Class.forName("com.mysql.jdbc.Driver");
	        Connection connection = DriverManager.getConnection("jdbc:mysql://localhost:3306/budget", "root", "root");
	        
	        String userEmail = request.getParameter("email"); // Get the email ID from request parameters
	        
	        String query;
	        PreparedStatement preparedStatement;
	        
	        // Check if email ID is provided
	        if (userEmail != null && !userEmail.isEmpty()) {
	            // Fetch data for the specific user
	            query = "SELECT * FROM Employees WHERE email = ?";
	            preparedStatement = connection.prepareStatement(query);
	            preparedStatement.setString(1, userEmail);
	        } else {
	            // Fetch data for all users
	            query = "SELECT * FROM Employees";
	            preparedStatement = connection.prepareStatement(query);
	        }
	        
	        ResultSet resultSet = preparedStatement.executeQuery();

	        ArrayList<Employee> employees = new ArrayList<>();

	        while (resultSet.next()) {
	            Employee employee = new Employee();
	            employee.setEmail(resultSet.getString("email"));
	            employee.setName(resultSet.getString("name"));
	            employee.setDesignation(resultSet.getString("designation"));
	            employee.setSalary(resultSet.getDouble("salary"));
	            employee.setExpenses(resultSet.getDouble("expenses"));
	            employees.add(employee);
	        }

	        // Set the 'employees' attribute in the request
	        request.setAttribute("employees", employees);
	        RequestDispatcher rd = request.getRequestDispatcher("expense.jsp");
	        rd.forward(request, response);
	    } catch (Exception e) {
	        e.printStackTrace();
	        out.println("<h2>Error processing request</h2>");
	    }
	}
}
