package com.skilldistillery.tripping.controllers;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.skilldistillery.tripping.data.PointOfInterestDAO;
import com.skilldistillery.tripping.entities.PointOfInterest;

@Controller
public class PointOfInterestController {

	@Autowired
	private PointOfInterestDAO dao;

	@RequestMapping(value = { "viewPoint" })
	public String index(Model model) {
		List<PointOfInterest> points = dao.getPointsByDestination(1);
		model.addAttribute("allpoints", points);
//		List<Amenity> amenities = dao.getAmenitiesByPoint(1);
//		List<Activity> activities = dao.getActivitiesByPoint(1);
//		model.addAttribute("point",dao.findPointOfInterestById(1));
 		model.addAttribute("allpoints", points);
// 		model.addAttribute("amenities", amenities);
// 		model.addAttribute("activities", activities);
		return "viewPoint";
	}
	
	@RequestMapping(path = "getPoint.do")
	public String viewPointById(Integer id, Model model) {
		PointOfInterest point = dao.findPointOfInterestById(id);
		model.addAttribute("point", point);
		return "viewPoint";
	}

}