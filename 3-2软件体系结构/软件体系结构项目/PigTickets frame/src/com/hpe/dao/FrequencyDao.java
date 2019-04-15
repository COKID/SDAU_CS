package com.hpe.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.hpe.po.*;

import com.hpe.util.DBConnection;
//import com.sun.corba.se.spi.orbutil.fsm.Guard.Result;

public class FrequencyDao {
    Connection connection=DBConnection.getConnection();
    PreparedStatement preparedStatement;
    ResultSet resultSet;
    String sqlStr;
    /**
     * 增加车次
     * @param frequency
     * @return
     */
    public void insertFrequency(Frequency frequency)throws SQLException{
        sqlStr="INSERT INTO frequency(fname, faddress, starttime, kilometers, type, level) VALUES(?, ?, ?, ?, ?, ?)";
        preparedStatement=connection.prepareStatement(sqlStr);
        preparedStatement.setString(1,frequency.getFname());
        preparedStatement.setString(2,frequency.getFaddress());
        preparedStatement.setString(3, frequency.getStarttime());
        preparedStatement.setDouble(4,frequency.getKilometers());
        preparedStatement.setString(5,frequency.getType());
        preparedStatement.setInt(6,frequency.getLevel());
        preparedStatement.execute();
    }


    /**
     * 修改车次
     * @param frequency
     * @return
     */

    public void updateFrequency(String oldfname, Frequency frequency)throws SQLException{

        sqlStr="UPDATE frequency SET fname=?, faddress=?, starttime=?, kilometers=?, type=?, level=? WHERE fname=?";
        preparedStatement=connection.prepareStatement(sqlStr);
        preparedStatement.setString(1,frequency.getFname());
        preparedStatement.setString(2,frequency.getFaddress());
        preparedStatement.setString(3, frequency.getStarttime());
        preparedStatement.setDouble(4,frequency.getKilometers());
        preparedStatement.setString(5,frequency.getType());
        preparedStatement.setInt(6,frequency.getLevel());
        preparedStatement.setString(7,oldfname);
        preparedStatement.execute();
    }


    /**
     * 查询车次列表
     * @param
     * @return
     */
    public List<Frequency> selectFrequency()throws SQLException{
        List<Frequency> list=new ArrayList<Frequency>();
        sqlStr="SELECT * FROM frequency";
        preparedStatement=connection.prepareStatement(sqlStr);
        resultSet=preparedStatement.executeQuery();
        while (resultSet.next()){
            list.add(new Frequency(resultSet.getInt("fid"),
                    resultSet.getString("fname"),
                    resultSet.getString("faddress"),
                    resultSet.getString("starttime"),
                    resultSet.getDouble("kilometers"),
                    resultSet.getString("type"),
                    resultSet.getInt("level")));
        }
        return list;
    }

    /**
     * 删除车次
     * @param fname
     * @return
     */

    public void deleteByFname(String fname)throws SQLException{
        sqlStr="DELETE FROM frequency WHERE fname=?";
        preparedStatement=connection.prepareStatement(sqlStr);
        preparedStatement.setString(1,fname);
        preparedStatement.execute();
    }

    /**
     * 通过车次名称查询车次
     *
     * @param fname
     * @return
     */
    public List<Frequency> selectByFname(String fname)throws SQLException{
        List<Frequency> list=new ArrayList<Frequency>();
        sqlStr="SELECT * FROM frequency WHERE fname=?";
        preparedStatement=connection.prepareStatement(sqlStr);
        preparedStatement.setString(1,fname);
        resultSet=preparedStatement.executeQuery();
        while (resultSet.next()){
            list.add(new Frequency(resultSet.getInt("fid"),
                    resultSet.getString("fname"),
                    resultSet.getString("faddress"),
                    resultSet.getString("starttime"),
                    resultSet.getDouble("kilometers"),
                    resultSet.getString("type"),
                    resultSet.getInt("level")));
        }
        return list;
    }



    /**
     * 根据终点站查询车次列表
     * @param faddress
     * @return
     */
    public List<Frequency> selectByFaddress(String faddress) {
        List<Frequency> list=new ArrayList<Frequency>();
        sqlStr="SELECT * FROM frequency WHERE faddress=?";
        try {
            preparedStatement=connection.prepareStatement(sqlStr);
            preparedStatement.setString(1,faddress);
            resultSet = preparedStatement.executeQuery();
            while (resultSet.next()){
                list.add(new Frequency(
                        resultSet.getInt("fid"),
                        resultSet.getString("fname"),
                        resultSet.getString("faddress"),
                        resultSet.getString("starttime"),
                        resultSet.getDouble("kilometers"),
                        resultSet.getString("type"),
                        resultSet.getInt("level")
                ));
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return list;
    }

    /**
     * 根据车次编号查询车次信息
     * @param fid
     * @return
     */


}
