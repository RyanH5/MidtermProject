package com.skilldistillery.tripping.controllers;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.skilldistillery.tripping.data.PointOfInterestDAO;
import com.skilldistillery.tripping.entities.PointOfInterest;
import com.skilldistillery.tripping.entities.User;

@Controller
public class PointOfInterestController {

	@Autowired
	private PointOfInterestDAO dao;

	@RequestMapping(path = "viewPoint.do")
	public ModelAndView viewPoint(ModelAndView model, User user) {
		System.out.println(user);
		List<PointOfInterest> allpoints = dao.getPointsByDestination(1);
		model.addObject("allpoints", allpoints);
		model.setViewName("entity/viewPoint");
		return model;
	}
	
	@RequestMapping(path = "viewPoints.do")
	public ModelAndView viewPoints(ModelAndView model, User user) {
		System.out.println(user);
		List<PointOfInterest> allpoints = dao.getPointsByDestination(1);
		model.addObject("allpoints", allpoints);
		model.setViewName("entities/viewPoints");
		return model;
	}

}
