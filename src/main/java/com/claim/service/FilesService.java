package com.claim.service;

import java.io.File;
import java.util.ArrayList;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Service;

import com.claim.entity.Files;
import com.claim.repository.FilesRepository;
import com.claim.repository.PersonRepository;

@Service
public class FilesService {
	
	@PersistenceContext
	private EntityManager entityManager;

	@Autowired
	private FilesRepository filesRepository;
	

	
	
	@Transactional
	public ArrayList<Files> getAllFilesParent(){
		return filesRepository.getAllFilesParent();
	}
	
	@Transactional
	public Files findFileById(Long id){
		return filesRepository.findOne(id);
	}

	@Transactional
	public void upload() {
	}

}
