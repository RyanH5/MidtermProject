package com.skilldistillery.tripping.data;

import java.util.List;

import com.skilldistillery.tripping.entities.Activity;
import com.skilldistillery.tripping.entities.PointOfInterest;

public interface ActivityDAO {

	public Activity findActivityById(int id);

	public List<Activity> getAllActivities();

	public Activity createActivity(Activity acivity);

	public boolean updateActivity(int id, Activity destination);

	public boolean deleteActivity(int id);

	public Activity createActivityAndAddress(Activity destination);

	public List<PointOfInterest> getPointsByActivity(int destinationId);

}
