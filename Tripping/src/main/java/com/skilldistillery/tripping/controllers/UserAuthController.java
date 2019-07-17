package com.skilldistillery.tripping.controllers;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
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
		return model;
	}
	
}
