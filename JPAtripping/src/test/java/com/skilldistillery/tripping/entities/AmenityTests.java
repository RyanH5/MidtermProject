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

public class AmenityTests {

	private static EntityManagerFactory emf;
	private EntityManager em;
	private Amenity amenity;

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
		amenity = em.find(Amenity.class, 1);
	}

	@AfterEach
	void tearDown() throws Exception {
		em.close();
		amenity = null;
	}

	@Test
	void test_Amenity_mappings() {
		assertEquals(1, amenity.getId());
		assertEquals("ADA", amenity.getName());
		assertEquals("wheel chair accessible stuff", amenity.getShortDescription());
		assertEquals("lots of safety stuff stuff stufgf", amenity.getLongDescription());
		assertEquals("image.url", amenity.getIconUrl());
	}

	@Test
	void test_Amenity_has_Points() {
		assertNotNull(amenity.getPoints());
		assertEquals(1, amenity.getPoints().size());
		assertEquals("Specific Trailhead", amenity.getPoints().get(0).getName());
	}
	
}
