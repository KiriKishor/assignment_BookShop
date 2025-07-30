package dao;

import java.sql.*;
import java.security.MessageDigest;
import bean.ProfileBean;

public class ProfileDAO {

    private Connection getConnection() throws Exception {
        Class.forName("com.mysql.cj.jdbc.Driver");
        return DriverManager.getConnection("jdbc:mysql://localhost:3306/bookshop", "root", "123456789");
    }

    public ProfileBean getProfile(String name) {
        ProfileBean user = null;
        try (Connection conn = getConnection()) {
            String sql = "SELECT * FROM user WHERE name = ?";
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setString(1, name);
            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                user = new ProfileBean();
                user.setAccountNumber(rs.getInt("account_number"));
                user.setName(rs.getString("name"));
                user.setAddress(rs.getString("address"));
                user.setTelephone(rs.getString("telephone"));
                user.setEmail(rs.getString("email"));
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return user;
    }

    public boolean updateProfile(ProfileBean user) {
        try (Connection conn = getConnection()) {
            String sql = "UPDATE user SET password=?, address=?, telephone=?, email=? WHERE name=?";
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setString(1, hashPassword(user.getPassword()));
            ps.setString(2, user.getAddress());
            ps.setString(3, user.getTelephone());
            ps.setString(4, user.getEmail());
            ps.setString(5, user.getName());
            return ps.executeUpdate() > 0;
        } catch (Exception e) {
            e.printStackTrace();
        }
        return false;
    }

    private String hashPassword(String password) throws Exception {
        MessageDigest md = MessageDigest.getInstance("SHA-256");
        byte[] hash = md.digest(password.getBytes("UTF-8"));
        StringBuilder sb = new StringBuilder();
        for (byte b : hash) sb.append(String.format("%02x", b));
        return sb.toString();
    }
}
