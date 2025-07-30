package dao;

import java.sql.*;
import java.util.*;

public class PurchasedDAO {

    private Connection getConnection() throws Exception {
        Class.forName("com.mysql.cj.jdbc.Driver");
        return DriverManager.getConnection("jdbc:mysql://localhost:3306/bookshop", "root", "123456789");
    }

    public List<Map<String, Object>> getPurchasedBooks(String username) {
        List<Map<String, Object>> list = new ArrayList<>();
        try (Connection conn = getConnection()) {
            String sql = "SELECT * FROM purchased WHERE username = ?";
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setString(1, username);
            ResultSet rs = ps.executeQuery();

            while (rs.next()) {
                Map<String, Object> row = new HashMap<>();
                row.put("book_name", rs.getString("book_name"));
                row.put("unit_price", rs.getDouble("unit_price"));
                row.put("quantity", rs.getInt("quantity"));
                row.put("total_price", rs.getDouble("total_price"));
                list.add(row);
            }

        } catch (Exception e) {
            e.printStackTrace();
        }
        return list;
    }
}
