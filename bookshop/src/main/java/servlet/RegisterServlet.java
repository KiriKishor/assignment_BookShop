package servlet;

import java.io.IOException;
import jakarta.servlet.*;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;
import bean.UserBean;
import dao.UserDAO;

@WebServlet("/RegisterServlet")
public class RegisterServlet extends HttpServlet {
    protected void doPost(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
        String name = req.getParameter("name");
        String password = req.getParameter("password");
        String address = req.getParameter("address");
        String telephone = req.getParameter("telephone");
        String email = req.getParameter("email");

        if (!telephone.matches("\\d{10}") || password.length() < 8 || !email.contains("@")) {
            req.setAttribute("error", "Invalid input. Please check values.");
            req.getRequestDispatcher("register.jsp").forward(req, res);
            return;
        }

        UserBean user = new UserBean();
        user.setName(name);
        user.setPassword(password);
        user.setAddress(address);
        user.setTelephone(telephone);
        user.setEmail(email);

        UserDAO dao = new UserDAO();

        try {
            int id = dao.registerUser(user);

            if (id != -1) {
            	 String formattedAccountNumber = "PE 000" + id;
            	 req.setAttribute("message", "Registered successfully! Your Account Number is: " + formattedAccountNumber);
            } else {
                req.setAttribute("error", "Registration failed.");
            }

        } catch (Exception e) {
            req.setAttribute("error", e.getMessage());
        }

        req.getRequestDispatcher("register.jsp").forward(req, res);
    }
}
