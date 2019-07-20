package com.skilldistillery.tripping.controllers;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.skilldistillery.tripping.data.AmenityDAO;
import com.skilldistillery.tripping.entities.Amenity;

@Controller
public class AmenityController {

	@Autowired
	private AmenityDAO dao;
	
	@RequestMapping(value= {"viewAmenity.do"})
	public ModelAndView getAmenity(ModelAndView model, int id) {
		Amenity amenity = dao.findAmenityById(id);
		model.addObject("amenity", amenity);
		model.setViewName("entity/viewAmenity");
		return model;
	}
	
	@RequestMapping(value= {"viewAmenities.do"})
	public ModelAndView getAmenities(ModelAndView model) {
		List<Amenity> amenities = dao.getAllAmenities();
		model.addObject("amenities", amenities);
		model.setViewName("entities/viewAmenities");
		return model;
	}
}
	