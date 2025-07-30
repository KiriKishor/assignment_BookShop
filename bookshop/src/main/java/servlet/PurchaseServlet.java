package servlet;

import java.io.*;
import java.sql.*;
import jakarta.servlet.*;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;

@WebServlet("/PurchaseServlet")
public class PurchaseServlet extends HttpServlet {
    protected void doPost(HttpServletRequest req, HttpServletResponse res)
            throws ServletException, IOException {

        String bookName = req.getParameter("bookName");
        double price = Double.parseDouble(req.getParameter("price"));
        int quantity = Integer.parseInt(req.getParameter("quantity"));
        double total = Double.parseDouble(req.getParameter("total"));
        String username = req.getParameter("username");

        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            Connection conn = DriverManager.getConnection(
                "jdbc:mysql://localhost:3306/bookshop", "root", "123456789");

            String sql = "INSERT INTO purchased (username, book_name, unit_price, quantity, total_price) VALUES (?, ?, ?, ?, ?)";
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setString(1, username);
            ps.setString(2, bookName);
            ps.setDouble(3, price);
            ps.setInt(4, quantity);
            ps.setDouble(5, total);

            int rows = ps.executeUpdate();

            if (rows > 0) {
                req.setAttribute("message", "Purchase saved successfully!");
                req.getRequestDispatcher("home.jsp").forward(req, res);
            } else {
                req.setAttribute("error", "Failed to save purchase.");
                req.getRequestDispatcher("bill.jsp").forward(req, res);
            }

        } catch (Exception e) {
            e.printStackTrace();
            req.setAttribute("error", "Something went wrong.");
            req.getRequestDispatcher("bill.jsp").forward(req, res);
        }
    }
}
