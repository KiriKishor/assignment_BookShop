<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Admin / Casher Login</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background: #eef5f9;
        }
        .container {
            width: 300px;
            margin: 100px auto;
            background: white;
            padding: 25px;
            border-radius: 8px;
            box-shadow: 0 0 10px rgba(0,0,0,0.1);
        }
        h2 { text-align: center; }
        input, button {
            width: 100%;
            padding: 10px;
            margin-top: 10px;
        }
        .error { color: red; text-align: center; }
    </style>
</head>
<body>
<div class="container">
    <h2>Admin / Casher Login</h2>
    <form action="AdminLoginServlet" method="post">
        <input type="text" name="name" placeholder="Enter name" required>
        <input type="password" name="password" placeholder="Enter password" required>
        <button type="submit">Login</button>
    </form>
    <div class="error">${error}</div>
</div>
</body>
</html>
