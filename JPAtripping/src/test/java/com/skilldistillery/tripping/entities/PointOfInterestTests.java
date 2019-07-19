package com.skilldistillery.tripping.entities;

import static org.junit.jupiter.api.Assertions.assertEquals;
import static org.junit.jupiter.api.Assertions.assertNotNull;

import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.Persistence;

import org.junit.jupiter.api.AfterAll;
import org.junit.jupiter.api.AfterEach;
import org.junit.jupiter.api.BeforeAll;
import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.Test;

public class PointOfInterestTests {

	private static EntityManagerFactory emf;
	private EntityManager em;
	private PointOfInterest point;

	@BeforeAll
	static void setUpBeforeClass() throws Exception {
		emf = Persistence.createEntityManagerFactory("tripping");
	}

	@AfterAll
	static void tearDownAfterClass() throws Exception {
		emf.close();
	}

	@BeforeEach
	void setUp() throws Exception {
		em = emf.createEntityManager();
		point = em.find(PointOfInterest.class, 1);
	}

	@AfterEach
	void tearDown() throws Exception {
		em.close();
		point = null;
	}

	@Test
	void test_PoI_mappings() {
		assertEquals(1, point.getId());
		assertEquals("Specific Trailhead", point.getName());
	}
	
	@Test
	void test_PoI_has_Address() {
		assertEquals(1, point.getAddress().getId());
		assertEquals("329 birch ct", point.getAddress().getStreet1());
	}
	
	@Test
	void test_PoI_has_Destination() {
		assertEquals(1, point.getDestination().getId());
	}
	
	@Test
	void test_PoI_has_Comments() {
		assertNotNull(point.getComments());
		assertEquals("sometext",point.getComments().get(0).getCommentText());
	}
	
	@Test
	void test_PoI_has_Activities() {
		assertNotNull(point.getActivities());
		assertEquals("4x4 & Jeep Tours",point.getActivities().get(0).getName());
	}
	
	@Test
	void test_PoI_has_Amenities() {
		assertNotNull(point.getAmenities());
		assertEquals("Lodging",point.getAmenities().get(0).getName());
	}
	
}
