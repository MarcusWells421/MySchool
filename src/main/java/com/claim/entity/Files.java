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
@Table(name="files")//This tells hibernate the name of the table in our database

public class Files {

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name="fileid", updatable = false, nullable = false)
	private Long fileid;
	
	
	@Column(name="filename")
	private String filename;

	@Column(name="filepath")
	private String filepath;
	
	@Column(name="username")
	private String username;
	
	@OneToOne
	@JoinColumn(name="username", insertable=false, updatable=false)
	private Person person;

	public Files() {}

	public Long getFileid() {
		return fileid;
	}

	public void setFileid(Long fileid) {
		this.fileid = fileid;
	}

	

	public String getFilename() {
		return filename;
	}

	public void setFilename(String filename) {
		this.filename = filename;
	}

	public String getFilepath() {
		return filepath;
	}

	public void setFilepath(String filepath) {
		this.filepath = filepath;
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
