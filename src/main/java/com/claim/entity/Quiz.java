package com.claim.entity;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.OneToOne;
import javax.persistence.Table;

@Entity//this tells spring to use Hibernate and map this class to our database column
@Table(name="Quiz")//This tells hibernate the name of the table in our database
public class Quiz {

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name="quizid", updatable = false, nullable = false)
	private Long quizid;
	
	@Column(name="question")
	private String question;

	@Column(name="option1")//To be used for uploading pictures, documents, etc.
	private String option1;

	@Column(name="option2")
	private String option2;

	@Column(name="option3")
	private String option3;
	
	@Column(name="option4")
	private String option4;
	
	@Column(name="answer")
	private String answer;
	
	@Column(name="quizname")
	private String quizname;
	
	@Column(name="username")
	private String username;
	
	@OneToOne
	@JoinColumn(name="username", insertable=false, updatable=false)
	private Person person;

	public Quiz() {}

	public Long getCommunicationid() {
		return quizid;
	}

	public void setCommunicationid(Long communicationid) {
		this.quizid = communicationid;
	}

	public String getQuestion() {
		return question;
	}

	public void setQuestion(String question) {
		this.question = question;
	}

	public String getOption1() {
		return option1;
	}

	public void setOption1(String option1) {
		this.option1 = option1;
	}

	public String getOption2() {
		return option2;
	}

	public void setOption2(String option2) {
		this.option2 = option2;
	}

	public String getOption3() {
		return option3;
	}

	public void setOption3(String option3) {
		this.option3 = option3;
	}

	public String getOption4() {
		return option4;
	}

	public void setOption4(String option4) {
		this.option4 = option4;
	}

	public String getAnswer() {
		return answer;
	}

	public void setAnswer(String answer) {
		this.answer = answer;
	}

	public String getQuizname() {
		return quizname;
	}

	public void setQuizname(String quizname) {
		this.quizname = quizname;
	}

	public String getUsername() {
		return username;
	}

	public void setUsername(String username) {
		this.username = username;
	}

	public Person getPerson() {
		return person;
	}

	public void setPerson(Person person) {
		this.person = person;
	}

}
