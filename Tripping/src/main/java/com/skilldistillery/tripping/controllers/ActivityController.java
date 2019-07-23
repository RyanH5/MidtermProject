package com.skilldistillery.tripping.controllers;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.skilldistillery.tripping.data.ActivityDAO;
import com.skilldistillery.tripping.data.DestinationDAO;
import com.skilldistillery.tripping.data.EventDAO;
import com.skilldistillery.tripping.entities.Activity;
import com.skilldistillery.tripping.entities.Destination;
import com.skilldistillery.tripping.entities.Event;
import com.skilldistillery.tripping.entities.JournalEntry;

@Controller
public class ActivityController {

	@Autowired
	private ActivityDAO dao;
	@Autowired
	private DestinationDAO dao2;
	@Autowired
	private EventDAO dao3;
	
	@ModelAttribute("JournalEntry")
	public JournalEntry populateEntry() {
		JournalEntry entry = new JournalEntry();
		return entry;
	}
	
	@RequestMapping(value= {"viewActivity.do", })
	public ModelAndView getActivity(ModelAndView model, int id) {
		JournalEntry journalentryholder = new JournalEntry();
		Activity activity = dao.findActivityById(id);
		model.addObject("activity", activity);
		model.addObject("journalEntry", journalentryholder);
		model.setViewName("entity/viewActivity");
		return model;
	}
	
	@RequestMapping(value= {"viewActivities.do"})
	public ModelAndView getActivities(ModelAndView model) {
		JournalEntry journalentryholder = new JournalEntry();
		model.addObject("journalEntry", journalentryholder);
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
	