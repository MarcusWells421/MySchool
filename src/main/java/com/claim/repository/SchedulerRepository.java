package com.claim.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import com.claim.entity.Files;
import com.claim.entity.Person;

@Repository
public class SchedulerRepository {
	public interface PersonRepository extends JpaRepository <Person, String> {

		@Query("")
		public Files getSchedule(@Param("")String username, @Param("")String password);

		@Query("")
		public void setSchedule(@Param("")String username, @Param("")String password);
		
	}

}
