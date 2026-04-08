package com.ecommerce.dao;

import java.sql.*;

public class UserDAO {

    public boolean register(String name, String email, String password) {
        try (Connection con = DBUtil.getConnection()) {
            PreparedStatement ps =
                con.prepareStatement("INSERT INTO users(name,email,password,role) VALUES(?,?,?,?)");
            ps.setString(1, name);
            ps.setString(2, email);
            ps.setString(3, password);
            ps.setString(4, "USER");
            return ps.executeUpdate() > 0;
        } catch (Exception e) {
            e.printStackTrace();
            return false;
        }
    }

    public ResultSet login(String email, String password) {
        try {
            Connection con = DBUtil.getConnection();
            PreparedStatement ps =
                con.prepareStatement("SELECT * FROM users WHERE email=? AND password=?");
            ps.setString(1, email);
            ps.setString(2, password);
            return ps.executeQuery();
        } catch (Exception e) {
            e.printStackTrace();
            return null;
        }
    }

    public void updateUser(int id, String name, String email) {
    try (Connection con = DBUtil.getConnection()) {
        PreparedStatement ps =
            con.prepareStatement("UPDATE users SET name=?, email=? WHERE id=?");
        ps.setString(1, name);
        ps.setString(2, email);
        ps.setInt(3, id);
        ps.executeUpdate();
    } catch (Exception e) {
        e.printStackTrace();
    }
}

public void deleteUser(int id) {
    try (Connection con = DBUtil.getConnection()) {
        PreparedStatement ps =
            con.prepareStatement("DELETE FROM users WHERE id=?");
        ps.setInt(1, id);
        ps.executeUpdate();
    } catch (Exception e) {
        e.printStackTrace();
    }
}

}
