package com.claim.service;

import java.util.ArrayList;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.claim.entity.Person;
import com.claim.repository.PersonRepository;

@Service
public class PersonService {

		@PersistenceContext
		private EntityManager entityManager;
		
		@Autowired
		private PersonRepository personRepository;
		
		private static final String loginSql = "select P.* from Person P where P.username=:username and P.password=:password";
		
		@Transactional
		public Person login(String username, String password) {
			return (Person) entityManager.createNativeQuery(loginSql, Person.class)
					.setParameter("username", username)
					.setParameter("password", password)
					.getSingleResult();
		}

		@Transactional
		public Person login2(String username, String password) {
			return this.personRepository.login(username, password);
		}
		
		@Transactional
		public Person signUp(Person person) {
			return this.personRepository.save(person);
		}
		
		@Transactional//This is your mess
		public Person signupOrLogin(String username, String password, Person person) {
			if(personRepository.login(username, password) != null) {
				return this.personRepository.login(username, password);
			} else {
				return this.personRepository.save(person);
			}
		}

		@Transactional
		public void addQuizToStudents(String quizName) {
			personRepository.addQuizToStudents(quizName);
		}

}