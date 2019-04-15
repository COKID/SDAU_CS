package com.hpe.calculate;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.Statement;

public class Test {

    public static void main(String[] args) {
        String driver = "com.mysql.jdbc.Driver";
        String username = "root";
        String password = "000000";
        String url = "jdbc:mysql://localhost:3306/tickets";
        try {
            Class.forName(driver);
            Connection conn = DriverManager.getConnection(url, username, password);
            String sql = "select * from user";
            Statement st = conn.createStatement();
            ResultSet rs = st.executeQuery(sql);
            while (rs.next()) {
                System.out.println(rs.getString("uname"));
            }
        } catch (Exception e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        }


    }

}
