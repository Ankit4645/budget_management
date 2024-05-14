package budget_project;


import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

public class EmployeeServlet extends HttpServlet {

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setContentType("text/html");
        PrintWriter out = response.getWriter();

        String email = request.getParameter("email");
        String name = request.getParameter("name");
        String password = request.getParameter("password");
        String designation = request.getParameter("designation");
        double salary = Double.parseDouble(request.getParameter("salary"));
        double expenses = Double.parseDouble(request.getParameter("expenses"));

        Employee emp = new Employee();
        emp.setEmail(email);
        emp.setName(name);
        emp.setPassword(password);
        emp.setDesignation(designation);
        emp.setSalary(salary);
        emp.setExpenses(expenses);

        request.setAttribute("emp", emp);

        int result = 0;

        try {
            Class.forName("com.mysql.jdbc.Driver");
            Connection connection = DriverManager.getConnection("jdbc:mysql://localhost:3306/budget", "root", "root");
            String query = "INSERT INTO Employees (email, name, password, designation, salary, expenses) VALUES (?, ?, ?, ?, ?, ?)";
            PreparedStatement preparedStatement = connection.prepareStatement(query);
            preparedStatement.setString(1, emp.getEmail());
            preparedStatement.setString(2, emp.getName());
            preparedStatement.setString(3, emp.getPassword());
            preparedStatement.setString(4, emp.getDesignation());
            preparedStatement.setDouble(5, emp.getSalary());
            preparedStatement.setDouble(6, emp.getExpenses());
            result = preparedStatement.executeUpdate();
            RequestDispatcher rd = request.getRequestDispatcher("employeedetail.jsp");
            rd.forward(request, response);
        } catch (Exception e) {
            System.err.println(e);
        }
    }
}
