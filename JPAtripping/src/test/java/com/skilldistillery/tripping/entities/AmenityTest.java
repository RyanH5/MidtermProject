package com.skilldistillery.tripping.entities;

import static org.junit.jupiter.api.Assertions.assertEquals;

import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.Persistence;

import org.junit.jupiter.api.AfterAll;
import org.junit.jupiter.api.AfterEach;
import org.junit.jupiter.api.BeforeAll;
import org.junit.jupiter.api.BeforeEach;
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

	@Test

	void test_Amenity_mappingId() {
		assertEquals(1, amenity.getId());
	}

	@Test

	void test_Amenity_mappingName() {
		assertEquals("Lodging", amenity.getName());
	}

	@Test

	void test_Amenity_mapping_short_description() {
		assertEquals("Please, come stay and enjoy your visit", amenity.getShortDescription());
	}

	@Test

	void test_Amenity_mapping_long_description() {
		assertEquals("Colorado hotels and lodging range from five-star luxury hotels to rustic cabins. Whether it’s a city hotel, mountain resort, historic B&B or alpine lodge, Colorado accommodations provide amazing views, values and a variety of places to stay. Choose between the largest international hotel chains to small inns. And, you’ll find plenty of great dining options and activities no matter where you stay in Colorado.", amenity.getLongDescription());
	}

	@Test

	void test_Amenity_mapping_image_url() {
		assertEquals("https://www.birchwoodhotel.co.za/wp-content/uploads/2016/05/hotel-icon.png", amenity.getIconUrl());
	}

@Test
	
	void test_Amenity_mapping_points() {
		assertEquals(1, amenity.getPoints().size());
	}
}
