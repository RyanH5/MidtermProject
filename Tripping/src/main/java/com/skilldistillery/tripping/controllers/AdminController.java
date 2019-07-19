package com.skilldistillery.tripping.controllers;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.skilldistillery.tripping.data.AdminDAO;


public class AdminController {

	@Autowired
	private AdminDAO dao;
	
//	@RequestMapping(path = "adminLogin.do")
//	public ModelAndView adminLogin() {
//		ModelAndView model = new ModelAndView();
//		model.setViewName("user/login");
//		return model;
//	}
}
