package com.edu;

public class HelloBean {
	private String studentName;// 学生姓名
	private String course;// 选课课程名
	private Double score;// 课程成绩

	public HelloBean() {
	}

	public HelloBean(String studentName, String course, Double score) {
		this.studentName = studentName;
		this.course = course;
		this.score = score;
	}

	public String getStudentName() {
		return studentName;
	}

	public void setStudentName(String studentName) {
		this.studentName = studentName;
	}

	public String getCourse() {
		return course;
	}

	public void setCourse(String course) {
		this.course = course;
	}

	public Double getScore() {
		return score;
	}

	public void setScore(Double score) {
		this.score = score;
	}

}
