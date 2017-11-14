package com.claim.service;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.claim.entity.Scheduler;
import com.claim.repository.SchedulerRepository;

@Service
public class SchedulerService {

	@PersistenceContext
	private EntityManager entityManager;

	@Autowired
	private SchedulerRepository schedulerRepository;
	
	private static final String fileSql = "";

	@Transactional
	public Scheduler getSchedule(Scheduler scheduler) {
		return scheduler;
	}

	@Transactional
	public void setSchedule() {
	}
	
}
