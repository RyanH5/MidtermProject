package com.skilldistillery.tripping.data;

import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.transaction.Transactional;

import org.springframework.stereotype.Service;

import com.skilldistillery.tripping.entities.Activity;
import com.skilldistillery.tripping.entities.PointOfInterest;

@Transactional
@Service
public class ActivityDAOImpl implements ActivityDAO {

	@PersistenceContext
	private EntityManager em;

	@Override
	public Activity findActivityById(int id) {
		return em.find(Activity.class, id);
	}

	@Override
	public Activity createActivity(Activity activity) {
		em.persist(activity);
		return null;
	}

	@Override
	public boolean updateActivity(int id, Activity activity) {
		Activity updated = em.find(Activity.class, activity.getId());
		updated.setName(activity.getName());
		updated.setImageUrl(activity.getImageUrl());
		updated.setShortDescription(activity.getShortDescription());
		updated.setLongDescription(activity.getLongDescription());
		updated.setPoints(activity.getPoints());
		em.persist(updated);
		return true;
	}

	@Override
	public boolean deleteActivity(int id) {
		Activity activity = em.find(Activity.class, id);
		activity.setPoints(null);
		em.remove(activity);
		return true;
	}

	@Override
	public List<PointOfInterest> getPointsByActivity(int activityId) {
		String query = "SELECT point FROM PointOfInterest point JOIN FETCH point.activities WHERE point.activity.id = :activityId";
		List<PointOfInterest> points = em.createQuery(query, PointOfInterest.class)
				.setParameter("activityId", activityId).getResultList();
		return points;
	}

	@Override
	public List<Activity> getAllActivities() {
		String query = "SELECT activity FROM Activity activity";
		List<Activity> activities = em.createQuery(query, Activity.class).getResultList();
		return activities;
	}

	@Override
	public Activity createActivityAndAddress(Activity destination) {
		// TODO Auto-generated method stub
		return null;
	}

}
