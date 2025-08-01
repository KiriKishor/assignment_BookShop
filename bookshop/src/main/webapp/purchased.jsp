<%@ page import="java.util.*, dao.BookDAO" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.util.*, dao.PurchasedDAO" %>
<%
    String username = (session != null && session.getAttribute("username") != null) 
                      ? (String) session.getAttribute("username") 
                      : "Guest";

    PurchasedDAO dao = new PurchasedDAO();
    List<Map<String, Object>> purchases = dao.getPurchasedBooks(username);
%>

<html>
<head>
    <title>Purchased Items</title>
    <style>
        body { font-family: Arial; margin: 0;
            padding: 0; background: #eef5f9; }
        table {
            width: 90%;
            margin: auto;
            border-collapse: collapse;
            background: white;
            box-shadow: 0 0 10px rgba(0,0,0,0.1);
        }
        th, td {
            padding: 12px;
            border-bottom: 1px solid #ddd;
            text-align: center;
        }
        th {
            background-color: #007bff;
            color: white;
        }
        h2 {
            text-align: center;
            margin-bottom: 30px;
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

<!-- ✅ Navbar -->
<div class="navbar">
    <a href="home.jsp">Home</a>
    <a href="purchased.jsp">Purchased</a>
    <a href="help.jsp">Help</a>
    <a href="profile.jsp">Profile</a>
    <a href="logout.jsp">Logout</a>
</div>


<h2>Your Purchase History</h2>

<table>
    <tr>
        <th>Book</th>
        <th>Unit Price</th>
        <th>Quantity</th>
        <th>Total</th>
    </tr>
    <%
        for (Map<String, Object> row : purchases) {
    %>
    <tr>
        <td><%= row.get("book_name") %></td>
        <td>Rs. <%= row.get("unit_price") %></td>
        <td><%= row.get("quantity") %></td>
        <td>Rs. <%= row.get("total_price") %></td>
    </tr>
    <%
        }
        if (purchases.isEmpty()) {
    %>
    <tr>
        <td colspan="4">No purchases yet.</td>
    </tr>
    <%
        }
    %>
</table>

</body>
</html>
