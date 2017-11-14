package com.claim.entity;

import java.sql.Timestamp;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.OneToOne;
import javax.persistence.Table;

import org.hibernate.annotations.CreationTimestamp;

@Entity//this tells spring to use Hibernate and map this class to our database column
@Table(name="communication")//This tells hibernate the name of the table in our database

public class Post {
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name="communicationid", updatable = false, nullable = false)
	private Long communicationid;
	
	@Column(name="message")
	private String message;

	@Column(name="file")//To be used for uploading pictures, documents, etc.
	private String file;

	@Column(name="username")
	private String username;

	@CreationTimestamp
	@Column(name="timestamp")
	private Timestamp timestamp;
	
	@OneToOne
	@JoinColumn(name="username", insertable=false, updatable=false)
	private Person person;

	public Post() {}
	
	public Long getCommunicationid() {
		return communicationid;
	}

	public void setCommunicationid(Long communicationid) {
		this.communicationid = communicationid;
	}

	public String getMessage() {
		return message;
	}

	public void setMessage(String message) {
		this.message = message;
	}

	public String getFile() {
		return file;
	}

	public void setFile(String file) {
		this.file = file;
	}

	public String getUsername() {
		return username;
	}

	public void setUsername(String username) {
		this.username = username;
	}

	public Timestamp getTimestamp() {
		return timestamp;
	}

	public void setTimestamp(Timestamp timestamp) {
		this.timestamp = timestamp;
	}

	public Person getPerson() {
		return person;
	}

	public void setPerson(Person person) {
		this.person = person;
	}

}
