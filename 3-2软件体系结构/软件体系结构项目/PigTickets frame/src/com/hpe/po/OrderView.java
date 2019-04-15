package com.hpe.po;

public class OrderView {
    String fname;
    int oid;
    int userid;
    String finaladdress;
    int frequencyid;
    double price;
    String realname;
    int state;

    public OrderView(String fname, int oid, int userid, String finaladdress, int frequencyid, double price, String realname, int state) {
        this.fname = fname;
        this.oid = oid;
        this.userid = userid;
        this.finaladdress = finaladdress;
        this.frequencyid = frequencyid;
        this.price = price;
        this.realname = realname;
        this.state = state;
    }

    public String getFname() {
        return fname;
    }

    public void setFname(String fname) {
        this.fname = fname;
    }

    public int getOid() {
        return oid;
    }

    public void setOid(int oid) {
        this.oid = oid;
    }

    public int getUserid() {
        return userid;
    }

    public void setUserid(int userid) {
        this.userid = userid;
    }

    public String getFinaladdress() {
        return finaladdress;
    }

    public void setFinaladdress(String finaladdress) {
        this.finaladdress = finaladdress;
    }

    public int getFrequencyid() {
        return frequencyid;
    }

    public void setFrequencyid(int frequencyid) {
        this.frequencyid = frequencyid;
    }

    public double getPrice() {
        return price;
    }

    public void setPrice(double price) {
        this.price = price;
    }

    public String getRealname() {
        return realname;
    }

    public void setRealname(String realname) {
        this.realname = realname;
    }

    public int getState() {
        return state;
    }

    public void setState(int state) {
        this.state = state;
    }

    @Override
    public String toString() {
        return "订单信息[订单编号:" +oid+
                ", 车次名称:" +fname+
                ", 终点站:" +finaladdress+
                ", 票价:" +price+
                ", 真实姓名:" +realname+
                "]";
    }
}
