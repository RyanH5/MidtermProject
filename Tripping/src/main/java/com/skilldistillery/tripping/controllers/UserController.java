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

	@RequestMapping(value = { "doUserCRUD" })
	public String index(Model model) {
		return null;

		
//		List<PointOfInterest> points = dao.getPointsByDestination(1);
//		model.addAttribute("allpoints", points);
////		List<Amenity> amenities = dao.getAmenitiesByPoint(1);
////		List<Activity> activities = dao.getActivitiesByPoint(1);
////		model.addAttribute("point",dao.findPointOfInterestById(1));
// 		model.addAttribute("allpoints", points);
//// 		model.addAttribute("amenities", amenities);
//// 		model.addAttribute("activities", activities);
//		return "index";
	}
	

	
	@RequestMapping(path = "doUserCRUD.do")
	public String viewUserById(Integer id, Model model) {
		User user = dao.findUserById(id);
		model.addAttribute("user", user);
		return "viewUser";
	}

}