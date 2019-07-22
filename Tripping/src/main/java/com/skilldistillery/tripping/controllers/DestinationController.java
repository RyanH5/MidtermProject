package com.skilldistillery.tripping.controllers;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.skilldistillery.tripping.data.DestinationDAO;
import com.skilldistillery.tripping.entities.Destination;
import com.skilldistillery.tripping.entities.DestinationReview;

@Controller
public class DestinationController {

	@Autowired
	private DestinationDAO dao;
	
	@RequestMapping(value= {"viewDestination.do"})
	public ModelAndView getDestination(ModelAndView model, int id) {
		Destination destination = dao.findDestinationById(id);
		destination.getPoints();
		model.addObject("destination", destination);
		model.setViewName("entity/viewDestination");
		return model;
	}
	
	@RequestMapping(value= {"viewDestinations.do"})
	public ModelAndView getDestinations(ModelAndView model) {
		List<Destination> destinations = dao.getAllDestinations();
		model.addObject("destinations", destinations);
		model.setViewName("entities/viewDestinations");
		return model;
	}
	@RequestMapping(value= {"shellTemplate.do"})
	public ModelAndView getShellTemplate(ModelAndView model) {
		List<Destination> dests = dao.getAllDestinations();
		model.addObject("dests", dests);
		model.setViewName("shelltemplate");
		return model;
	}
	
	@RequestMapping(value= {"createDestination.do"})
	public ModelAndView createDestination(ModelAndView model, Destination destination) {
		Destination created = new Destination("hey","hey");
		dao.createDestination(destination);
		List<Destination> destinations = dao.getAllDestinations();
		model.addObject("destinations", destinations);
		model.addObject("created", created);
		model.setViewName("entities/viewDestinations");
		return model;
	}
	@RequestMapping(value= {"createDestinationReview.do"})
	public ModelAndView createDestinationReview(ModelAndView model, DestinationReview review, int id) {
		review.setDestination(dao.findDestinationById(id));
		review.setReviewText("reviewed");
		dao.createDestinationReview(review);
		model.setViewName("entity/viewDestination");
		return model;
	}
	@RequestMapping(value= {"removeDestination.do"})
	public ModelAndView createDestinationReview(ModelAndView model, int id) {
		Destination removed = dao.findDestinationById(id);
		dao.deleteDestination(id);
		List<Destination> destinations = dao.getAllDestinations();
		model.addObject("destinations", destinations);
		model.setViewName("entities/viewDestinations");
		model.addObject("removed", removed);
		model.setViewName("entities/viewDestinations");
		return model;
	}
}
	