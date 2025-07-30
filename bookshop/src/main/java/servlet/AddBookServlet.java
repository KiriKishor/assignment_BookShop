package servlet;

import java.io.*;
import jakarta.servlet.*;
import jakarta.servlet.annotation.*;
import jakarta.servlet.http.*;
import bean.BookBean;
import dao.BookDAO;

@WebServlet("/AddBookServlet")
@MultipartConfig(fileSizeThreshold = 1024 * 1024 * 1,  // 1MB
                 maxFileSize = 1024 * 1024 * 10,       // 10MB
                 maxRequestSize = 1024 * 1024 * 15)    // 15MB
public class AddBookServlet extends HttpServlet {
    protected void doPost(HttpServletRequest req, HttpServletResponse res)
            throws ServletException, IOException {

        String name = req.getParameter("name");
        double price = Double.parseDouble(req.getParameter("price"));
        String bookType = req.getParameter("book_type");

        Part filePart = req.getPart("image");
        String fileName = filePart.getSubmittedFileName();

        String uploadPath = req.getServletContext().getRealPath("") + "images";
        File uploadDir = new File(uploadPath);
        if (!uploadDir.exists()) uploadDir.mkdir();

        String imagePath = "images/" + fileName;
        filePart.write(uploadPath + File.separator + fileName);

        // ✅ create and set data in correct order
        BookBean book = new BookBean();
        book.setName(name);
        book.setPrice(price);
        book.setBookType(bookType);
        book.setImagePath(imagePath);

        BookDAO dao = new BookDAO();
        if (dao.addBook(book)) {
            req.setAttribute("message", "Book added successfully!");
        } else {
            req.setAttribute("error", "Failed to add book.");
        }

        req.getRequestDispatcher("addBook.jsp").forward(req, res);
    }
}
