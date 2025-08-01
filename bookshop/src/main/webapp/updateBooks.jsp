<%@ page import="java.util.*, dao.BookDAO, bean.BookBean" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    String role = (String) session.getAttribute("role"); // 'admin' or 'casher'
    BookDAO dao = new BookDAO();
    List<BookBean> books = dao.getAllBooks();
%>
<html>
<head>
    <title>Update Books</title>
    <style>
        body { font-family: Arial; padding: 30px; background: #FFC9BF; }
        table {
            width: 90%;
            margin: auto;
            border-collapse: collapse;
            background: white;
        }
        th, td {
            padding: 12px;
            border-bottom: 1px solid #ddd;
            text-align: center;
        }
        th { background-color: #007bff; color: white; }
        input[type="text"], input[type="number"] {
            width: 90%;
            padding: 5px;
        }
        select { padding: 5px; }
        button {
            background: #28a745;
            color: white;
            padding: 6px 12px;
            border: none;
            border-radius: 4px;
            cursor: pointer;
        }
        .delete-link {
            color: red;
            margin-left: 10px;
            text-decoration: none;
            font-weight: bold;
        }
        .delete-link:hover {
            text-decoration: underline;
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
<h2 style="text-align:center;">Update Book Details</h2>


<div class="top-buttons">
    <form action="adminLogin.jsp">
        <button class="btn">Logout</button>
    </form>
    <button class="btn" onclick="history.back();">Back</button>
</div>
<br>

<form action="UpdateBookServlet" method="post">
    <table>
        <tr>
            <th>ID</th>
            <th>Book Name</th>
            <th>Price</th>
            <th>Book Type</th>
            <th>Action</th>
        </tr>
        <%
            for (BookBean book : books) {
        %>
        <tr>
            <td><%= book.getId() %></td>
            <td>
                <input type="text" name="name_<%= book.getId() %>" value="<%= book.getName() %>">
            </td>
            <td>
                <input type="number" step="0.01" name="price_<%= book.getId() %>" value="<%= book.getPrice() %>">
            </td>
            <td>
                <select name="book_type_<%= book.getId() %>">
                    <option <%= book.getBookType().equalsIgnoreCase("school book") ? "selected" : "" %>>School book</option>
                    <option <%= book.getBookType().equalsIgnoreCase("story book") ? "selected" : "" %>>Story book</option>
                    <option <%= book.getBookType().equalsIgnoreCase("children book") ? "selected" : "" %>>Children book</option>
                    <option <%= book.getBookType().equalsIgnoreCase("others") ? "selected" : "" %>>Others</option>
                </select>
            </td>
            <td>
                <button type="submit" name="updateId" value="<%= book.getId() %>">Update</button>
                <% if ("admin".equals(role)) { %>
                    <a class="delete-link" href="DeleteBookServlet?id=<%= book.getId() %>" onclick="return confirm('Are you sure you want to delete this book?');">Delete</a>
                <% } %>
            </td>
        </tr>
        <%
            }
        %>
    </table>
</form>
</body>
</html>
