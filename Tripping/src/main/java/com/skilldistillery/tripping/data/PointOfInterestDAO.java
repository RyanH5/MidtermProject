package com.skilldistillery.tripping.data;

import java.util.List;

import com.skilldistillery.tripping.entities.Activity;
import com.skilldistillery.tripping.entities.Amenity;
import com.skilldistillery.tripping.entities.PointOfInterest;
import com.skilldistillery.tripping.entities.PointOfInterestComment;

public interface PointOfInterestDAO {
	
	public PointOfInterest findPointOfInterestById(int id);

	public PointOfInterest createPointOfInterest(PointOfInterest pointOfInterest);

	public boolean updatePointOfInterest(int id, PointOfInterest pointOfInterest);

	public boolean deletePointOfInterest(int id);
	
	public List<PointOfInterest> getAllPoints();
	
	public List<PointOfInterest> getPointsByDestination(int destinationId);

	public List<PointOfInterest> getPointsByAmenityAndDestination(int amenityId, int destinationId);

	public List<Amenity> getAmenitiesByPoint(int pointId);
	
	public List<Activity> getActivitiesByPoint(int pointId);

	public PointOfInterestComment createComment(PointOfInterestComment comment);

	public void addActivitiesById(PointOfInterest pointOfInterest, Integer[] activityIds);

	public void addAmenityById(PointOfInterest pointOfInterest, Integer[] amenityIds);

}
