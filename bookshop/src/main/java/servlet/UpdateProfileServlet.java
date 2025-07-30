package servlet;

import jakarta.servlet.*;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;
import java.io.IOException;
import bean.ProfileBean;
import dao.ProfileDAO;

@WebServlet("/UpdateProfileServlet")
public class UpdateProfileServlet extends HttpServlet {
    protected void doPost(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
        HttpSession session = req.getSession();
        String name = (String) session.getAttribute("username");

        String password = req.getParameter("password");
        String address = req.getParameter("address");
        String telephone = req.getParameter("telephone");
        String email = req.getParameter("email");

        ProfileBean user = new ProfileBean();
        user.setName(name);
        user.setPassword(password);
        user.setAddress(address);
        user.setTelephone(telephone);
        user.setEmail(email);

        ProfileDAO dao = new ProfileDAO();
        if (dao.updateProfile(user)) {
            req.setAttribute("message", "Profile updated successfully!");
        } else {
            req.setAttribute("error", "Update failed.");
        }

        req.getRequestDispatcher("profile.jsp").forward(req, res);
    }
}
