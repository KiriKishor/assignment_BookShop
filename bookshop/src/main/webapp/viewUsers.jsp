<%@ page import="java.util.*, dao.UserDAO, bean.UserBean" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>View Users</title>
    <style>
        body {
            font-family: Arial;
            background: #FFC9BF;
            padding: 20px;
        }
        h2 {
            text-align: center;
            margin-bottom: 30px;
        }
        .user-grid {
            display: flex;
            flex-wrap: wrap;
            justify-content: center;
            gap: 30px;
        }
        .user-box {
            background: white;
            padding: 25px;
            width: 400px;
            box-shadow: 0 0 10px rgba(0,0,0,0.1);
            border-radius: 10px;
            box-sizing: border-box;
        }
        label {
            display: block;
            margin-top: 12px;
            font-weight: bold;
        }
        input[type=text], input[type=email] {
            width: 100%;
            padding: 8px;
            margin-top: 5px;
            border: 1px solid #ccc;
            border-radius: 5px;
            background: #f5f5f5;
        }
        
        .top-buttons {
            display: flex;
            justify-content: flex-end;
            gap: 10px;
            padding: 10px 20px;
        }

        .top-buttons form {
            margin: 0;
        }

        .btn {
            background-color: #333;
            color: white;
            padding: 8px 16px;
            border: none;
            border-radius: 4px;
            cursor: pointer;
            font-size: 14px;
        }

        .btn:hover {
            background-color: #555;
        }
        
        
    </style>
</head>
<body>

<h2>All Registered Users</h2>

<!-- 🔘 Top Right Buttons -->
<div class="top-buttons">
    <form action="adminLogin.jsp">
        <button class="btn">Logout</button>
    </form>
    <button class="btn" onclick="history.back();">Back</button>
</div>
<br>
<div class="user-grid">
<%
    UserDAO dao = new UserDAO();
    List<UserBean> users = dao.getAllUsers();
    for (UserBean u : users) {
%>
    <div class="user-box">
        <label>Account Number:</label>
        <input type="text" value="PE <%= String.format("%04d", u.getAccountNumber()) %>" readonly>

        <label>Name:</label>
        <input type="text" value="<%= u.getName() %>" readonly>

        <label>Address:</label>
        <input type="text" value="<%= u.getAddress() %>" readonly>

        <label>Telephone:</label>
        <input type="text" value="<%= u.getTelephone() %>" readonly>

        <label>Email:</label>
        <input type="email" value="<%= u.getEmail() %>" readonly>
    </div>
<%
    }
%>
</div>

</body>
</html>
