<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.io.*, java.sql.*" %>
<%@ page import="jakarta.servlet.*, jakarta.servlet.http.*" %>
<%@ page import="java.util.*" %>
<%@ page import="java.text.*" %>
<%@ page import="java.sql.DriverManager" %>

<%
    // Get designation parameter from the request
    String designation = request.getParameter("designation");

    // Initialize JDBC objects
    Connection connection = null;
    PreparedStatement preparedStatement = null;
    ResultSet resultSet = null;

    try {
        // Load JDBC driver
        Class.forName("com.mysql.jdbc.Driver");

        // Establish database connection
        connection = DriverManager.getConnection("jdbc:mysql://localhost:3306/budget", "root", "root");

        // Prepare SQL statement to select employees by designation
        String sql = "SELECT name, email, salary FROM Employees WHERE designation=?";
        preparedStatement = connection.prepareStatement(sql);
        preparedStatement.setString(1, designation);

        // Execute the query
        resultSet = preparedStatement.executeQuery();
%>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Employee Details</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            margin: 0;
            padding: 0;
            background-color: #f2f2f2;
        }
        .container {
            width: 80%;
            margin: 20px auto;
        }
        h2 {
            color: #333;
        }
        table {
            width: 100%;
            border-collapse: collapse;
        }
        th, td {
            padding: 10px;
            text-align: left;
            border-bottom: 1px solid #ddd;
        }
        th {
            background-color: #f2f2f2;
        }
    </style>
</head>
<body>
    <div class="container">
        <%
            // Check if any data is found for the given designation
            if (!resultSet.next()) {
        %>
            <h2>No employees found with designation: <%= designation %></h2>
        <%
            } else {
        %>
            <h2>Employees with Designation: <%= designation %></h2>
            <table border="1">
                <tr><th>Name</th><th>Email</th><th>Salary</th></tr>
                <%
                    // Iterate through the result set and generate table rows
                    do {
                %>
                        <tr>
                            <td><%= resultSet.getString("name") %></td>
                            <td><%= resultSet.getString("email") %></td>
                            <td><%= resultSet.getDouble("salary") %></td>
                        </tr>
                <%
                    } while (resultSet.next());
                %>
            </table>
        <%
            }
        %>
    </div>
</body>
</html>

<%
    // Close resources
    resultSet.close();
    preparedStatement.close();
    connection.close();
} catch (Exception e) {
    out.println("<h2>Error occurred: " + e.getMessage() + "</h2>");
    e.printStackTrace();
}
%>
