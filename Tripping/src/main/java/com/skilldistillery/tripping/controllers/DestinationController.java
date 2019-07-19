package com.skilldistillery.tripping.controllers;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.skilldistillery.tripping.data.DestinationDAO;
import com.skilldistillery.tripping.entities.Destination;
import com.skilldistillery.tripping.entities.PointOfInterest;

@Controller
public class DestinationController {

	@Autowired
	private DestinationDAO dao;
	
	@RequestMapping(value= {"viewDestination.do"})
	public ModelAndView getDestination(ModelAndView model, int id) {
		Destination dest = dao.findDestinationById(id);
		model.addObject("dest", dest);
		model.setViewName("entity/viewDestination");
		return model;
	}
	
	@RequestMapping(value= {"viewDestinations.do"})
	public ModelAndView getDestinations(ModelAndView model) {
		List<Destination> dests = dao.getAllDestinations();
		model.addObject("dests", dests);
		model.setViewName("entities/viewDestinations");
		return model;
	}
}
	