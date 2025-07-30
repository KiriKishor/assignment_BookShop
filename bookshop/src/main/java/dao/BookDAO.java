package dao;

import java.sql.*;
import java.util.*;
import bean.BookBean;

public class BookDAO {

    private Connection getConnection() throws Exception {
        Class.forName("com.mysql.cj.jdbc.Driver");
        return DriverManager.getConnection("jdbc:mysql://localhost:3306/bookshop", "root", "123456789");
    }

    public List<BookBean> getAllBooks() {
        List<BookBean> list = new ArrayList<>();
        try (Connection conn = getConnection()) {
            String sql = "SELECT * FROM books";
            PreparedStatement ps = conn.prepareStatement(sql);
            ResultSet rs = ps.executeQuery();

            while (rs.next()) {
                BookBean book = new BookBean();
                book.setId(rs.getInt("id"));
                book.setName(rs.getString("name"));
                book.setPrice(rs.getDouble("price"));
                book.setBookType(rs.getString("book_type"));
                book.setImagePath(rs.getString("image_path"));
                list.add(book);
            }

        } catch (Exception e) {
            e.printStackTrace();
        }
        return list;
    }
    
    public boolean addBook(BookBean book) {
        boolean result = false;
        try (Connection conn = getConnection()) {
            String sql = "INSERT INTO books (name, price, book_type, image_path) VALUES (?, ?, ?, ?)";
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setString(1, book.getName());
            ps.setDouble(2, book.getPrice());
            ps.setString(3, book.getBookType());  // ✅ book_type
            ps.setString(4, book.getImagePath()); // ✅ image_path

            int rows = ps.executeUpdate();
            result = rows > 0;
        } catch (Exception e) {
            e.printStackTrace();
        }
        return result;
    }

    public boolean updateBookDetails(int id, String name, double price, String type) {
        try (Connection conn = getConnection()) {
            String sql = "UPDATE books SET name=?, price=?, book_type=? WHERE id=?";
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setString(1, name);
            ps.setDouble(2, price);
            ps.setString(3, type);
            ps.setInt(4, id);
            int rows = ps.executeUpdate();
            return rows > 0;
        } catch (Exception e) {
            e.printStackTrace();
        }
        return false;
    }

    
}
