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
		updated.setImage(destination.getImage());
		updated.setShortDescription(destination.getShortDescription());
		updated.setDescription(destination.getDescription());
		updated.setDestinationReviews(destination.getDestinationReviews());
		updated.setPoints(destination.getPoints());
		em.persist(updated);
		return true;
	}

	@Override
	public boolean deleteDestination(int id) {
		Destination destination = em.find(Destination.class, id);
		destination.setName(null);
		destination.setImage(null);
		destination.setShortDescription(null);
		destination.setDescription(null);
		destination.setDestinationReviews(null);
		destination.setPoints(null);
		em.remove(destination);
		return true;
	}

	@Override
	public Destination createDestinationAndAddress(Destination destination) {
		em.persist(destination);
		return null;
	}

	@Override
	public List<PointOfInterest> getPointsByDestination(int destinationId) {
		String query = "SELECT point FROM PointOfInterest point JOIN FETCH point.amenities WHERE point.destination.id = :destinationId";
		List<PointOfInterest> points = em.createQuery(query, PointOfInterest.class)
				.setParameter("destinationId", destinationId).getResultList();
		return points;
	}

	@Override
	public List<Amenity> getAmenitiesByDestination(int pointId) {
		String query = "SELECT amenity FROM Amenity amenity INNER JOIN PointOfInteest ON  WHERE amenity.point.id = :pointId";
		List<Amenity> amenities = em.createQuery(query, Amenity.class).setParameter("pointId", pointId).getResultList();
		return amenities;
	}

	@Override
	public List<Activity> getActivitiesByDestination(int pointId) {
		String query = "SELECT activity FROM Activity activity WHERE activity.point.id = :pointId";
		List<Activity> activities = em.createQuery(query, Activity.class).setParameter("pointId", pointId)
				.getResultList();
		return activities;
	}

	@Override
	public List<Destination> getAllDestinations() {
		String query = "SELECT d FROM Destination d";
		List<Destination> dests = em.createQuery(query, Destination.class).getResultList();
		return dests;
	}

}
