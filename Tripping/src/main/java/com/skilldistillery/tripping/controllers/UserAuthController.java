package com.skilldistillery.tripping.controllers;

import javax.persistence.TemporalType;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.validation.Errors;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.method.support.ModelAndViewContainer;
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
	
	@RequestMapping(path = "createUser.do")
	public ModelAndView register(ModelAndView model, User user) {
		System.out.println(user);
		dao.createNewUser(user);
		model.setViewName("user/profile");
		return model;
	}
	
	@RequestMapping(path = "userLogin.do", method=RequestMethod.GET)
	public String login(User user, Errors errors, HttpSession session) {
		user = dao.findUserByUserNameAndPassword(user.getUserName(), user.getPassword());
		session.setAttribute("user", user);
		return "user/profile";
	}
	
//	@RequestMapping(path = "")
	
}
