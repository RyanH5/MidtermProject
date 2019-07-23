package com.skilldistillery.tripping.controllers;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.skilldistillery.tripping.data.EventDAO;
import com.skilldistillery.tripping.entities.Event;
import com.skilldistillery.tripping.entities.JournalEntry;

@Controller
public class EventController {

	@Autowired
	private EventDAO dao;

	@RequestMapping(path = "viewEvent.do")
	public ModelAndView viewEvent(ModelAndView model, int id) {
		JournalEntry journalentryholder = new JournalEntry();
		Event event = dao.findEventById(id);
		event.getImages();
		model.addObject("journalEntry", journalentryholder);
		model.addObject("event", event);
		model.setViewName("entity/viewEvent");
		return model;
	}

	@RequestMapping(path = "viewEventsByDestination.do")
	public ModelAndView viewEvents(int id, ModelAndView model) {
		JournalEntry journalentryholder = new JournalEntry();
		List<Event> events = dao.getEventsByDestination(id);
		model.addObject("events", events);
		model.addObject("journalEntry", journalentryholder);
		model.setViewName("entities/viewEvents");
		return model;
	}

	@RequestMapping(path = "viewEvents.do")
	public ModelAndView viewAllEvents(ModelAndView model) {
		JournalEntry journalentryholder = new JournalEntry();
		List<Event> events = dao.getAllEvents();
		model.addObject("events", events);
		model.setViewName("entities/viewEvents");
		model.addObject("journalEntry", journalentryholder);
		return model;
	}
}
