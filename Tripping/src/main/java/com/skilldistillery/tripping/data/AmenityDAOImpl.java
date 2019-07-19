package com.skilldistillery.tripping.data;

import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.transaction.Transactional;

import org.springframework.stereotype.Service;

import com.skilldistillery.tripping.entities.Amenity;
import com.skilldistillery.tripping.entities.PointOfInterest;

@Transactional
@Service
public class AmenityDAOImpl implements AmenityDAO {

	@PersistenceContext
	private EntityManager em;

	@Override
	public Amenity findAmenityById(int id) {
		return em.find(Amenity.class, id);
	}

	@Override
	public Amenity createAmenity(Amenity amenity) {
		em.persist(amenity);
		return null;
	}

	@Override
	public boolean updateAmenity(int id, Amenity amenity) {
		Amenity updated = em.find(Amenity.class, amenity.getId());
		updated.setName(amenity.getName());
		updated.setIconUrl(amenity.getIconUrl());
		updated.setShortDescription(amenity.getShortDescription());
		updated.setLongDescription(amenity.getLongDescription());
		updated.setPoints(amenity.getPoints());
		em.persist(updated);
		return true;
	}

	@Override
	public boolean deleteAmenity(int id) {
		Amenity amenity = em.find(Amenity.class, id);
		amenity.setPoints(null);
		em.remove(amenity);
		return true;
	}

	@Override
	public List<PointOfInterest> getPointsByAmenity(int amenityId) {
		String query = "SELECT point FROM PointOfInterest point JOIN FETCH point.amenities WHERE point.amenity.id = :amenityId";
		List<PointOfInterest> points = em.createQuery(query, PointOfInterest.class)
				.setParameter("amenityId", amenityId).getResultList();
		return points;
	}

	@Override
	public List<Amenity> getAllAmenities() {
		String query = "SELECT amenity FROM Amenity amenity";
		List<Amenity> amenities = em.createQuery(query, Amenity.class).getResultList();
		return amenities;
	}

	@Override
	public Amenity createAmenityAndAddress(Amenity destination) {
		// TODO Auto-generated method stub
		return null;
	}

}
