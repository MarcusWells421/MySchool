package com.claim.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import com.claim.entity.Person;

@Repository
public interface PersonRepository extends JpaRepository <Person, String> {

	@Query("Select P from Person P where P.username=:username and P.password=:password")
	public Person login(@Param("username")String username, @Param("password")String password);

	@Modifying
	@Query("Update Person P set P.quizName=:quizName where P.role='Student'")
	public void addQuizToStudents(@Param("quizName")String quizName);


}
