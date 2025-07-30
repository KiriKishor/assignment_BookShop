<%@ page import="java.util.*, dao.BookDAO, bean.BookBean" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Bookshop - Home</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background: #eef5f9;
            margin: 0;
            padding: 0;
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

        h1 {
            text-align: center;
            margin: 30px 0 20px;
        }

        .grid {
            display: flex;
            justify-content: center;
            gap: 30px;
            flex-wrap: wrap;
            padding-bottom: 30px;
        }

        .book-card {
            background: white;
            border-radius: 10px;
            width: 220px;
            box-shadow: 0 0 10px rgba(0,0,0,0.1);
            text-align: center;
            padding: 15px;
        }

        .book-card img {
            width: 100%;
            height: 270px;
            object-fit: cover;
            border-radius: 8px;
        }

        .book-name {
            font-weight: bold;
            margin: 10px 0;
        }

        .price {
            color: #007bff;
            font-size: 16px;
            margin-bottom: 10px;
        }

        .btn {
            background-color: #28a745;
            color: white;
            padding: 7px 15px;
            border: none;
            border-radius: 5px;
            cursor: pointer;
            text-decoration: none;
        }

        .btn:hover {
            background-color: #218838;
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

<h1>Welcome to the Bookshop</h1>

<div class="grid">
    <%
        BookDAO dao = new BookDAO();
        List<BookBean> books = dao.getAllBooks();

        for (BookBean book : books) {
    %>
        <form method="post" action="bill.jsp">
    <div class="book-card">
        <img src="<%= book.getImagePath() %>" alt="<%= book.getName() %>">
        <div class="book-name"><%= book.getName() %></div>
        <div><strong>Type:</strong> <%= book.getBookType() %></div>
        <div class="price">Rs. <%= book.getPrice() %></div>

        <input type="hidden" name="bookName" value="<%= book.getName() %>">
        <input type="hidden" name="price" value="<%= book.getPrice() %>">

        <label>Qty:</label>
        <input type="number" name="quantity" value="1" min="1" max="100" style="width: 60px;">

        <br><br>
        <button type="submit" class="btn">Buy</button>
    </div>
</form>


    <%
        }
    %>
</div>

</body>
</html>
