package com.skilldistillery.tripping.controllers;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.skilldistillery.tripping.data.EventDAO;
import com.skilldistillery.tripping.entities.Event;

@Controller
public class EventController {

	@Autowired
	private EventDAO dao;
	
	@RequestMapping(path = "viewEvent.do")
	public ModelAndView viewEvent(ModelAndView model, int id) {
		Event event = dao.findEventById(id);
		model.addObject("event", event);
		model.setViewName("entity/viewEvent");
		return model;
	}
	
	@RequestMapping(path = "viewEventsByDestination.do")
	public ModelAndView viewEvents(int id, ModelAndView model) {
		List<Event> events = dao.getEventsByDestination(id);
		model.addObject("events", events);
		model.setViewName("entities/viewEvents");
		return model;
	}
}
