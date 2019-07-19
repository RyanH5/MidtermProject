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

class ActivityTest {

	private static EntityManagerFactory emf;
	private EntityManager em;
	Activity activity;

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
		activity = em.find(Activity.class, 2);
	}

	@AfterEach
	void tearDown() throws Exception {
		em.close();
	}

	@Test
	void test_Activity_mappingId() {
		assertEquals(2, activity.getId());
	}

	@Test
	void test_Activity_mappingName() {
		assertEquals("Adventure Tours", activity.getName());
	}

	@Test
	void test_Activity_mapping_short_description() {
		assertEquals("No seriously, let us do the driving while you take in the scenery.", activity.getShortDescription());
	}

	@Test

	void test_Activity_mapping_long_description() {
		assertEquals("Lots to see and more", activity.getLongDescription());
	}

	@Test

	void test_Activity_mapping_image_url() {
		assertEquals("https://captainzipline.com/wp-content/uploads/colorado-zipline-tour-2.jpg", activity.getImageUrl());
	}

	@Test

	void test_Activity_mapping_points() {
		assertEquals(1, activity.getPoints().size());
	}

}
