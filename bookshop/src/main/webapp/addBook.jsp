<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Add Book</title>
    <style>
        body {
            font-family: 'Segoe UI', sans-serif;
            background: #FFC9BF;
            margin: 0;
            padding: 0;
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

        /* ✅ Form Styling */
        .container {
            display: flex;
            justify-content: center;
            align-items: center;
            min-height: 100vh;
        }

        form {
            width: 400px;
            background: #fff;
            padding: 30px;
            border-radius: 12px;
            box-shadow: 0 8px 20px rgba(0,0,0,0.15);
        }

        h2 {
            text-align: center;
            margin-bottom: 25px;
            color: #333;
        }

        .message {
            text-align: center;
            color: green;
            margin-bottom: 10px;
        }

        .error {
            text-align: center;
            color: red;
            margin-bottom: 10px;
        }

        input[type="text"],
        input[type="number"],
        input[type="file"],
        select {
            width: 100%;
            padding: 10px;
            margin-top: 12px;
            border: 1px solid #ccc;
            border-radius: 6px;
            font-size: 14px;
        }

        select {
            background: #fff;
        }

        button[type="submit"] {
            width: 100%;
            margin-top: 20px;
            padding: 12px;
            background-color: #28a745;
            color: white;
            border: none;
            font-size: 16px;
            border-radius: 6px;
            cursor: pointer;
        }

        button[type="submit"]:hover {
            background-color: #218838;
        }
    </style>
</head>
<body>

<div class="top-buttons">
    <form action="adminLogin.jsp">

    </form>
    <button class="btn" onclick="history.back();">Back</button>
</div>

<!-- 📘 Add Book Form -->
<div class="container">
    <form action="AddBookServlet" method="post" enctype="multipart/form-data">
        <h2>Add New Book</h2>
        <div class="message">${message}</div>
        <div class="error">${error}</div>

        <input type="text" name="name" placeholder="Book name" required>
        <input type="number" step="0.01" name="price" placeholder="Price" required>

        <select name="book_type" required>
            <option value="">-- Select Book Type --</option>
            <option value="School Book">School Book</option>
            <option value="Story Book">Story Book</option>
            <option value="Children Book">Children Book</option>
            <option value="Others">Others</option>
        </select>

        <input type="file" name="image" accept="image/*" required>

        <button type="submit">Add Book</button>
    </form>
</div>

</body>
</html>
