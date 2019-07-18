package com.skilldistillery.tripping.controllers;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.validation.Errors;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.skilldistillery.tripping.data.UserDAO;
import com.skilldistillery.tripping.entities.User;

@Controller
public class UserController {

	@Autowired
	private UserDAO dao;
	
	@RequestMapping(path = "viewUser.do")
	public ModelAndView viewUserById(ModelAndView model, Integer id) {
		User user = dao.findUserById(id);
		model.addObject("user", user);
		model.setViewName("user/viewUser");
		return model;
	}
	
	@RequestMapping(path = "viewProfile.do")
	public ModelAndView viewUserById(ModelAndView model, Errors errors, HttpSession session) {
		model.setViewName("user/profile");
		return model;
	}

}