package com.skilldistillery.tripping.controllers;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.skilldistillery.tripping.data.AdminDAO;
import com.skilldistillery.tripping.data.UserAuthDAOImpl;
import com.skilldistillery.tripping.entities.User;


public class AdminController {

	@Autowired
	private AdminDAO dao;
	@Autowired 
	private UserAuthDAOImpl userDAO;
	
//	@RequestMapping(path = "adminLogin.do")
//	public ModelAndView adminLogin() {
//		ModelAndView model = new ModelAndView();
//		model.setViewName("user/login");
//		return model;
//	}
	
	@RequestMapping(path = "toggleActiveUser.do")
	public ModelAndView toggleActiveStatus(User user) {
		System.out.println("YOURE DOING IT ****************");
		System.out.println(user);
		ModelAndView model = new ModelAndView();
		dao.adminUpdateUser(user);
		List<User> users = userDAO.findAllUsers();
		model.addObject("users", users);
		model.setViewName("user/allUsers");
		return model;
	}
	
//	@RequestMapping(path = "toggleAdmin.do")
	
}
