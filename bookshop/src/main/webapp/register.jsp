<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Register</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background: linear-gradient(to right, #74ebd5, #acb6e5);
            margin: 0;
            padding: 0;
        }

        .container {
            width: 400px;
            margin: 60px auto;
            background-color: white;
            padding: 30px 40px;
            border-radius: 15px;
            box-shadow: 0 4px 20px rgba(0, 0, 0, 0.2);
        }

        h2 {
            text-align: center;
            margin-bottom: 25px;
            color: #333;
        }

        label {
            display: block;
            margin-bottom: 8px;
            font-weight: bold;
        }

        input[type="text"],
        input[type="password"],
        input[type="email"] {
            width: 100%;
            padding: 10px;
            margin-bottom: 18px;
            border: 1px solid #ccc;
            border-radius: 8px;
        }

        input[type="submit"] {
            width: 100%;
            padding: 12px;
            background-color: #4CAF50;
            color: white;
            font-size: 16px;
            border: none;
            border-radius: 8px;
            cursor: pointer;
        }

        input[type="submit"]:hover {
            background-color: #45a049;
        }

        .message {
            text-align: center;
            margin-bottom: 15px;
        }

        .message font {
            font-size: 14px;
        }

        .login-link {
            text-align: center;
            margin-top: 15px;
        }

        .login-link a {
            color: #3333cc;
            text-decoration: none;
            font-weight: bold;
        }

        .login-link a:hover {
            text-decoration: underline;
        }
    </style>
</head>
<body>

<div class="container">
    <h2>Register</h2>

    <div class="message">
        <font color="red">${error}</font><br>
        <font color="green">${message}</font>
    </div>

    <form action="${pageContext.request.contextPath}/RegisterServlet" method="post">
        <label for="name">Name:</label>
        <input type="text" name="name" required>

        <label for="password">Password:</label>
        <input type="password" name="password" required>

        <label for="address">Address:</label>
        <input type="text" name="address" required>

        <label for="telephone">Telephone:</label>
        <input type="text" name="telephone" required>

        <label for="email">Email:</label>
        <input type="email" name="email" required>

        <input type="submit" value="Register">
    </form>

    <div class="login-link">
        <p>If you already registered, please <a href="index.jsp">login</a>.</p>
    </div>
</div>

</body>
</html>
