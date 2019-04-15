package com.hpe.po;

public class TOrder {
     int uid;
     int userid;//用户名
     String finaladdress;//目的地
     int frequencyid;//车次
     double price;//价格
     int state;//状态

    public TOrder(int userid, String finaladdress, int frequencyid, double price, int state) {
        this.userid = userid;
        this.finaladdress = finaladdress;
        this.frequencyid = frequencyid;
        this.price = price;
        this.state = state;
    }

    public int getOid() {
        return uid;
    }

    public void setOid(int uid) {
        this.uid = uid;
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

    public int getState() {
        return state;
    }

    public void setState(int state) {
        this.state = state;
    }
}
