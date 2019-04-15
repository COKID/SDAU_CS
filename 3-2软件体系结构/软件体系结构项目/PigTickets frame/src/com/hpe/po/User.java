package com.hpe.po;

public class User {
    int uid;
    String uname;
    String upassword;
    String idno;
    String realname;

    public User() {
    }

    public User(int uid, String uname, String upassword, String idno, String realname) {
        this.uid = uid;
        this.uname = uname;
        this.upassword = upassword;
        this.idno = idno;
        this.realname = realname;
    }

    public User(String uname, String upassword, String idno, String realname) {
        this.uname = uname;
        this.upassword = upassword;
        this.idno = idno;
        this.realname = realname;
    }

    public int getUid() {
        return uid;
    }

    public void setUid(int uid) {
        this.uid = uid;
    }

    public String getUname() {
        return uname;
    }

    public void setUname(String uname) {
        this.uname = uname;
    }

    public String getUpassword() {
        return upassword;
    }

    public void setUpassword(String upassword) {
        this.upassword = upassword;
    }

    public String getIdno() {
        return idno;
    }

    public void setIdno(String idno) {
        this.idno = idno;
    }

    public String getRealname() {
        return realname;
    }

    public void setRealname(String realname) {
        this.realname = realname;
    }

    @Override
    public String toString() {
        return "User{" +
                "uid=" + uid +
                ", uname='" + uname + '\'' +
                ", upassword='" + upassword + '\'' +
                ", idno='" + idno + '\'' +
                ", realname='" + realname + '\'' +
                '}';
    }
}
