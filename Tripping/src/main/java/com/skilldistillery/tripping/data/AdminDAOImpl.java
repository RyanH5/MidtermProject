package com.skilldistillery.tripping.data;

import javax.persistence.*;
import javax.transaction.Transactional;
import org.springframework.stereotype.Service;
import com.skilldistillery.tripping.entities.*;

@Transactional
@Service
public class AdminDAOImpl implements AdminDAO{

	@PersistenceContext
	private EntityManager em;

	@Override
	public boolean addDestination(Destination dest) {
		em.persist(dest);
		return true;
	}

	@Override
	public boolean deleteDestination(Destination dest) {
		em.remove(dest);
		return true;
	}

	@Override
	public boolean updateDestination(Destination dest) {
		Destination updatedDestination = em.find(Destination.class, dest.getId());
		updatedDestination.setDescription(dest.getDescription());
		updatedDestination.setDestinationReviews(dest.getDestinationReviews());
		updatedDestination.setEvents(dest.getEvents());
		updatedDestination.setImage(dest.getImage());
		updatedDestination.setName(dest.getName());
		updatedDestination.setPoints(dest.getPoints());
		updatedDestination.setShortDescription(dest.getShortDescription());
		return true;
	}
	

	@Override
	public boolean addEvent(Event e) {
		em.persist(e);
		return true;
	}

	@Override
	public boolean deleteEvent(Event e) {
		em.remove(e);
		return true;
	}

	@Override
	public boolean updateEvent(Event e) {
		Event updatedEvent = em.find(Event.class, e.getId());
		updatedEvent.setDestination(e.getDestination());
		updatedEvent.setEndDate(e.getEndDate());
		updatedEvent.setEventDetails(e.getEventDetails());
		updatedEvent.setLongDescription(e.getLongDescription());
		updatedEvent.setShortDescription(e.getShortDescription());
		updatedEvent.setStartDate(e.getStartDate());
		return true;
	}

	@Override
	public boolean addAmenity(Amenity a) {
		em.persist(a);
		return true;
	}

	@Override
	public boolean deleteAmenity(Amenity a) {
		// TODO Auto-generated method stub
		return true;
	}

	@Override
	public boolean updateAmenity(Amenity a) {
		// TODO Auto-generated method stub
		return true;
	}

	@Override
	public boolean addPointOfInterest(PointOfInterest poi) {
		// TODO Auto-generated method stub
		return true;
	}

	@Override
	public boolean deletePointOfInterest(PointOfInterest poi) {
		// TODO Auto-generated method stub
		return true;
	}

	@Override
	public boolean updatePointOfInterest(PointOfInterest poi) {
		// TODO Auto-generated method stub
		return true;
	}

	@Override
	public boolean addActivity(Activity a) {
		// TODO Auto-generated method stub
		return true;
	}

	@Override
	public boolean deleteActivity(Activity a) {
		// TODO Auto-generated method stub
		return true;
	}

	@Override
	public boolean updateActivity(Activity a) {
		// TODO Auto-generated method stub
		return true;
	}

	@Override
	public boolean adminUpdateUser(User user) {
		// TODO Auto-generated method stub
		return true;
	}
	
	
	
}
