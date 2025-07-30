<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    String bookName = request.getParameter("bookName");
    double price = Double.parseDouble(request.getParameter("price"));
    int quantity = Integer.parseInt(request.getParameter("quantity"));
    double total = price * quantity;

    String username = (session != null && session.getAttribute("username") != null) 
                      ? (String) session.getAttribute("username") 
                      : "Guest";
%>
<html>
<head>
    <title>Bill</title>
    <style>
        body { font-family: Arial; padding: 30px; background: #f4f4f4; }
        .bill-box {
            background: white;
            padding: 25px;
            width: 420px;
            margin: auto;
            box-shadow: 0 0 10px rgba(0,0,0,0.1);
            border-radius: 10px;
        }
        h2 { text-align: center; margin-bottom: 20px; }
        table { width: 100%; margin-top: 20px; }
        td { padding: 8px 0; }
        .total { font-weight: bold; }
        .actions {
            text-align: center;
            margin-top: 20px;
        }
        button, a.button {
            padding: 10px 20px;
            margin: 0 10px;
            border: none;
            border-radius: 5px;
            text-decoration: none;
            font-weight: bold;
            cursor: pointer;
        }
        button {
            background-color: #28a745;
            color: white;
        }
        a.button {
            background-color: #dc3545;
            color: white;
        }
    </style>
</head>
<body>
<div class="bill-box">
    <h2>Purchase Bill</h2>
    <form method="post" action="PurchaseServlet">
        <input type="hidden" name="bookName" value="<%= bookName %>">
        <input type="hidden" name="price" value="<%= price %>">
        <input type="hidden" name="quantity" value="<%= quantity %>">
        <input type="hidden" name="total" value="<%= total %>">
        <input type="hidden" name="username" value="<%= username %>">

        <table>
            <tr>
                <td>Customer:</td>
                <td><%= username %></td>
            </tr>
            <tr>
                <td>Book:</td>
                <td><%= bookName %></td>
            </tr>
            <tr>
                <td>Unit Price:</td>
                <td>Rs. <%= price %></td>
            </tr>
            <tr>
                <td>Quantity:</td>
                <td><%= quantity %></td>
            </tr>
            <tr class="total">
                <td>Total:</td>
                <td>Rs. <%= total %></td>
            </tr>
        </table>

        <div class="actions">
            <button type="submit">Purchase</button>
            <a href="home.jsp" class="button">Back</a>
        </div>
    </form>
</div>
</body>
</html>
