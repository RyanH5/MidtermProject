package com.skilldistillery.tripping.controllers;

import java.util.List;

import javax.servlet.http.HttpSession;

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

	@RequestMapping(value = { "viewPoints.do" })
	public String index(Model model, HttpSession session, int id) {
		List<PointOfInterest> points = dao.getPointsByDestination(id);
		model.addAttribute("allpoints", points);
//		List<Amenity> amenities = dao.getAmenitiesByPoint(1);
//		List<Activity> activities = dao.getActivitiesByPoint(1);
//		model.addAttribute("point",dao.findPointOfInterestById(1));
 		model.addAttribute("allpoints", points);
// 		model.addAttribute("amenities", amenities);
// 		model.addAttribute("activities", activities);
 		System.out.println(session.getCreationTime());
		return "entities/viewPoints";
	}
	
	@RequestMapping(path = "viewPoint.do")
	public String viewPointById(Integer id, Model model, HttpSession session) {
		PointOfInterest point = dao.findPointOfInterestById(id);
		model.addAttribute("point", point);
		return "entity/viewPoint";
	}

}