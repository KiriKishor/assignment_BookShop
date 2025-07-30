package servlet;

import jakarta.servlet.*;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;
import java.io.IOException;
import dao.BookDAO;

@WebServlet("/UpdateBookServlet")
public class UpdateBookServlet extends HttpServlet {
    protected void doPost(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
        int id = Integer.parseInt(req.getParameter("updateId"));
        String name = req.getParameter("name_" + id);
        double price = Double.parseDouble(req.getParameter("price_" + id));
        String type = req.getParameter("book_type_" + id);

        BookDAO dao = new BookDAO();
        boolean updated = dao.updateBookDetails(id, name, price, type);

        if (updated) {
            req.setAttribute("message", "Book updated successfully!");
        } else {
            req.setAttribute("error", "Failed to update book.");
        }

        req.getRequestDispatcher("updateBooks.jsp").forward(req, res);
    }
}
