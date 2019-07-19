package com.skilldistillery.tripping.controllers;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.skilldistillery.tripping.data.ActivityDAO;
import com.skilldistillery.tripping.entities.Activity;

@Controller
public class ActivityController {

	@Autowired
	private ActivityDAO dao;
	
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
		model.setViewName("entities/viewActivities");
		return model;
	}
}
	