<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Employee Expenses</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-image: url('images/background.jpg'); /* Adjust the path to your image */
            background-size: cover;
            background-position: center;
            background-attachment: fixed;
            margin: 0;
            padding: 0;
        }

        .container {
            text-align: center;
            margin-top: 50px;
            color: #fff;
            background-color: rgba(0, 0, 0, 0.8); /* Darker transparent black background */
            padding: 20px;
            border-radius: 10px;
            box-shadow: 0 0 20px rgba(0, 0, 0, 0.3);
            max-width: 800px;
            margin: 50px auto;
        }

        h2 {
            font-size: 24px;
            margin-bottom: 20px;
        }

        form {
            margin-bottom: 20px;
        }

        label {
            display: block;
            margin-bottom: 10px;
            color: #fff;
        }

        input[type="text"] {
            width: 200px;
            padding: 10px;
            margin-bottom: 10px;
            border-radius: 5px;
            border: 1px solid #ccc;
        }

        input[type="submit"] {
            padding: 10px 20px;
            border: none;
            background-color: #8b65ff;
            color: #fff;
            border-radius: 5px;
            cursor: pointer;
        }

        input[type="submit"]:hover {
            background-color: #6345b0;
        }

        table {
            width: 100%;
            margin-bottom: 20px;
            border-collapse: collapse;
        }

        th, td {
            padding: 10px;
            border: 1px solid #fff;
            color: #fff;
        }

        th {
            background-color: #8b65ff;
        }

        td {
            background-color: #6345b0;
        }

        .remaining-amount {
            color: #fff;
            font-weight: bold;
        }

        .less-than-25 {
            color: red;
        }
    </style>
</head>
<body>
    <div class="container">
        <h2>Employee Expenses</h2>
        
        <form action="ExpenseServlet" method="get">
            <label for="email">Enter Email ID:</label>
            <input type="text" id="email" name="email">
            <input type="submit" value="Search">
        </form>
        
        <h3>Search Results:</h3>
        <table>
            <tr>
                <th>Name</th>
                <th>Designation</th>
                <th>Salary</th>
                <th>Expenses</th>
                <th>Remaining Amount</th>
                <th>Percentage</th>
            </tr>
            <!-- Loop through employees data and display -->
            <% 
            java.util.ArrayList<budget_project.Employee> employees = (java.util.ArrayList<budget_project.Employee>) request.getAttribute("employees");
            if (employees != null && !employees.isEmpty()) {
                for (budget_project.Employee employee : employees) {
                    double remainingAmount = (employee.getSalary() - employee.getExpenses());
                    double remainingPercentage = (remainingAmount / employee.getSalary()) * 100;
            %>
            <tr>
                <td><%= employee.getName() %></td>
                <td><%= employee.getDesignation() %></td>
                <td><%= employee.getSalary() %></td>
                <td><%= employee.getExpenses() %></td>
                <td class="remaining-amount"><%= remainingAmount %></td>
                <td <% if (remainingPercentage < 25) { %>class="less-than-25"<% } %>>
                    <% if (remainingPercentage < 25) { %>Less than 25%<% } else { %>More than 25%<% } %>
                </td>
            </tr>
            <% 
                } // end of for loop
            } else { %>
                <tr><td colspan="6">No data found</td></tr>
            <% } %>
        </table>
    </div>
</body>
</html>
