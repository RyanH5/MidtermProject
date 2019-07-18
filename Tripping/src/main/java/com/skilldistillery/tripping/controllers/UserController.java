package com.skilldistillery.tripping.controllers;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.skilldistillery.tripping.data.PointOfInterestDAO;
import com.skilldistillery.tripping.data.UserDAO;
import com.skilldistillery.tripping.entities.PointOfInterest;
import com.skilldistillery.tripping.entities.User;

@Controller
public class UserController {

	@Autowired
	private UserDAO dao;

	@RequestMapping(value = { "showUser" })
	public String index(Model model) {
		return null;
	}

	@RequestMapping(path = "showUser.do")
	public String viewUserById(Integer id, Model model) {
		User user = dao.findUserById(id);
		model.addAttribute("user", user);
		return "viewUser";
	}

}