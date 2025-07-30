<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Casher Dashboard</title>
    <style>
        body {
            margin: 0;
            font-family: Arial, sans-serif;
            background-color: #c9f0ff;
            display: flex;
            flex-direction: column;
            justify-content: center;
            align-items: center;
            height: 100vh;
        }

        h2 {
            font-size: 32px;
            margin-bottom: 40px;
            color: #333;
        }

        .button-container {
            display: flex;
            flex-direction: column;
            gap: 20px;
        }

        a {
            display: inline-block;
            width: 250px;
            text-align: center;
            padding: 15px 0;
            font-size: 18px;
            background-color: #007bff;
            color: white;
            text-decoration: none;
            border-radius: 8px;
            transition: background-color 0.3s ease;
        }

        a:hover {
            background-color: #0056b3;
        }
    </style>
</head>
<body>

    <h2>Welcome, Casher!</h2>

    <div class="button-container">
        <a href="addBook.jsp">Add Book</a>
        <a href="updateBooks.jsp">Update Books</a>
        <a href="viewUsers.jsp">View Users</a>
        <a href="adminLogin.jsp">Logout</a>
    </div>

</body>
</html>
