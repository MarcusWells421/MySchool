package com.claim.entity;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;


@Entity//this tells spring to use Hibernate and map this class to our database column
@Table(name="user")//This tells hibernate the name of the table in our database
public class Student {
/*	@Id // Tell hibernate which column this variable maps to your primary key*/
	@Column(name="studentFirstName")
	private String studentFirstName;

	@Column(name="studentMiddleInitial")
	private String studentMiddleInitial;

	@Column(name="studentLastName")
	private String studentLastName;

	@Column(name="studentStreet")
	private String studentStreet;

	@Column(name="studentCity")
	private String studentCity;

	@Column(name="studentState")
	private String studentState;

	@Column(name="studentZipCode")
	private String studentZipCode;

	@Column(name="studentLevel")
	private String studentLevel;

	public Student() {}

	public Student(String studentFirstName, String studentMiddleInitial, String studentLastName, String studentStreet,
			String studentCity, String studentState, String studentZipCode, String studentLevel) {
		this.studentFirstName = studentFirstName;
		this.studentMiddleInitial = studentMiddleInitial;
		this.studentLastName = studentLastName;
		this.studentStreet = studentStreet;
		this.studentCity = studentCity;
		this.studentState = studentState;
		this.studentZipCode = studentZipCode;
		this.studentLevel = studentLevel;
	}

	public String getStudentFirstName() {
		return studentFirstName;
	}

	public void setStudentFirstName(String studentFirstName) {
		this.studentFirstName = studentFirstName;
	}

	public String getStudentMiddleInitial() {
		return studentMiddleInitial;
	}

	public void setStudentMiddleInitial(String studentMiddleInitial) {
		this.studentMiddleInitial = studentMiddleInitial;
	}

	public String getStudentLastName() {
		return studentLastName;
	}

	public void setStudentLastName(String studentLastName) {
		this.studentLastName = studentLastName;
	}

	public String getStudentStreet() {
		return studentStreet;
	}

	public void setStudentStreet(String studentStreet) {
		this.studentStreet = studentStreet;
	}

	public String getStudentCity() {
		return studentCity;
	}

	public void setStudentCity(String studentCity) {
		this.studentCity = studentCity;
	}

	public String getStudentState() {
		return studentState;
	}

	public void setStudentState(String studentState) {
		this.studentState = studentState;
	}

	public String getStudentZipCode() {
		return studentZipCode;
	}

	public void setStudentZipCode(String studentZipCode) {
		this.studentZipCode = studentZipCode;
	}

	public String getStudentLevel() {
		return studentLevel;
	}

	public void setStudentLevel(String studentLevel) {
		this.studentLevel = studentLevel;
	}

}