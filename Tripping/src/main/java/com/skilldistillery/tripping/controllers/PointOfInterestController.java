package com.skilldistillery.tripping.controllers;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.skilldistillery.tripping.data.JournalEntryDAO;
import com.skilldistillery.tripping.data.PointOfInterestDAO;
import com.skilldistillery.tripping.data.UserDAO;
import com.skilldistillery.tripping.entities.JournalEntry;
import com.skilldistillery.tripping.entities.PointOfInterest;
import com.skilldistillery.tripping.entities.User;

@Controller
public class PointOfInterestController {
	
	@Autowired
	private UserDAO dao3;

	@Autowired
	private PointOfInterestDAO dao;
	@Autowired
	private JournalEntryDAO dao2;
	
	@ModelAttribute("JournalEntry")
	public JournalEntry populateEntry() {
		JournalEntry entry = new JournalEntry();
		return entry;
	}

	@RequestMapping(path = "viewPoint.do")
	public ModelAndView viewPoint(ModelAndView model, int id) {
	    JournalEntry journalentryholder = new JournalEntry();
		PointOfInterest point = dao.findPointOfInterestById(id);
		point.getActivities();
		point.getAddress();
		point.getAmenities();
		point.getComments();
		model.addObject("point", point);
		model.addObject("journalEntry", journalentryholder);
		model.setViewName("entity/viewPoint");
		return model;
	}
	
	@RequestMapping(path = "viewPoints.do")
	public ModelAndView viewPoints(ModelAndView model) {
		List <PointOfInterest> allpoints = dao.getAllPoints();
		model.addObject("allpoints", allpoints);
		model.setViewName("entities/viewPoints");
		return model;
	}
	
	@RequestMapping(path = "addTrip.do", method=RequestMethod.POST)
	public String createTrip(@ModelAttribute("JournalEntry") 
	JournalEntry journalEntry, BindingResult result, Model model, HttpSession session) {
		User user = dao3.findUserById(((User)session.getAttribute("user")).getId());
		session.setAttribute("user", user);
		journalEntry.setUser(user);
		
		JournalEntry managed = dao2.createJournalEntry(journalEntry);
		
		model.addAttribute("journalEntry", managed);
		
		return "user/profile";
	}
	
}
