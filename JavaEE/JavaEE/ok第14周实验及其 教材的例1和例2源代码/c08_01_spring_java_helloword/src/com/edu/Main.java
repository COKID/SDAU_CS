package com.edu;

import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

public class Main {

	public static void main(String[] args) {
		// (1)创建一个容器实例（与配置文件关联）
		ApplicationContext act = new ClassPathXmlApplicationContext(
				"hellobean.xml");
		// (2)只声明一个对象
		HelloBean student;
		// (3)从实例容器act中，分别获取3个学生对象，并显示信息
		student = (HelloBean) act.getBean("stu1");
		System.out.println("姓名：" + student.getStudentName() + "  课程名："
				+ student.getCourse() + "   成绩：" + student.getScore());
		student = (HelloBean) act.getBean("stu2");
		System.out.println("姓名：" + student.getStudentName() + "  课程名："
				+ student.getCourse() + "   成绩：" + student.getScore());
		student = (HelloBean) act.getBean("stu3");
		System.out.println("姓名：" + student.getStudentName() + "  课程名："
				+ student.getCourse() + "   成绩：" + student.getScore());

	}

}
