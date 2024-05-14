<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*, java.util.*" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Employee Details</title>
    <style>
        body {
             font-family: Arial, sans-serif;
            background-color: rgba(244, 244, 244, 0.5); /* Semi-transparent white background */
            background-image: url('background.jpg'); /* Add your background image */
            background-size: cover;
            background-position: center;
            background-repeat: no-repeat;
            margin: 0;
            padding: 0;
        }

        .container {
            width: 80%;
            margin: 20px auto;
        }

        h2 {
            text-align: center;
            margin-bottom: 20px;
            color: #333;
        }

        table {
            width: 100%;
            border-collapse: collapse;
            background-color: #fff;
            border-radius: 5px;
            overflow: hidden;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
        }

        th, td {
            padding: 10px;
            text-align: left;
            border-bottom: 1px solid #ddd;
        }

        th {
            background-color: #f2f2f2;
            color: #333;
        }

        tr:nth-child(even) {
            background-color: #f9f9f9;
        }
    </style>
</head>
<body>
    <div class="container">
        <h2>Employee Details</h2>
        <table>
            <thead>
                <tr>
                    <th>Email</th>
                    <th>Name</th>
                    <th>Designation</th>
                    <th>Salary</th>
                    <th>Expenses</th>
                </tr>
            </thead>
            <tbody>
                <% 
                    try {
                        // Establish connection
                        Class.forName("com.mysql.jdbc.Driver");
                        Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/budget", "root", "root");
                        
                        // Fetch data from database
                        Statement stmt = con.createStatement();
                        ResultSet rs = stmt.executeQuery("SELECT email, name, designation, salary, expenses FROM Employees");
                        
                        // Iterate through result set and populate table rows
                        while (rs.next()) {
                %>
                <tr>
                    <td><%= rs.getString("email") %></td>
                    <td><%= rs.getString("name") %></td>
                    <td><%= rs.getString("designation") %></td>
                  	 <td>$<%= rs.getDouble("salary") %></td>
                    <td>$<%= rs.getDouble("expenses") %></td>
                </tr>
                <%
                        }
                        
                        // Close connections
                        rs.close();
                        stmt.close();
                        con.close();
                    } catch (Exception e) {
                        e.printStackTrace();
                    }
                %>
            </tbody>
        </table>
    </div>
</body>
</html>
