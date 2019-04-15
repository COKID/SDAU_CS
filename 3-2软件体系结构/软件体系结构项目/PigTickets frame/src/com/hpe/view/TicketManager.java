package com.hpe.view;

import java.sql.SQLException;
import java.util.List;
import java.util.Scanner;

import com.hpe.calculate.CalculateFactory;
import com.hpe.calculate.Calculator;
//import com.hpe.calculate.PriceCalculator;
import com.hpe.dao.FrequencyDao;
import com.hpe.dao.TOrderDao;
import com.hpe.dao.UserDao;
import com.hpe.po.Frequency;
import com.hpe.po.OrderView;
import com.hpe.po.TOrder;
import com.hpe.po.User;


public class TicketManager {
    private static Scanner sc = new Scanner(System.in);
    private static UserDao userDao = new UserDao();
    private static TOrderDao orderDao = new TOrderDao();
    private static FrequencyDao frequencyDao = new FrequencyDao();
    private static User user;
    private static List<OrderView> orderViewList;
    private static List<Frequency> frequencyList;
    private static Frequency frequency;

    public static void main(String[] args) {
        System.out.println("----欢迎来到八戒订票系统----");
        init();
    }
    public static void init(){
        System.out.println("----请选择操作项目编号----");
        System.out.println("1.注册 2.登录 3.管理员登陆");
        int operate=sc.nextInt();
        switch (operate){
            case 1: register();break;
            case 2: login(); break;
            case 3:adminLogin(); break;
            default:
                System.out.println("错误指令");
                init();
        }
    }
    /**
     * 普通用户注册
     */
    public static void register() {
        String uname;
        String upassword;
        String idno;
        String realname;
        System.out.println("请输入用户名");
        uname=sc.next();
        System.out.println("请输入登录密码");
        upassword=sc.next();
        System.out.println("请输入身份证号");
        idno=sc.next();
        System.out.println("请输入您的真实姓名");
        realname=sc.next();
        try {
            userDao.userRegister(new User(uname,upassword,idno,realname));
            System.out.println("注册成功,返回主界面登陆");
            init();
        }catch (Exception e){
            System.out.println("注册失败请重新注册");
            register();
        }
    }

    /**
     * 普通用户登录
     */
    public static void login() {
        String uname;
        String upassword;
        System.out.println("请输入用户名");
        uname=sc.next();
        System.out.println("请输入登录密码");
        upassword=sc.next();
        if ((user=userDao.userLogin(uname,upassword))!=null){

            System.out.println("登录成功");
            System.out.println("欢迎您,"+uname);
            userView();
        }else{
            init();
        }
    }

    /**
     * 管理员登录
     */
    public static void adminLogin() {
        String uname;
        String upassword;
        System.out.println("请输入用户名");
        uname=sc.next();
        System.out.println("请输入登录密码");
        upassword=sc.next();
        if(uname.equals("admin")&&upassword.equals("admin")){
            System.out.println("登录成功");
            System.out.println("----八戒订票系统后台管理----");
            adminView();
        }else{
            System.out.println("账号或者密码错误请重新登陆");
            init();
        }
    }

    /**
     * 普通用户操作视图
     */
    public static void userView() {
        System.out.println("----请选择操作项目编号----");
        System.out.println("1.订票 2.退票 0.退出");
        int operate=sc.nextInt();
        switch (operate){
            case 1: order();break;
            case 2: orderUnsub(); break;
            case 0: init(); break;
            default:
                System.out.println("错误指令");
                userView();
        }
    }
    /**
     * 订票
     */
    public static void order() {
        Calculator calculator=null;
        System.out.println("请输入目的地");
        String faddress=sc.next();
        frequencyList=frequencyDao.selectByFaddress(faddress);
        for (Frequency f:frequencyList) {
            System.out.println(f.toString());
        }
        System.out.println("请选择你要订购的车次信息");
        int fid=sc.nextInt();
        double price=0;
        boolean flag=false;
        for (Frequency f:frequencyList) {
            if (f.getFid()==fid){
                flag=true;
                calculator=CalculateFactory.getCalculator(f.getLevel());
                price=calculator.getPrice(f.getKilometers());
                System.out.println("票价为￥"+price+"是否预定，1 是,2 否");
                int temp=sc.nextInt();
                if (temp==1){
                    try {
                        System.out.println();
                        orderDao.orderTicket(new TOrder(user.getUid(),faddress,fid,price,1));
                        System.out.println("车票预订成功");
                    }catch (Exception e){
                        System.out.println("车票预定失败请重试");
                    }finally {
                        userView();
                    }
                }else if(temp==2){
                    userView();
                }else {
                    System.out.println("指令错误，请重新操作");
                    userView();
                }
                break;
            }
        }
        if(!flag){
            System.out.println("无此车次请重试");
        }

    }

    /**
     * 退票
     */
    public static void orderUnsub() {
        System.out.println("您的订单列表如下");
        try {
            orderViewList=orderDao.getOrderList(user.getUid());
        }catch (Exception e){
            System.out.println("查询错误请重试");
            userView();
        }
        for (OrderView o:orderViewList) {
            System.out.println(o.toString());
        }
        System.out.println("请选择你要取消订单的编号");
        try {
            orderDao.unOrderByOid(sc.nextInt());
            System.out.println("订单取消成功");
        }catch (Exception e){
            e.printStackTrace();
            System.out.println("订单取消失败，请重试");
        }finally {
            userView();
        }
    }
    /**
     * 管理员操作视图
     */
    public static void adminView() {
        System.out.println("----请选择操作项目编号----");
        System.out.println("1.增加车次 2.修改车次 3.查看车次列表 4.删除车次 0.退出");
        int operate=sc.nextInt();
        switch (operate){
            case 1: addFrequency();break;
            case 2: updateFrequency(); break;
            case 3: checkFrequency(); break;
            case 4: deleteFrequency(); break;
            case 0: init(); break;
            default:
                System.out.println("错误指令");
                adminView();
        }
    }

    /**
     * 增加车次
     */
    public static void addFrequency() {
        String fname;
        String faddress;
        String starttime;
        double kilometers;
        String type;
        int level;
        System.out.println("请输入车次名称");
        fname=sc.next();
        System.out.println("请输入终点站点");
        faddress=sc.next();
        System.out.println("请输入发车时间(按照hh:mm格式输入)");
        starttime=sc.next();
        System.out.println("请输入距离东土大唐公里数");
        kilometers=sc.nextDouble();
        System.out.println("请输入车型(例如火车、动车、飞机等)");
        type=sc.next();
        System.out.println("请输入车型级别(例如1,2,3,4)");
        level=sc.nextInt();
        try {
            frequencyDao.insertFrequency(new Frequency(-1,fname,faddress,starttime,kilometers,type,level));
            System.out.println("添加成功");
        }catch (Exception e){
            System.out.println("添加失败请重试");
        }finally {
            adminView();
        }
    }

    /**
     * 修改车次
     */
    public static void updateFrequency() {
        String oldfname;
        String fname;
        String faddress;
        String starttime;
        double kilometers;
        String type;
        int level;
        System.out.println("请输入要修改的车次名称");
        oldfname=sc.next();
        System.out.println("请输入新的车次名称");
        fname=sc.next();
        System.out.println("请输入新终点站点");
        faddress=sc.next();
        System.out.println("请输入新的发车时间(按照hh:mm格式输入)");
        starttime=sc.next();
        System.out.println("请输入新的距离东土大唐公里数");
        kilometers=sc.nextDouble();
        System.out.println("请输入新的车型(例如火车、动车、飞机等)");
        type=sc.next();
        System.out.println("请输入新的车型级别(例如1,2,3,4)");
        level=sc.nextInt();
        try {
            frequencyDao.updateFrequency(oldfname,new Frequency(-1,fname,faddress,starttime,kilometers,type,level));
            System.out.println("修改成功");
        }catch (Exception e){
            System.out.println("修改失败请重试");
        }finally {
            adminView();
        }

    }

    /**
     * 查看车次列表
     */
    public static void checkFrequency() {
        System.out.println("查询到的车次列表如下");
        try {
            frequencyList=frequencyDao.selectFrequency();
            for (Frequency f:frequencyList) {
                System.out.println(f.toString());
            }
        }catch (Exception e){

        }finally {
            adminView();
        }


    }

    /**
     * 删除车次
     */
    public static void deleteFrequency() {
        System.out.println("请输入要修改的车次名称");
        String fname=sc.next();
        try {
            frequencyList=frequencyDao.selectByFname(fname);
            boolean flag=false;
            for (Frequency f:frequencyList) {
                if (f.getFname().equals(fname)){
                    flag=true;
                    frequencyDao.deleteByFname(fname);
                    System.out.println("删除成功");
                    break;
                }
            }
            if(!flag){
                System.out.println("不包含该车次，请重新操作!");
                adminView();
            }
        }catch (SQLException e) {
            e.printStackTrace();
        }


    }

}
