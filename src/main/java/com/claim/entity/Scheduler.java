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
@Table(name="scheduler")//This tells hibernate the name of the table in our database

public class Scheduler {
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name="scheduleid", updatable = false, nullable = false)
	private Long communicationid;
	
	@Column(name="date")
	private String date;

	@Column(name="time")//To be used for uploading pictures, documents, etc.
	private String time;

	@Column(name="confirmed")
	private boolean confirmed;

	@Column(name="username")
	private String username;
	
	@OneToOne
	@JoinColumn(name="username", insertable=false, updatable=false)
	private Person person;

	public Scheduler() {}

	public Long getCommunicationid() {
		return communicationid;
	}

	public void setCommunicationid(Long communicationid) {
		this.communicationid = communicationid;
	}

	public String getDate() {
		return date;
	}

	public void setDate(String date) {
		this.date = date;
	}

	public String getTime() {
		return time;
	}

	public void setTime(String time) {
		this.time = time;
	}

	public boolean isConfirmed() {
		return confirmed;
	}

	public void setConfirmed(boolean confirmed) {
		this.confirmed = confirmed;
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
