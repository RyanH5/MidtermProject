package com.skilldistillery.tripping.controllers;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.skilldistillery.tripping.data.ActivityDAO;
import com.skilldistillery.tripping.data.DestinationDAO;
import com.skilldistillery.tripping.data.EventDAO;
import com.skilldistillery.tripping.entities.Activity;
import com.skilldistillery.tripping.entities.Destination;
import com.skilldistillery.tripping.entities.Event;

@Controller
public class ActivityController {

	@Autowired
	private ActivityDAO dao;
	@Autowired
	private DestinationDAO dao2;
	@Autowired
	private EventDAO dao3;
	
	@RequestMapping(value= {"viewActivity.do"})
	public ModelAndView getActivity(ModelAndView model, int id) {
		Activity activity = dao.findActivityById(id);
		model.addObject("activity", activity);
		model.setViewName("entity/viewActivity");
		return model;
	}
	
	@RequestMapping(value= {"viewActivities.do"})
	public ModelAndView getActivities(ModelAndView model) {
		List<Activity> activities = dao.getAllActivities();
		model.addObject("activities", activities);
		List<Destination> destinations = dao2.getAllDestinations();
		model.addObject("destinations", destinations);
		List<Event> events = dao3.getAllEvents();
		model.addObject("events", events);
		model.setViewName("entities/viewActivities");
		return model;
	}
	
	
}
	