package com.claim.service;

import java.io.File;
import java.util.ArrayList;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Service;

import com.claim.entity.Quiz;
import com.claim.repository.QuizRepository;

@Service
public class QuizService {

	@PersistenceContext
	private EntityManager entityManager;

	@Autowired
	private QuizRepository quizRepository;
	
	private static final String fileSql = "";

	@Transactional
	public ArrayList<String> getAllQuizNames() {
		return quizRepository.getAllQuizNames();
	}

	@Transactional
	public ArrayList<Quiz> getQuiz(String quizName){
		return quizRepository.getQuiz(quizName);
	}

}
