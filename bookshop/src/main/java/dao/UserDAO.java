package dao;

import java.sql.*;
import java.security.MessageDigest;
import bean.UserBean;

public class UserDAO {

    private Connection getConnection() {
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            return DriverManager.getConnection(
                "jdbc:mysql://localhost:3306/bookshop", "root", "123456789"
            );
        } catch (Exception e) {
            e.printStackTrace();
        }
        return null;
    }

    public int registerUser(UserBean user) throws Exception {
        int generatedId = -1;
        try (Connection conn = getConnection()) {
            String sql = "INSERT INTO user (name, password, address, telephone, email) VALUES (?, ?, ?, ?, ?)";
            PreparedStatement ps = conn.prepareStatement(sql, Statement.RETURN_GENERATED_KEYS);
            ps.setString(1, user.getName());
            ps.setString(2, hashPassword(user.getPassword()));
            ps.setString(3, user.getAddress());
            ps.setString(4, user.getTelephone());
            ps.setString(5, user.getEmail());

            int rows = ps.executeUpdate();

            if (rows > 0) {
                ResultSet rs = ps.getGeneratedKeys();
                if (rs.next()) {
                    generatedId = rs.getInt(1);
                }
            }

        } catch (SQLException e) {
            if (e.getMessage().contains("Duplicate entry") && e.getMessage().contains("name")) {
                throw new Exception("Username already exists.");
            } else {
                e.printStackTrace();
            }
        }
        return generatedId;
    }

    public boolean checkLogin(String name, String password) throws Exception {
        try (Connection conn = getConnection()) {
            String sql = "SELECT * FROM user WHERE name = ? AND password = ?";
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setString(1, name);
            ps.setString(2, hashPassword(password));  // match hashed password

            ResultSet rs = ps.executeQuery();
            return rs.next(); // return true if user found
        }
    }

    private String hashPassword(String password) throws Exception {
        MessageDigest md = MessageDigest.getInstance("SHA-256");
        byte[] hash = md.digest(password.getBytes("UTF-8"));
        StringBuilder sb = new StringBuilder();
        for (byte b : hash) sb.append(String.format("%02x", b));
        return sb.toString();
    }
}
