package com.skilldistillery.tripping.data;

import java.util.List;

import com.skilldistillery.tripping.entities.Amenity;
import com.skilldistillery.tripping.entities.PointOfInterest;

public interface AmenityDAO {

	public Amenity findAmenityById(int id);

	public List<Amenity> getAllAmenities();

	public Amenity createAmenity(Amenity amenity);

	public boolean updateAmenity(int id, Amenity destination);

	public boolean deleteAmenity(int id);

	public Amenity createAmenityAndAddress(Amenity destination);

	public List<PointOfInterest> getPointsByAmenity(int destinationId);

}
