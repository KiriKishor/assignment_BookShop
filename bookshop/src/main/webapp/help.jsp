<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Help - Bookshop System</title>
    <style>
        body {
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            background: #f8f9fa;
            margin: 0;
            padding: 0;
        }
        .navbar {
            background-color: #343a40;
            overflow: hidden;
            padding: 10px 20px;
        }
        .navbar a {
            float: left;
            color: white;
            text-align: center;
            padding: 12px 16px;
            text-decoration: none;
            font-size: 16px;
        }
        .navbar a:hover {
            background-color: #495057;
        }
        .container {
            max-width: 900px;
            margin: 40px auto;
            background: white;
            padding: 30px;
            box-shadow: 0 0 10px rgba(0,0,0,0.1);
        }
        h1 {
            text-align: center;
            color: #343a40;
        }
        h2 {
            color: #007bff;
            margin-top: 30px;
        }
        p {
            font-size: 15px;
            line-height: 1.6;
            color: #333;
        }
    </style>
</head>
<body>

<div class="navbar">
    <a href="home.jsp">Home</a>
    <a href="help.jsp">Help</a>
    <a href="profile.jsp">Profile</a>
    <a href="logout.jsp">Logout</a>
</div>

<div class="container">
    <h1>Help & User Guide</h1>

    <h2>1. Register</h2>
    <p>Users can register by entering their name, password (min 8 characters), address, 10-digit telephone number, and email. The system will automatically generate a unique account number like PE0001.</p>

    <h2>2. Login</h2>
    <p>Use your registered name and password to log in. If the credentials are valid, you'll be redirected to the home page.</p>

    <h2>3. View Book Details</h2>
    <p>The home page displays available books with name, price, type (e.g., school book), and image. You can increase/decrease quantity and click "Buy".</p>

    <h2>4. Buy Books</h2>
    <p>After clicking "Buy", a bill is generated with selected book details and quantity. You can click "Purchase" to confirm the order.</p>

    <h2>5. View Purchased List</h2>
    <p>All your purchase records are shown in the "Purchased" page, including book name, quantity, total cost, and purchase date.</p>

    <h2>6. Update Profile</h2>
    <p>Users can update their address, telephone, email, and password from the profile page. Account number and username cannot be changed.</p>

    <h2>7. Logout</h2>
    <p>Click "Logout" to securely exit the system. Your data remains saved for next login.</p>
</div>

</body>
</html>
