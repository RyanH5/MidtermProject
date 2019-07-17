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
		updated.setActivities(destination.getActivities());
		updated.setAddress(destination.getAddress());
		updated.setAmenities(destination.getAmenities);
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
		destination.setAmenities(null);
		destination.setActivities(null);
		destination.setComments(null);
		em.remove(destination);
		return true;
	}

	@Override
	public Destination createDestinationAndAddress(Destination destination) {
		em.persist(destination);
		return null;
	}


	@Override
	public List<PointOfInterest> getPointsByAmenityAndDestination(int amenityId, int destinationId) {
		String query = "SELECT point FROM PointOfInterest point JOIN FETCH point.amenities WHERE point.destination.id = :destinationId";
		List<PointOfInterest> points = em.createQuery(query, PointOfInterest.class)
				.setParameter("destinationId", destinationId).getResultList();
		return points;
	}

	@Override
	public List<Amenity> getAmenitiesByPoint(int pointId) {
		String query = "SELECT amenity FROM Amenity amenity INNER JOIN PointOfInteest ON  WHERE amenity.point.id = :pointId";
		List<Amenity> amenities = em.createQuery(query, Amenity.class).setParameter("pointId", pointId).getResultList();
		return amenities;
	}

	@Override
	public List<Activity> getActivitiesByPoint(int pointId) {
		String query = "SELECT activity FROM Activity activity WHERE activity.point.id = :pointId";
		List<Activity> activities = em.createQuery(query, Activity.class).setParameter("pointId", pointId)
				.getResultList();
		return activities;
	}

	@Override
	public PointOfInterestComment createComment(PointOfInterestComment comment) {
		em.persist(comment);
		return comment;
	}

	@Override
	public void addActivitiesById(PointOfInterest pointOfInterest, Integer[] activityIds) {
		for (Integer aid : activityIds) {
			Destination destination = null;
			destination.addActivity(em.find(Activity.class, aid));
		}

	}

	@Override
	public void addAmenityById(PointOfInterest pointOfInterest, Integer[] amenityIds) {
		for (Integer aid : amenityIds) {
			Destination destination = null;
			destination.addAmenity(em.find(Amenity.class, aid));

		}

	}

	@Override
	public List<PointOfInterest> getPointsByDestination(int destinationId) {
		// TODO Auto-generated method stub
		return null;
	}

}
