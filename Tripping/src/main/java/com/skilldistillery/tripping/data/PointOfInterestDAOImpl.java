package com.skilldistillery.tripping.data;

import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.transaction.Transactional;

import org.springframework.stereotype.Service;

import com.skilldistillery.tripping.entities.Activity;
import com.skilldistillery.tripping.entities.Amenity;
import com.skilldistillery.tripping.entities.PointOfInterest;
import com.skilldistillery.tripping.entities.PointOfInterestComment;

@Transactional
@Service
public class PointOfInterestDAOImpl implements PointOfInterestDAO {

	@PersistenceContext
	private EntityManager em;

	@Override
	public PointOfInterest findPointOfInterestById(int id) {
		return em.find(PointOfInterest.class, id);
	}

	@Override
	public PointOfInterest createPointOfInterest(PointOfInterest pointOfInterest) {
		em.persist(pointOfInterest);
		return pointOfInterest;
	}

	@Override
	public boolean updatePointOfInterest(int id, PointOfInterest pointOfInterest) {
		PointOfInterest updated = em.find(PointOfInterest.class, pointOfInterest.getId());
		updated.setName(pointOfInterest.getName());
		updated.setActivities(pointOfInterest.getActivities());
		updated.setAddress(pointOfInterest.getAddress());
		updated.setAmenities(pointOfInterest.getAmenities());
		updated.setShortDescription(pointOfInterest.getShortDescription());
		updated.setLongDescription(pointOfInterest.getLongDescription());
		updated.setComments(pointOfInterest.getComments());
		updated.setDestination(pointOfInterest.getDestination());
		em.persist(updated);
		return true;
	}

	@Override
	public boolean deletePointOfInterest(int id) {
		PointOfInterest point = em.find(PointOfInterest.class, id);
		point.setAmenities(null);
		point.setActivities(null);
		point.setComments(null);
		em.remove(point);
		return true;
	}

	@Override
	public List<PointOfInterest> getPointsByDestination(int destinationId) {
		String query = "SELECT point FROM PointOfInterest point WHERE point.destination.id = :id";
		List<PointOfInterest> points = em.createQuery(query, PointOfInterest.class).setParameter("id", destinationId).getResultList();
		return points;
	}

	@Override
	public List<PointOfInterest> getPointsByAmenityAndDestination(int amenityId, int destinationId) {
		String query = "SELECT point FROM PointOfInterest point JOIN FETCH point.amenities WHERE point.destination.id = :destinationId";
		List<PointOfInterest> points = em.createQuery(query, PointOfInterest.class).setParameter("destinationId", destinationId)
				.getResultList();
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
		List<Activity> activities = em.createQuery(query, Activity.class).setParameter("pointId", pointId).getResultList();
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
			pointOfInterest.addActivity(em.find(Activity.class, aid));
		}
	}

	@Override
	public void addAmenityById(PointOfInterest pointOfInterest, Integer[] amenityIds) {
		for (Integer aid : amenityIds) {
			pointOfInterest.addAmenity(em.find(Amenity.class, aid));
		}
	}

	@Override
	public List<PointOfInterest> getAllPoints() {
		String query = "SELECT point FROM PointOfInterest point";
		List<PointOfInterest> points = em.createQuery(query, PointOfInterest.class).getResultList();
		return points;
	}
}