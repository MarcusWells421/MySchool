package com.claim.repository;

import java.util.ArrayList;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import com.claim.entity.Files;
import com.claim.entity.Person;
import com.claim.entity.Quiz;

@Repository
public interface QuizRepository extends JpaRepository <Quiz, Long> {

		@Query("select distinct Q.quizname from Quiz Q")
		public ArrayList<String> getAllQuizNames();

		@Query("select Q from Quiz Q where Q.quizname=:quizName")
		public ArrayList<Quiz> getQuiz(@Param("quizName")String quizName);
}
