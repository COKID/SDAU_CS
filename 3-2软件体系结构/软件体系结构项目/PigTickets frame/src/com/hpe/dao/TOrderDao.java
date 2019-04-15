package com.hpe.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.hpe.po.Frequency;
import com.hpe.po.OrderView;
import com.hpe.po.TOrder;
import com.hpe.util.DBConnection;

public class TOrderDao {
    Connection connection=DBConnection.getConnection();
    PreparedStatement preparedStatement;
    ResultSet resultSet;
    String sqlStr;
    /**
     * 订票
     * @param tOrder
     * @return
     */
    public void orderTicket(TOrder tOrder)throws SQLException{
        sqlStr="INSERT INTO torder(userid, finaladdress, frequencyid, price, state) VALUES(?, ?, ?, ?,?)";
        preparedStatement=connection.prepareStatement(sqlStr);
        preparedStatement.setInt(1,tOrder.getUserid());
        preparedStatement.setString(2,tOrder.getFinaladdress());
        preparedStatement.setInt(3,tOrder.getFrequencyid());
        preparedStatement.setDouble(4,tOrder.getPrice());
        preparedStatement.setInt(5,tOrder.getState());
        preparedStatement.execute();

    }


    /**
     * 退订
     * @param oid
     * @return
     */
    public void unOrderByOid(int oid)throws SQLException{
        sqlStr="UPDATE torder SET state=0 WHERE oid=?";
        preparedStatement=connection.prepareStatement(sqlStr);
        preparedStatement.setInt(1,oid);
        preparedStatement.execute();
    }

    /**
     * 获取个人订票列表
     * @param uid
     * @return
     */
    public List<OrderView> getOrderList(int uid)throws SQLException{
        sqlStr="SELECT * FROM orderview where userid=? and state=1";
        preparedStatement=connection.prepareStatement(sqlStr);
        preparedStatement.setInt(1,uid);
        resultSet=preparedStatement.executeQuery();
        List<OrderView> list=new ArrayList<OrderView>();
        while(resultSet.next()){
            list.add(new OrderView(
                    resultSet.getString("fname"),
                    resultSet.getInt("oid"),
                    resultSet.getInt("userid"),
                    resultSet.getString("finaladdress"),
                    resultSet.getInt("frequencyid"),
                    resultSet.getDouble("price"),
                    resultSet.getString("realname"),
                    resultSet.getInt("state")
                    ));
        }
        return list;
    }
}
