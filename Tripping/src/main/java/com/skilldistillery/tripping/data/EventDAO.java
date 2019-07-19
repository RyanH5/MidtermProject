package com.skilldistillery.tripping.data;

import java.util.List;

import com.skilldistillery.tripping.entities.Event;

public interface EventDAO {

	public Event findPointOfInterestById(int id);
	public Event createEvent(Event event);
	public boolean updateEvent(int id, Event event);
	public boolean deletePointOfInteres(int id);
//	public List<Event> allEvents = getAllEvents();
	public List<Event> getEventsByDestination(int destinationId);
	
}
