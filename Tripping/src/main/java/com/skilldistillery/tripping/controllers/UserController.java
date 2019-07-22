package com.skilldistillery.tripping.controllers;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.validation.Errors;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.skilldistillery.tripping.data.UserDAO;
import com.skilldistillery.tripping.entities.JournalEntry;
import com.skilldistillery.tripping.entities.User;

@Controller
public class UserController {

	@Autowired
	private UserDAO dao;
	
	@RequestMapping(path = "viewUser.do")
	public ModelAndView viewUserById(ModelAndView model, Integer id) {
		User user = dao.findUserById(id);
		model.addObject("user", user);
		model.setViewName("user/viewWebUser");
		return model;
	}
	
	@RequestMapping(path = "viewProfile.do")
	public ModelAndView viewUserById(ModelAndView model, Errors errors, HttpSession session) {
		User user = (User)session.getAttribute("user");
		List<JournalEntry> futureTrips = new ArrayList<>();
		List<JournalEntry> pastTrips = new ArrayList<>();
		for (int i = 0; i < user.getJournalEntries().size(); i++) {
			if(user.getJournalEntries().get(i).isComplete()) {
				pastTrips.add(user.getJournalEntries().get(i));
			}	else {
				futureTrips.add(user.getJournalEntries().get(i));
			}
		}
		
		model.addObject("futureTrips", futureTrips);
		model.addObject("pastTrips", pastTrips);
		model.setViewName("user/profile");
		return model;
	}
	
	@RequestMapping(path = "completeTrip.do")
	public ModelAndView userCompletedTrip(ModelAndView model, int tripId, HttpSession session) {
		dao.completeTrip(tripId);
		System.out.println("++++++++++++++++++++++++++++++++++++++++++++");
		System.out.println(tripId);
		User user = dao.findUserById(((User)session.getAttribute("user")).getId());
		session.setAttribute("user", user);
		List<JournalEntry> futureTrips = new ArrayList<>();
		List<JournalEntry> pastTrips = new ArrayList<>();
		for (int i = 0; i < user.getJournalEntries().size(); i++) {
			if(user.getJournalEntries().get(i).isComplete()) {
				pastTrips.add(user.getJournalEntries().get(i));
			}	else {
				futureTrips.add(user.getJournalEntries().get(i));
			}
		}
		
		model.addObject("futureTrips", futureTrips);
		model.addObject("pastTrips", pastTrips);
		model.setViewName("user/profile");
		return model;
	}

	@RequestMapping(path = "didNotCompleteTrip.do")
	public ModelAndView incompleteTrip(ModelAndView model, int tripId, HttpSession session) {
		dao.didNotFinishTrip(tripId);
		User user = dao.findUserById(((User)session.getAttribute("user")).getId());
		session.setAttribute("user", user);
		List<JournalEntry> futureTrips = new ArrayList<>();
		List<JournalEntry> pastTrips = new ArrayList<>();
		for (int i = 0; i < user.getJournalEntries().size(); i++) {
			if(user.getJournalEntries().get(i).isComplete()) {
				pastTrips.add(user.getJournalEntries().get(i));
			}	else {
				futureTrips.add(user.getJournalEntries().get(i));
			}
		}
		
		model.addObject("futureTrips", futureTrips);
		model.addObject("pastTrips", pastTrips);
		model.setViewName("user/profile");
		return model;
	}
	
	

}