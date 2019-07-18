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
		// TODO Auto-generated method stub
		return true;
	}

	@Override
	public boolean addEvent(Event e) {
		// TODO Auto-generated method stub
		return true;
	}

	@Override
	public boolean deleteEvent(Event e) {
		// TODO Auto-generated method stub
		return true;
	}

	@Override
	public boolean updateEvent(Event e) {
		// TODO Auto-generated method stub
		return true;
	}

	@Override
	public boolean addAmenity(Amenity a) {
		// TODO Auto-generated method stub
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
