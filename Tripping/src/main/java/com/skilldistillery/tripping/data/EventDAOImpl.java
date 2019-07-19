package com.skilldistillery.tripping.data;

import java.util.List;

import javax.persistence.*;
import javax.transaction.Transactional;

import org.springframework.stereotype.Service;

import com.skilldistillery.tripping.entities.Event;

@Transactional
@Service
public class EventDAOImpl implements EventDAO{

	@PersistenceContext
	private EntityManager em;

	@Override
	public Event findEventById(int id) {
		return em.find(Event.class, id);
	}

	@Override
	public Event createEvent(Event event) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public boolean updateEvent(int id, Event event) {
		// TODO Auto-generated method stub
		return false;
	}

	@Override
	public boolean deletePointOfInteres(int id) {
		// TODO Auto-generated method stub
		return false;
	}

	@Override
	public List<Event> getEventsByDestination(int destinationId) {
		String jpql9 = "SELECT event FROM Event event"
				+ " JOIN event.destination d"
				+ " WHERE d.id = :id";
		List<Event> events = em.createQuery(jpql9, Event.class)
			.setParameter("id", 3)
			.getResultList();
		return events;
	}
	
	
}
