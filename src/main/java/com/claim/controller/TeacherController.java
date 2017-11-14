package com.claim.controller;

import java.util.ArrayList;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.claim.entity.Event;
import com.claim.entity.Files;
import com.claim.entity.Person;
import com.claim.entity.Post;
import com.claim.service.FilesService;
import com.claim.service.PersonService;
import com.claim.service.PostService;
import com.claim.service.SendMail;

@Controller
public class TeacherController {
	
	@Autowired
	private PostService postService;
	
	@Autowired
	PersonService personService;
	
	@Autowired
	private FilesService filesService;
	
	@Autowired
	private SendMail sendMail;

	@RequestMapping(value = "/takeQuiz", method = RequestMethod.GET)
	public ModelAndView takeQuiz(Model model, @RequestParam("quizName")String quizName, HttpSession session) {
		Person p = (Person)session.getAttribute("loggedInUser");
		ArrayList<Files> fileList = filesService.getAllFilesParent();
		ArrayList<Event> eventList = new ArrayList<Event>();
		Event event1 = new Event("No School: Professional Development", "Friday\r\nNovember 10, 2017", "", "/img/School-Closed.jpg");
		Event event2 = new Event("PTA Meeting", "Monday\r\nNovember 13, 2017\r\n6:30PM", "Main Campus", "/img/PTA-Meeting.jpg");
		Event event3 = new Event("Talent Show", "Wednesday\r\nNovember 17, 2017\r\n1:00PM", "Auditorium", "/img/Talent-Show.jpg");
		eventList.add(event1);
		eventList.add(event2);
		eventList.add(event3);
		session.setAttribute("loggedInUser", p);
		session.setAttribute("fileList", fileList);
		session.setAttribute("eventList", eventList);
		 
		this.addUserPost(model, p.getUsername());
		personService.addQuizToStudents(quizName);
		session.setAttribute("quizAdded", quizName + " Quiz sent!");		
		return new ModelAndView("home");
	}
	
	private void addUserPost(Model model, String username) {
		model.addAttribute("post", new Post());
		model.addAttribute("posts", postService.findMyPost(username));
	}
	
	
	@RequestMapping(value = "/showScore")
	public ModelAndView showScore(Model model, @RequestParam("myResult")int quizScore, HttpSession session) {
		System.out.println("Works!!! "+quizScore);
		session.removeAttribute("questions");
		Person p = (Person)session.getAttribute("loggedInUser");
		 if(p.getEmail() != null) {	
		sendMail.sendMail(p.getEmail(), "Quiz results", "Dear "+p.getFirstName()+":\r\nThe quiz you took today has been scored.\r\n"
				+ "Your quiz score is: " + quizScore+". This score has been sent to your teacher. Have a wonderful day.\r\nSincerely,\r\n"
				+ "The MySchool Team");
		 }
		
		ArrayList<Files> fileList = filesService.getAllFilesParent();
		ArrayList<Event> eventList = new ArrayList<Event>();
		Event event1 = new Event("No School: Professional Development", "Friday\r\nNovember 10, 2017", "", "/img/School-Closed.jpg");
		Event event2 = new Event("PTA Meeting", "Monday\r\nNovember 13, 2017\r\n6:30PM", "Main Campus", "/img/PTA-Meeting.jpg");
		Event event3 = new Event("Talent Show", "Wednesday\r\nNovember 17, 2017\r\n1:00PM", "Auditorium", "/img/Talent-Show.jpg");
		eventList.add(event1);
		eventList.add(event2);
		eventList.add(event3);
		session.setAttribute("loggedInUser", p);
		session.setAttribute("fileList", fileList);
		session.setAttribute("eventList", eventList);
		p.setQuizName(null);
		personService.signUp(p);
		this.addUserPost(model, p.getUsername());
		session.setAttribute("quizMailed", "Your quiz result has been mailed to you!");
		return new ModelAndView("home");

	}
	
}
