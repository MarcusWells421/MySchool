package com.claim.entity;

import java.util.ArrayList;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.Id;
import javax.persistence.OneToMany;
import javax.persistence.Table;


@Entity//this tells spring to use Hibernate and map this class to our database column
@Table(name="user")//This tells hibernate the name of the table in our database
public class Person {

//	private Person student;
	private boolean firstLogin;

	@Id // Tell hibernate which column this variable maps to your primary key
	@Column(name="username")
	private String username;
	
	@Column(name="firstName")//<-- Hibernate mapping your database columns to your Java class
	private String firstName;

	@Column(name="middleInitial")
	private String middleInitial;

	@Column(name="lastName")
	private String lastName;

	@Column(name="email")
	private String email;

	@Column(name="password")
	private String password;

	@Column(name="street")
	private String street;

	@Column(name="city")
	private String city;

	@Column(name="state")
	private String state;

	@Column(name="zipCode")
	private String zipCode;

	@Column(name="role")
	private String role;
	
	@Column(name="quizName")
	private String quizName;

	@Column(name="level")
	private String level;

	@Column(name="linkedAccounts")
	private ArrayList<String> linkedAccounts=new ArrayList<>();
	
	public Person() {}
	
	public Person(String username, String firstName, String middleInitial, String lastName, String email,
			String password, String street, String city, String state, String zipCode, String role,
			String level) {
		this.username = username;
		this.firstName = firstName.trim().substring(0, 1).toUpperCase()	+ firstName.trim().substring(1);
		this.middleInitial = middleInitial.trim().substring(0, 1).toUpperCase();
		this.lastName = lastName.trim().substring(0, 1).toUpperCase() + lastName.trim().substring(1).toLowerCase();
		this.email = email.trim();
		this.password = password;
		this.street = street.trim();
		this.city = city.trim();
		this.state = state.trim().substring(0, 2).toUpperCase();
		this.zipCode = zipCode.trim();
		this.role = role.trim().substring(0, 1).toUpperCase() + role.trim().substring(1).toLowerCase();;
		this.level = level;
		this.setRole("Student");
	}

	public Person(String username, String firstName, String middleInitial, String lastName, String email,
			String password, String street, String city, String state, String zipCode, ArrayList <String> linkedAccounts) {
		this.username = username;
		this.firstName = firstName.trim().substring(0, 1).toUpperCase()	+ firstName.trim().substring(1);
		this.middleInitial = middleInitial.trim().substring(0, 1).toUpperCase();
		this.lastName = lastName.trim().substring(0, 1).toUpperCase() + lastName.trim().substring(1).toLowerCase();
		this.email = email.trim();
		this.password = password;
		this.street = street.trim();
		this.city = city.trim();
		this.state = state.trim().substring(0, 2).toUpperCase();
		this.zipCode = zipCode.trim();
		this.linkedAccounts = linkedAccounts;
	}

	public String getUsername() {
		return username;
	}

	public void setUsername(String username) {
		this.username = username;
	}

	public String getFirstName() {
		return firstName;
	}

	public void setFirstName(String firstName) {
		this.firstName = firstName;
	}

	public String getMiddleInitial() {
		return middleInitial;
	}

	public void setMiddleInitial(String middleInitial) {
		this.middleInitial = middleInitial;
	}

	public String getLastName() {
		return lastName;
	}

	public void setLastName(String lastName) {
		this.lastName = lastName;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public String getStreet() {
		return street;
	}

	public void setStreet(String street) {
		this.street = street;
	}

	public String getCity() {
		return city;
	}

	public void setCity(String city) {
		this.city = city;
	}

	public String getState() {
		return state;
	}

	public void setState(String state) {
		this.state = state;
	}

	public String getZipCode() {
		return zipCode;
	}

	public void setZipCode(String zipCode) {
		this.zipCode = zipCode;
	}

	public String getRole() {
		return role;
	}

	public void setRole(String role) {
		this.role = role;
	}

	public String getLevel() {
		return level;
	}

	public void setLevel(String level) {
		this.level = level;
	}

	public boolean isFirstLogin() {
		return firstLogin;
	}

	public void setFirstLogin(boolean firstLogin) {
		this.firstLogin = firstLogin;
	}

	public ArrayList<String> getLinkedAccounts() {
		return linkedAccounts;
	}

	public void setLinkedAccounts(ArrayList<String> linkedAccounts) {
		this.linkedAccounts = linkedAccounts;
	}

	public String getQuizName() {
		return quizName;
	}

	public void setQuizName(String quizName) {
		this.quizName = quizName;
	}

	
	/*public void setStudent(Person student) {
		this.student = student;
	}*/

}