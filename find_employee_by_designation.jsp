<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Find Employees by Designation</title>
    <style>
        /* Add custom styles */
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
            max-width: 600px;
            margin: 0 auto;
            padding: 20px;
            background-color: #fff;
            border-radius: 5px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
        }
        .input-group {
            margin-bottom: 20px;
        }
        .input-group label {
            display: block;
            font-weight: bold;
            margin-bottom: 5px;
        }
        .input-group select {
            width: 100%;
            padding: 10px;
            border: 1px solid #ccc;
            border-radius: 5px;
        }
        .button {
            background-color: #4caf50;
            color: white;
            padding: 10px 20px;
            border: none;
            border-radius: 5px;
            cursor: pointer;
            font-size: 16px;
        }
        .button:hover {
            background-color: #45a049;
        }
    </style>
</head>
<body>
    <div class="container">
        <h2>Find Employees by Designation</h2>
        <form action="FindEmployeeByDesignation.jsp" method="get">
            <div class="input-group">
                <label for="designation">Select Designation:</label>
                <select id="designation" name="designation">
                    <option value="Emp">Employee</option>
                    <option value="CEO">CEO</option>
                    <option value="CFO">CFO</option>
                    <option value="HR">HR</option>
                    <option value="SHR">SHR</option>
                    <option value="Team Leader">Team Leader</option>
                    <option value="Project Director">Project Director</option>
                    <option value="Data Analyst">Data Analyst</option>
                </select>
            </div>
            <button type="submit" class="button">Find Employees</button>
        </form>
    </div>
</body>
</html>
