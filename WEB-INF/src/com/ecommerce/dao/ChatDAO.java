package com.ecommerce.dao;

import java.sql.*;
import java.util.*;

public class ChatDAO {

    private static String url = "jdbc:mysql://localhost:3306/ecommerce";
    private static String username = "root";
    private static String password = "password";

    private static Connection getConnection() throws Exception {
        Class.forName("com.mysql.cj.jdbc.Driver");
        return DriverManager.getConnection(url, username, password);
    }

    public static void saveMessage(int userId, String role, String message) {

        try(Connection con = getConnection()) {

            String sql = "INSERT INTO chat_messages(user_id,sender_role,message) VALUES(?,?,?)";

            PreparedStatement ps = con.prepareStatement(sql);
            ps.setInt(1,userId);
            ps.setString(2,role);
            ps.setString(3,message);

            ps.executeUpdate();

        }catch(Exception e){
            e.printStackTrace();
        }
    }

    public static List<String> getMessages(int userId){

        List<String> list = new ArrayList<>();

        try(Connection con = getConnection()){

            String sql = "SELECT * FROM chat_messages WHERE user_id=? ORDER BY created_at";

            PreparedStatement ps = con.prepareStatement(sql);
            ps.setInt(1,userId);

            ResultSet rs = ps.executeQuery();

            while(rs.next()){

                String role = rs.getString("sender_role");
                String msg = rs.getString("message");

                if(role.equals("USER")){
                    list.add("<div style='text-align:left;color:blue'>"+msg+"</div>");
                }else{
                    list.add("<div style='text-align:right;color:green'>"+msg+"</div>");
                }
            }

        }catch(Exception e){
            e.printStackTrace();
        }

        return list;
    }

    public static List<Integer> getChatUsers(){

        List<Integer> users = new ArrayList<>();

        try(Connection con = getConnection()){

            String sql = "SELECT DISTINCT user_id FROM chat_messages";

            Statement st = con.createStatement();
            ResultSet rs = st.executeQuery(sql);

            while(rs.next()){
                users.add(rs.getInt("user_id"));
            }

        }catch(Exception e){
            e.printStackTrace();
        }

        return users;
    }
}