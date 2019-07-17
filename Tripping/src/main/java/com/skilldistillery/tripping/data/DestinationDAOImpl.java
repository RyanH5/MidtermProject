package com.skilldistillery.tripping.data;

import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.transaction.Transactional;

import org.springframework.stereotype.Service;

import com.skilldistillery.tripping.entities.Activity;
import com.skilldistillery.tripping.entities.Amenity;
import com.skilldistillery.tripping.entities.Destination;
import com.skilldistillery.tripping.entities.PointOfInterest;
import com.skilldistillery.tripping.entities.PointOfInterestComment;

@Transactional
@Service
public class DestinationDAOImpl implements DestinationDAO {

	@PersistenceContext
	private EntityManager em;

	@Override
	public Destination findDestinationById(int id) {
		return em.find(Destination.class, id);
	}

	@Override
	public Destination createDestination(Destination destination) {
		em.persist(destination);
		return null;
	}

	@Override
	public boolean updateDestination(int id, Destination destination) {
		Destination updated = em.find(Destination.class, destination.getId());
		updated.setName(destination.getName());
//		updated.setActivities(destination.getActivities());
//		updated.setAddress(destination.getAddress());
//		updated.setAmenities(destination.getAmenities));
		updated.setShortDescription(destination.getShortDescription());
		updated.setDescription(destination.getDescription());
//		updated.setComments(destination.getComments());
//		updated.setDestination(destination.getDestination());
		em.persist(updated);
		return true;
	}
	
	@Override
	public boolean deleteDestination(int id) {
		Destination destination = em.find(Destination.class, id);
//		destination.setAmenities(null);
//		destination.setActivities(null);
//		destination.setComments(null);
//		em.remove(destination);
		return true;
	}


	@Override
	public Destination createDestinationAndAddress(Destination destination) {
		// TODO Auto-generated method stub
		return null;
	}

//	@Override
//	public List<Destination> getDestination(int amenityId) {
//		String query = "SELECT destination FROM Destination destination JOIN FETCH destination.amenities WHERE point.destination.id = :destinationId";
//		List<PointOfInterest> destination = em.createQuery(query, Destination.class).setParameter("destinationId", destinationId)
//				.getResultList();
//		return destination;
//	}

	@Override
	public List<PointOfInterest> getPointsByAmenityAndDestination(int amenityId, int destinationId) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public List<Amenity> getAmenitiesByPoint(int pointId) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public List<Activity> getActivitiesByPoint(int pointId) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public PointOfInterestComment createComment(PointOfInterestComment comment) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public void addActivitiesById(PointOfInterest pointOfInterest, Integer[] activityIds) {
		// TODO Auto-generated method stub

	}

	@Override
	public void addAmenityById(PointOfInterest pointOfInterest, Integer[] amenityIds) {
		// TODO Auto-generated method stub

	}

	@Override
	public List<PointOfInterest> getPointsByDestination(int destinationId) {
		// TODO Auto-generated method stub
		return null;
	}

}
