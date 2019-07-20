package com.skilldistillery.tripping.data;

import com.skilldistillery.tripping.entities.*;

public interface AdminDAO {
	public boolean addDestination(Destination dest);
	public boolean deleteDestination(Destination dest);
	public boolean updateDestination(Destination dest);

	public boolean addEvent(Event e);
	public boolean deleteEvent(Event e);
	public boolean updateEvent(Event e);

	public boolean addAmenity(Amenity a);
	public boolean deleteAmenity(Amenity a);
	public boolean updateAmenity(Amenity a);
	
	public boolean addPointOfInterest(PointOfInterest poi);
	public boolean deletePointOfInterest(PointOfInterest poi);
	public boolean updatePointOfInterest(PointOfInterest poi);
	
	public boolean addActivity(Activity a);
	public boolean deleteActivity(Activity a);
	public boolean updateActivity(Activity a);
	
//	ADMIN CANT UPDATE USERS JOURNAL etc, just makeAdmin and toggleActive
	public boolean adminUpdateUser(User user);
	

}
