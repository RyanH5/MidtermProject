package com.skilldistillery.tripping.controllers;

import org.springframework.beans.factory.annotation.Autowired;

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
