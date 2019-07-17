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
		activity = em.find(Activity.class, 2);
	}

	@AfterEach
	void tearDown() throws Exception {
		em.close();
		activity = null;
	}

	@Test
	void test_Activity_mappings() {
		assertEquals(2, activity.getId());
		assertEquals("mountain biking", activity.getName());
		assertEquals("trails for all levels", activity.getShortDescription());
		assertEquals("easy moderate difficult trails", activity.getLongDescription());
		assertEquals("fakeimage3.url", activity.getImageUrl());
	}

	@Test
	void test_Activity_has_Points() {
		assertNotNull(activity.getPoints());
		assertEquals(5, activity.getPoints().size());
		assertEquals("hike trailhead", activity.getPoints().get(0).getName());
	}
	
}
