package com.skilldistillery.tripping.entities;

import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.Persistence;

public class QueryTests {

	public static void main(String[] args) {
		int id = 1;
		getPOIById(id);
	}

//	SQL 
//	select d.name, poi.name, a.name from destination d
//	join point_of_interest poi
//	join activity a
//	join point_of_interest_has_activity poia
//	on d.id = poi.destination_id
//	and poi.id = poia.point_of_interest_id
//	and poia.activity_id = a.id;

	public static List<PointOfInterest> getPOIById(int id) {
		EntityManagerFactory emf = Persistence.createEntityManagerFactory("tripping");
		EntityManager em = emf.createEntityManager();
		
		
//		Point of interest by ID
		String jpql = "SELECT poi FROM PointOfInterest poi"
				+ " WHERE poi.id = :id";
		List<PointOfInterest> pois = em.createQuery(jpql, PointOfInterest.class)
				.setParameter("id", id)
				.getResultList();
			System.out.println("Points of interest with ID 1:");
			System.out.println(pois);
			System.out.println();
			
//			This returns a list of points of interest at a destination
			String jpql1 = "SELECT poi FROM PointOfInterest poi"
					+ " JOIN poi.destination d"
					+ " WHERE d.id = :id";
			List<PointOfInterest> pois1 = em.createQuery(jpql1, PointOfInterest.class)
				.setParameter("id", id)
				.getResultList();
			System.out.println("Points of interest at destination_id = 1:");
			System.out.println(pois1);
			System.out.println(pois1.size());
			System.out.println();
			
//			List of activities by POI
			String jpql2 = "SELECT act FROM Activity act"
					+ " JOIN act.points p"
					+ " WHERE p.id = :id";
			List<Activity> activity = em.createQuery(jpql2, Activity.class)
				.setParameter("id", id)
				.getResultList();
			System.out.println("List of activities where point of interest id = 1:");
			System.out.println(activity);
			System.out.println(activity.size());
			
//			List of points by activity
			String jpql3 = "SELECT points FROM PointOfInterest points"
					+ " JOIN points.activities a"
					+ " WHERE a.id = :id";
			System.out.println("List of point of interests where activity id = 1:");
			List<PointOfInterest> points = em.createQuery(jpql3, PointOfInterest.class)
				.setParameter("id", id)
				.getResultList();
			System.out.println(points);
			System.out.println(points.size());
			System.out.println();
			
//			List of points by activity at a destination
			String jpql4 = "SELECT points FROM PointOfInterest points"
					+ " JOIN points.activities a"
					+ " JOIN points.destination dest"
					+ " WHERE dest.id = :id";
			List<PointOfInterest> points2 = em.createQuery(jpql4, PointOfInterest.class)
				.setParameter("id", id)
				.getResultList();
			System.out.println("List of point of interests where destination id = 1:");
			System.out.println(points2);
			System.out.println(points2.size());
			System.out.println();
			
//			List of points at a destination with a certain activity
			String jpql5 = "SELECT points FROM PointOfInterest points"
					+ " JOIN points.activities a"
					+ " JOIN points.destination dest"
					+ " WHERE dest.id = :id"
					+ " AND a.id = :aid";
			//int aid = 1;
			List<PointOfInterest> points3 = em.createQuery(jpql5, PointOfInterest.class)
				.setParameter("id", id)
				.setParameter("aid", 2)
				.getResultList();
			System.out.println("List of point of interests where destination id = 1 AND activity id = 2:");
			System.out.println(points3);
			System.out.println(points3.size());
			System.out.println();
			
//			List of points with amenities
			String jpql6 = "SELECT points FROM PointOfInterest points"
					+ " JOIN points.amenities a"
					+ " WHERE a.id = :id";
			List<PointOfInterest> points4 = em.createQuery(jpql6, PointOfInterest.class)
				.setParameter("id", 6)
				.getResultList();
			System.out.println("List of point of interests where amenity id = 6:");
			System.out.println(points4);
			System.out.println(points4.size());
			System.out.println();
			
//			List of events at a destination
			String jpql7 = "SELECT points FROM PointOfInterest points"
					+ " JOIN points.amenities a"
					+ " JOIN points.destination dest"
					+ " WHERE a.id = :id"
					+ " AND dest.id = :did";
			List<PointOfInterest> points5 = em.createQuery(jpql7, PointOfInterest.class)
				.setParameter("id", id)
				.setParameter("did", 1)
				.getResultList();
			System.out.println("List of point of interests where amenity id = 6 and dest id = 1:");
			System.out.println(points5);
			System.out.println(points5.size());
			System.out.println();
			
//			List of amenities at a poi
			String jpql8 = "SELECT amenities FROM Amenity amenities"
					+ " JOIN amenities.points p"
					+ " WHERE p.id = :id";
			List<Amenity> points6 = em.createQuery(jpql8, Amenity.class)
				.setParameter("id", id)
				.getResultList();
			System.out.println("List of amenities where point id = 1:");
			System.out.println(points6);
			System.out.println(points6.size());
			System.out.println();
			
//			List of events at a destination
			String jpql9 = "SELECT event FROM Event event"
					+ " JOIN event.destination d"
					+ " WHERE d.id = :id";
			List<Event> events = em.createQuery(jpql9, Event.class)
				.setParameter("id", 3)
				.getResultList();
			System.out.println("Events at destination_id = 3:");
			System.out.println(events);
			System.out.println(events.size());
			System.out.println();
			
		return pois;
	}

}
