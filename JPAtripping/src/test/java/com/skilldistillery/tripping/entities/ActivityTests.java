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

public class ActivityTests {

	private static EntityManagerFactory emf;
	private EntityManager em;
	private Activity activity;

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
		activity = em.find(Activity.class, 1);
	}

	@AfterEach
	void tearDown() throws Exception {
		em.close();
		activity = null;
	}

	@Test
	void test_Activity_mappings() {
		assertEquals(1, activity.getId());
		assertEquals("4x4 & Jeep Tours", activity.getName());
		assertEquals("Many Trails", activity.getShortDescription());
		assertEquals("Trails for all levels", activity.getLongDescription());
		assertEquals("imageurl", activity.getImageUrl());
	}

	@Test
	void test_Activity_has_Points() {
		assertNotNull(activity.getPoints());
		assertEquals(1, activity.getPoints().size());
		assertEquals("Specific Trailhead", activity.getPoints().get(0).getName());
	}
	
}
