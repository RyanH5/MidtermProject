package com.skilldistillery.tripping.data;

import java.util.List;

import com.skilldistillery.tripping.entities.Activity;
import com.skilldistillery.tripping.entities.Amenity;
import com.skilldistillery.tripping.entities.Destination;
import com.skilldistillery.tripping.entities.PointOfInterest;

public interface DestinationDAO {
	
	public Destination findDestinationById(int id);
	
	public Destination createDestination(Destination destination);
	
	public boolean updateDestination(int id, Destination destination);
	
	public boolean deleteDestination(int id);
	
	public Destination createDestinationAndAddress(Destination destination);
	
	public List<PointOfInterest> getPointsByDestination(int destinationId);
	
	public List<Amenity> getAmenitiesByDestination(int pointId);
	
	public List<Activity> getActivitiesByDestination(int pointId);

	public List<Destination> getAllDestinations();
	
}
