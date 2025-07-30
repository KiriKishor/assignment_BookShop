package servlet;

import java.io.IOException;
import jakarta.servlet.*;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;

import bean.adminLoginBean;
import dao.adminLoginDao;

@WebServlet("/AdminLoginServlet")
public class AdminLoginServlet extends HttpServlet {
    protected void doPost(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
        String name = req.getParameter("name");
        String password = req.getParameter("password");

        adminLoginDao dao = new adminLoginDao();
        boolean isValid = dao.validate(name, password);

        if (isValid) {
            if (name.equals("admin")) {
                res.sendRedirect("adminDashboard.jsp");
            } else if (name.equals("casher")) {
                res.sendRedirect("casherDashboard.jsp");
            } else {
                req.setAttribute("error", "Access denied.");
                req.getRequestDispatcher("adminLogin.jsp").forward(req, res);
            }
        } else {
            req.setAttribute("error", "Invalid name or password.");
            req.getRequestDispatcher("adminLogin.jsp").forward(req, res);
        }
    }
}
