<%@ page import="dao.ProfileDAO, bean.ProfileBean" %>
<%@ page import="dao.ProfileDAO, bean.ProfileBean" %>
<%
    String name = (String) session.getAttribute("username");
    if (name == null) {
        response.sendRedirect("index.jsp"); // force login
        return;
    }

    ProfileDAO dao = new ProfileDAO();
    ProfileBean user = dao.getProfile(name);
    if (user == null) {
        out.println("<h3 style='color:red;'>User profile not found.</h3>");
        return;
    }
%>

<html>
<head>
    <title>Edit Profile</title>
    <style>
        body { font-family: Arial; background: #f4f4f4; padding: 0px; margin: 0; }
        .container {
            background: white;
            padding: 25px;
            width: 400px;
            margin: auto;
            box-shadow: 0 0 10px rgba(0,0,0,0.1);
        }
        h2 { text-align: center; }
        label { display: block; margin-top: 10px; }
        input[type=text], input[type=password], input[type=email] {
            width: 100%;
            padding: 8px;
            margin-top: 5px;
        }
        input[type=submit] {
            margin-top: 20px;
            width: 100%;
            padding: 10px;
            background: #28a745;
            color: white;
            border: none;
            font-size: 16px;
        }
        
        .navbar {
            background-color: #333;
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
            background-color: #575757;
        }
        
    </style>
</head>
<body>


<div class="navbar">
    <a href="home.jsp">Home</a>
    <a href="purchased.jsp">Purchased</a>
    <a href="help.jsp">Help</a>
    <a href="profile.jsp">Profile</a>
    <a href="logout.jsp">Logout</a>
</div>
<br><br><br>
<div class="container">
    <h2>Edit Your Profile</h2>
    <form action="UpdateProfileServlet" method="post">
        <label>Account Number:</label>
        <input type="text" value="PE <%= String.format("%04d", user.getAccountNumber()) %>" readonly>

        <label>Name:</label>
        <input type="text" value="<%= user.getName() %>" readonly>

        <label>New Password:</label>
        <input type="password" name="password" required>

        <label>Address:</label>
        <input type="text" name="address" value="<%= user.getAddress() %>" required>

        <label>Telephone:</label>
        <input type="text" name="telephone" value="<%= user.getTelephone() %>" required>

        <label>Email:</label>
        <input type="email" name="email" value="<%= user.getEmail() %>" required>

        <input type="submit" value="Save Changes">
    </form>
</div>

</body>
</html>
