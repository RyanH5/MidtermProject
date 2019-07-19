package com.skilldistillery.tripping.controllers;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.validation.Errors;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.skilldistillery.tripping.data.UserAuthDAO;
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
	public String login(User user, Errors errors, HttpSession session) {
			user = dao.findUserByUserNameAndPassword(user.getUserName(), user.getPassword());
			user.getJournalEntries();
			session.setAttribute("user", user);
			return "user/profile";
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
