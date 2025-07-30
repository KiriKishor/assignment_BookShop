package dao;

import java.sql.*;

public class adminLoginDao {

    public boolean validate(String name, String password) {
        boolean status = false;
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            Connection conn = DriverManager.getConnection(
                "jdbc:mysql://localhost:3306/bookshop", "root", "123456789"
            );

            String sql = "SELECT * FROM user WHERE name=? AND password=?";
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setString(1, name);
            ps.setString(2, password); // plaintext for now

            ResultSet rs = ps.executeQuery();
            status = rs.next();

        } catch (Exception e) {
            e.printStackTrace();
        }
        return status;
    }
}
