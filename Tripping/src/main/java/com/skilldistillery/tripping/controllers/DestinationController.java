package com.skilldistillery.tripping.controllers;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.skilldistillery.tripping.data.DestinationDAO;
import com.skilldistillery.tripping.entities.PointOfInterest;

@Controller
public class DestinationController {


	@Autowired
	private DestinationDAO dao;
	
	@RequestMapping(value= {"/", "index", "home.do" })
	public String index(Model model) {
		List<PointOfInterest> points = dao.getPointsByDestination(1);
		model.addAttribute("allpoints", points);
		model.addAttribute("allpoints", points);
		
		return "index";
	}
}
	