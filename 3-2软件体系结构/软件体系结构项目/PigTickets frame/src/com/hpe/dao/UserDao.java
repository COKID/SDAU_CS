package com.hpe.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import com.hpe.po.User;
import com.hpe.util.DBConnection;

public class UserDao {
    Connection connection=DBConnection.getConnection();
    PreparedStatement preparedStatement;
    ResultSet resultSet;
    String sqlStr;
    /**
     * 登录
     * @param uname
     * @param upassword
     * @return
     */
    public User userLogin(String uname,String upassword) {
        sqlStr="SELECT * FROM user WHERE uname=?";
        try {
            preparedStatement=connection.prepareStatement(sqlStr);
            preparedStatement.setString(1,uname);
            resultSet= preparedStatement.executeQuery();
            resultSet.next();
            String temp=resultSet.getString("upassword");

            if(temp.equals(upassword)){
                return new User(resultSet.getInt("uid"),
                        resultSet.getString("uname"),
                        resultSet.getString("upassword"),
                        resultSet.getString("idno"),
                        resultSet.getString("realname"));
            }else{
                return null;
            }
        }catch (SQLException e){
            e.printStackTrace();
           return null;
        }

    }

    /**
     * 注册
     * @param user
     * @return
     */
    public void userRegister(User user) throws SQLException {
        sqlStr="INSERT INTO user(uname, upassword, idno, realname) VALUES(?, ?, ?, ?)";
        preparedStatement = connection.prepareStatement(sqlStr);
        preparedStatement.setString(1,user.getUname());
        preparedStatement.setString(2,user.getUpassword());
        preparedStatement.setString(3,user.getIdno());
        preparedStatement.setString(4,user.getRealname());
        preparedStatement.execute();
    }
}
