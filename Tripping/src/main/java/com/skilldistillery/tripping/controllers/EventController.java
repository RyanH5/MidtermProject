package com.skilldistillery.tripping.controllers;

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
		System.out.println(event);
		model.addObject("event", event);
		model.setViewName("entity/viewEvent");
		return model;
	}
}
