<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*, java.util.*" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Feedback Details</title>
    <style>
        body {
            background-color: rgba(0, 0, 0, 0.5); /* Semi-transparent black background */
        }

        .container {
            background-color: #ffffff; /* Opaque white background for the container */
            padding: 20px;
            border-radius: 10px;
            margin: 20px auto;
            width: 80%; /* Adjust width as needed */
        }

        table {
            width: 100%;
            border-collapse: collapse;
        }

        th, td {
            border: 1px solid #dddddd;
            text-align: left;
            padding: 8px;
        }

        th {
            background-color: #f2f2f2;
        }
    </style>
</head>
<body>
    <div class="container">
        <h2>Feedback Details</h2>
        <table>
            <tr>
                <th>ID</th>
                <th>Name</th>
                <th>Phone</th>
                <th>Question 1</th>
                <th>Question 2</th>
                <th>Question 3</th>
                <th>Comment</th>
            </tr>
            <% 
            try {
                Class.forName("com.mysql.jdbc.Driver");
                Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/budget", "root", "root");
                Statement stmt = con.createStatement();
                ResultSet rs = stmt.executeQuery("SELECT * FROM Feedback");

                while (rs.next()) {
                    int id = rs.getInt("id");
                    String name = rs.getString("name");
                    String phone = rs.getString("phone");
                    String question1 = rs.getString("question1");
                    String question2 = rs.getString("question2");
                    String question3 = rs.getString("question3");
                    String comment = rs.getString("comment");

                    out.println("<tr><td>" + id + "</td><td>" + name + "</td><td>" + phone + "</td><td>" + question1 + "</td><td>" + question2 + "</td><td>" + question3 + "</td><td>" + comment + "</td></tr>");
                }

                con.close();
            } catch (Exception e) {
                out.println(e);
            }
            %>
        </table>
    </div>
</body>
</html>
