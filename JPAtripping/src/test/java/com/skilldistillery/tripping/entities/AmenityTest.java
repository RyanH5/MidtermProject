package com.skilldistillery.tripping.entities;

import static org.junit.jupiter.api.Assertions.assertEquals;
import static org.junit.jupiter.api.Assertions.fail;

import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.Persistence;

import org.junit.jupiter.api.AfterAll;
import org.junit.jupiter.api.AfterEach;
import org.junit.jupiter.api.BeforeAll;
import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.Disabled;
import org.junit.jupiter.api.Test;

class AmenityTest {

	private static EntityManagerFactory emf;
	private EntityManager em;
	Amenity amenity;

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
	}

	@Disabled
	@Test
	void test() {
		fail("Not yet implemented");
	}

	@Test

	void test_Amenity_mappingId() {
		assertEquals(1, amenity.getId());
	}

	@Test

	void test_Amenity_mappingName() {
		assertEquals("ADA", amenity.getName());
	}

	@Test

	void test_Amenity_mapping_short_description() {
		assertEquals("wheel chair accessible stuff", amenity.getShortDescription());
	}

	@Test

	void test_Amenity_mapping_long_description() {
		assertEquals("lots of safety stuff stuff stufgf", amenity.getLongDescription());
	}

	@Test

	void test_Amenity_mapping_image_url() {
		assertEquals("image.url", amenity.getIconUrl());
	}

@Test
	
	void test_Amenity_mapping_points() {
		assertEquals(5, amenity.getPoints().size());
	}
}
