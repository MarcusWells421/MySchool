package com.claim.controller;

import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.OutputStream;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.commons.io.FileUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.claim.entity.Event;
import com.claim.entity.Files;
import com.claim.entity.Person;
import com.claim.entity.Post;
import com.claim.entity.Quiz;
import com.claim.service.FilesService;
import com.claim.service.PersonService;
import com.claim.service.PostService;
import com.claim.service.QuizService;
import com.claim.service.SendMail;

@Controller
public class UserController {

	@Autowired
	private PersonService personService;

	@Autowired
	private SendMail sendMail;

	@Autowired
	private PostService postService;
	
	@Autowired
	private QuizService quizService;

	@Autowired
	private FilesService filesService;

	@RequestMapping("/") // the root of your website is the index page
	public String index() {
		return "index"; // tell Spring to to find and display the index page
	}

	@RequestMapping(value = "/iframe", method = RequestMethod.GET)
	public ModelAndView signupOrLogin(Model model) {
		return new ModelAndView("iframelogin", "userLogin", new Person());
	}

	@RequestMapping(value = "/homebutton", method = RequestMethod.GET)
	public ModelAndView homeButton(Model model, HttpSession session) {
	Person p = (Person) session.getAttribute("loggedInUser");
	if(p != null) {
		return new ModelAndView("home", "userLogin", p);
		} else {
		return new ModelAndView("/", "userLogin", new Person());
		}
	}

	@RequestMapping(value = "/signup", method = RequestMethod.GET)
	public ModelAndView signup() {
		return new ModelAndView("signup", "userLogin", new Person());
	}

	@RequestMapping(value = "/login", method = RequestMethod.GET)
	public ModelAndView login(Model model) {
		return new ModelAndView("login", "userLogin", new Person());
	}

	@RequestMapping(value = "/signup", method = RequestMethod.POST)
	public ModelAndView signup(Model model, @ModelAttribute("userLogin") Person newUser, HttpSession session) {
		String userRole = newUser.getRole().trim().substring(0, 1).toUpperCase()
				+ newUser.getRole().trim().substring(1);
		this.personService.signUp(newUser);
		
		  if(newUser.getEmail() != null) {
			  this.sendMail.sendMail(newUser.getEmail(), "Welcome to MySchool",
					  "Welcome, and thank you for joining MySchool! " +
		  "We're opening the lines of communication to produce better results!\r\n\r\n"
		  + "You have declared that your role is " + (userRole.equalsIgnoreCase("Admin")
		  ? "an " : "a ") + userRole + ". If your role is incorrect, please contact our " 
		  + "support team, who can make the account correction.\r\n\r\n"
		  + "Thank you again for joining MySchool!\r\n\r\nSincerely,\r\nThe MySchool Team");
		  }

		newUser.setFirstLogin(true);
		model.addAttribute("message", "Sign up successful you may now login.");
		if (userRole.equalsIgnoreCase("parent")) {
			// add list of files to session
			session.setAttribute("fileList", filesService.getAllFilesParent());
//************************************************************************************
			session.setAttribute("parentusername", newUser.getUsername());
			session.setAttribute("parent", newUser);
			newUser = null;
			return new ModelAndView("studentinfo","student", new Person());
//************************************************************************************			
//			return new ModelAndView("studentinfo", "userLogin", newUser); //line removed to try this experiment
		} else {
			return new ModelAndView("iframelogin", "userLogin", newUser);
		}
	}

	@RequestMapping(value = "/login", method = RequestMethod.POST)
	public ModelAndView handlelogin(Model model, @ModelAttribute("userLogin") Person userLogin, HttpSession session,
			HttpServletResponse response, HttpServletRequest request) throws IOException {
		Person p = this.personService.login2(userLogin.getUsername(), userLogin.getPassword());
		if (p != null) {
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
			if(p.getRole().equalsIgnoreCase("Teacher")) 
			{
				ArrayList<String> quizNames = quizService.getAllQuizNames();
				session.setAttribute("quizNames", quizNames);				
			}
			if(p.getRole().equalsIgnoreCase("Student") && (p.getQuizName()==null? false: !(p.getQuizName().isEmpty()))) {
				ArrayList<Quiz> questions = quizService.getQuiz(p.getQuizName());
				session.setAttribute("questions", questions);
			}
			
			return new ModelAndView("home");
		} else {
			model.addAttribute("message", "The Username or Password entered is invalid");
			return new ModelAndView("iframelogin", "userLogin", new Person());
		}
	}

	@RequestMapping(value = "/download", method = RequestMethod.GET)
	public ModelAndView downloadFile(Model model, @RequestParam("fileId") Long id, HttpServletRequest request,
			HttpServletResponse response) throws IOException {
		Files myFile = filesService.findFileById(id);

		ServletContext context = request.getServletContext();
		String appPath = context.getRealPath("") + "\\downloadedFiles\\";
		System.out.println("appPath = " + appPath);

		// construct the complete absolute path of the file
		String fullPath = appPath + myFile.getFilename();
		File downloadFile = new File(fullPath);
		FileInputStream inputStream = new FileInputStream(downloadFile);

		// get MIME type of the file
		String mimeType = context.getMimeType(fullPath);
		if (mimeType == null) {
			// set to binary type if MIME mapping not found
			mimeType = "application/octet-stream";
		}
		System.out.println("MIME type: " + mimeType);

		// set content attributes for the response
		response.setContentType(mimeType);
		response.setContentLength((int) downloadFile.length());

		// set headers for the response
		String headerKey = "Content-Disposition";
		String headerValue = String.format("attachment; filename=\"%s\"", downloadFile.getName());
		response.setHeader(headerKey, headerValue);

		// get output stream of the response
		OutputStream outStream = response.getOutputStream();

		byte[] buffer = new byte[4096];
		int bytesRead = -1;

		// write bytes read from the input stream into the output stream
		while ((bytesRead = inputStream.read(buffer)) != -1) {
			outStream.write(buffer, 0, bytesRead);
		}

		inputStream.close();
		// outStream.close();

		return new ModelAndView("home");
	}

	@RequestMapping(value = "/addstudent", method = RequestMethod.POST)
	public ModelAndView addStudent(Model model, @ModelAttribute("student") Person student, HttpSession session) {
//************************************************************************************
		session.setAttribute("studentusername", student.getUsername());
		Person parent = (Person)session.getAttribute("parent");
		String studentUsername = student.getUsername();
		String parentUsername = (String)session.getAttribute("parentusername");
		ArrayList<String> addToLinkedList = parent.getLinkedAccounts();
		if( addToLinkedList == null) {
		    addToLinkedList = new ArrayList<String>();
		}
		addToLinkedList.add(studentUsername);
		parent.setLinkedAccounts(addToLinkedList);
		personService.signUp(parent);
		for(String x : parent.getLinkedAccounts()) {
			System.out.println(x);
		}
		addToLinkedList.clear();
		student.setRole("Student");
		this.personService.signUp(student);
		
		student.getLinkedAccounts().add(parentUsername);
		
		session.setAttribute("parent", parent);
//		personService.addStudentUsernameToParentRecord(parentUsername, addToLinkedList); //Adds student username to linkedAccounts list on parent Person object
		
//************************************************************************************
		return new ModelAndView("studentinfo", "student", new Person());
	}

	@RequestMapping(value = "/parentsignupcomplete", method = RequestMethod.POST)
	public ModelAndView parentsignupcomplete(Model model, @ModelAttribute("userLogin") Person newUser) {
		model.addAttribute("message", "Sign up successful you may now login.");
		return new ModelAndView("iframelogin", "userLogin", newUser);
	}

	@RequestMapping(value = "/post", method = RequestMethod.POST)
	public String post(Model model, @ModelAttribute("post") Post post) {
		List<Post> posts = postService.savePost(post);
		this.addUserPost(model, post.getUsername());
		return "home";
	}

	@RequestMapping(value = "/upload", method = RequestMethod.POST)
	public String upload(@RequestParam("file") MultipartFile file, HttpSession session, Model model) {

		Person p = (Person) session.getAttribute("loggedInUser");
		if (!file.isEmpty()) {
			try {
				String name = file.getOriginalFilename();
				String basepath = "C:\\Users\\Marcus Anthony Wells\\eclipse-workspace\\myschool\\src\\main\\resources\\static\\img\\";
				String path = basepath + p.getUsername() + "\\" + name;
				String userPath = "/img/" + p.getUsername() + "/" + name;

				File fileToUpload = new File(path);
				FileUtils.writeByteArrayToFile(fileToUpload, file.getBytes());

//				p.setProfilePic(userPath);
				personService.signUp(p);

			} catch (Exception e) {

			}

		}
		this.addUserPost(model, p.getUsername());
		return "home";
	}

	private void addUserPost(Model model, String username) {
		model.addAttribute("post", new Post());
		model.addAttribute("posts", postService.findMyPost(username));
	}

}