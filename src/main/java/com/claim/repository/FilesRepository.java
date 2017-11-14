package com.claim.repository;

import java.util.ArrayList;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import com.claim.entity.Files;
import com.claim.entity.Person;

@Repository
public interface FilesRepository extends JpaRepository <Files, Long> {
		@Query("Select F from Files F")
		public ArrayList<Files> getAllFilesParent();

		/*@Query("")
		public void upload(@Param("")String username, @Param("")String password);
		*/
	}





