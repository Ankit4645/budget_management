<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Budget Planner</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-image: url('images/register.jpg'); /* Adjust the path to your background image */
            background-size: cover;
            background-position: center;
            margin: 0;
            padding: 0;
        }

        .container {
            width: 50%;
            margin: 50px auto;
            background-color: rgba(255, 255, 255, 0.9);
            border-radius: 10px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
            padding: 30px;
        }

        h1 {
            text-align: center;
            margin-bottom: 30px;
            color: #333;
        }

        form {
            width: 100%;
            text-align: left;
        }

        label {
            font-weight: bold;
            display: block;
            margin-bottom: 10px;
            color: #555;
        }

        input[type="text"],
        input[type="password"] {
            width: 100%;
            padding: 10px;
            margin-bottom: 20px;
            border: 1px solid #ccc;
            border-radius: 5px;
            box-sizing: border-box;
        }

        input[type="submit"] {
            width: 100%;
            padding: 12px;
            border: none;
            background-color: #8b65ff;
            color: #fff;
            border-radius: 5px;
            cursor: pointer;
            font-size: 16px;
            transition: background-color 0.3s ease;
        }

        input[type="submit"]:hover {
            background-color: #6345b0;
        }
    </style>
</head>
<body>
    <div class="container">
        <h1>Budget Planner</h1>
        <form action="EmployeeServlet" method="post">
            <label>Email:</label>
            <input type="text" name="email">
            <label>Name:</label>
            <input type="text" name="name">
            <label>Password:</label>
            <input type="password" name="password">
            <label>Designation:</label>
            <input type="text" name="designation">
            <label>Salary:</label>
            <input type="text" name="salary">
            <label>Expenses:</label>
            <input type="text" name="expenses">
            <input type="submit" value="Submit">
        </form>
    </div>
</body>
</html>
