package com.skilldistillery.tripping.controllers;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.validation.Errors;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.skilldistillery.tripping.data.UserAuthDAO;
import com.skilldistillery.tripping.entities.JournalEntry;
import com.skilldistillery.tripping.entities.User;

@Controller
public class UserAuthController {

	@Autowired
	private UserAuthDAO dao;
	
	@RequestMapping(path = "loginOrRegister.do")
	public ModelAndView registerOrLogin() {
		ModelAndView model = new ModelAndView();
		model.setViewName("user/login");
		return model;
	}
	@RequestMapping(path = "/")
	public ModelAndView goHome() {
		ModelAndView model = new ModelAndView();
		model.setViewName("index");
		return model;
	}
	
	@RequestMapping(path = "userRegister.do")
	public ModelAndView registerUser(ModelAndView model, User user) {
		model.setViewName("user/register");
		return model;
	}
	
	@RequestMapping(path = "createUser.do")
	public ModelAndView register(ModelAndView model, User newuser, HttpSession session) {
		System.out.println(newuser);
		User user = dao.createNewUser(newuser);
		System.out.println(user);
		session.setAttribute("user", user);
		model.setViewName("user/profile");
		return model;
	}
	
	@RequestMapping(path = "userLogin.do", method=RequestMethod.GET)
	public ModelAndView login(User user, Errors errors, HttpSession session, ModelAndView model) {
			user = dao.findUserByUserNameAndPassword(user.getUserName(), user.getPassword());
			user.getJournalEntries();
			session.setAttribute("user", user);
			System.out.println("===============================================================");
			System.out.println(user.getJournalEntries().get(0).isComplete());
			List<JournalEntry> futureTrips = new ArrayList<>();
			List<JournalEntry> pastTrips = new ArrayList<>();
			for (int i = 0; i < user.getJournalEntries().size(); i++) {
				if(user.getJournalEntries().get(i).isComplete()) {
					pastTrips.add(user.getJournalEntries().get(i));
				}	else {
					pastTrips.add(user.getJournalEntries().get(i));
				}
			}
			
			model.addObject("futureTrips", futureTrips);
			model.addObject("pastTrips", pastTrips);
			model.setViewName("user/profile");
			return model;
	}
	
	@RequestMapping(path = "userLogout.do", method=RequestMethod.GET)
	public String logout(HttpSession session) {
		session.removeAttribute("user");
		return "index";	
	}
	@RequestMapping(path = "viewUsers.do")
	public ModelAndView viewAllUsers(ModelAndView modelAndView ) {
		modelAndView.setViewName("user/allUsers");
		List<User> users = dao.findAllUsers();
		modelAndView.addObject("users", users);
		return modelAndView;	
	}
	
}
