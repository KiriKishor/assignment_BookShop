package servlet;

import java.io.IOException;
import jakarta.servlet.*;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;
import dao.UserDAO;

@WebServlet("/LoginServlet")
public class LoginServlet extends HttpServlet {
    protected void doPost(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
        String name = req.getParameter("name");
        String password = req.getParameter("password");

        UserDAO dao = new UserDAO();

        try {
            boolean isValid = dao.checkLogin(name, password);

            if (isValid) {
                // Create session and redirect
                HttpSession session = req.getSession();
                session.setAttribute("username", name);
                res.sendRedirect("home.jsp");
            } else {
                req.setAttribute("error", "Invalid username or password.");
                req.getRequestDispatcher("index.jsp").forward(req, res);
            }
        } catch (Exception e) {
            e.printStackTrace();
            req.setAttribute("error", "Login failed due to error.");
            req.getRequestDispatcher("index.jsp").forward(req, res);
        }
    }
}
