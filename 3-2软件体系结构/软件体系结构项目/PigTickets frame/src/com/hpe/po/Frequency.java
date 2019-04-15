package com.hpe.po;

public class Frequency {
    int fid;
    String fname;
    String faddress;
    String starttime;
    double kilometers;
    String type;
    int level;

    public Frequency() {
    }

    public Frequency(int fid, String fname, String faddress, String starttime, double kilometers, String type, int level) {
        this.fid = fid;
        this.fname = fname;
        this.faddress = faddress;
        this.starttime = starttime;
        this.kilometers = kilometers;
        this.type = type;
        this.level = level;
    }

    public int getFid() {
        return fid;
    }

    public void setFid(int fid) {
        this.fid = fid;
    }

    public String getFname() {
        return fname;
    }

    public void setFname(String fname) {
        this.fname = fname;
    }

    public String getFaddress() {
        return faddress;
    }

    public void setFaddress(String faddress) {
        this.faddress = faddress;
    }

    public String getStarttime() {
        return starttime;
    }

    public void setStarttime(String starttime) {
        this.starttime = starttime;
    }

    public double getKilometers() {
        return kilometers;
    }

    public void setKilometers(double kilometers) {
        this.kilometers = kilometers;
    }

    public String getType() {
        return type;
    }

    public void setType(String type) {
        this.type = type;
    }

    public int getLevel() {
        return level;
    }

    public void setLevel(int level) {
        this.level = level;
    }

    @Override
    public String toString() {
        return "车次信息[车次编号为:" +fid+
                ", 车次名称为:" +fname+
                ", 终点站为:" +faddress+
                ", 发车时间为:" +starttime+
                ", 距离山农:" +kilometers+
                ", 车型为:" +type+
                ", 级别为:" +level+
                "]";
    }
    //"车次信息[车次编号为:" +f.getFid()+
    //                    ", 车次名称为:" +f.getFname()+
    //                    ", 终点站为:" +f.getFaddress()+
    //                    ", 发车时间为:" +f.getStarttime()+
    //                    ", 距离山农:" +f.getKilometers()+
    //                    ", 车型为:" +f.getType()+
    //                    ", 级别为:" +f.getLevel()+
    //                    "]"
}
