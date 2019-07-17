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
		activity = em.find(Activity.class, 1);
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
	
		void test_Activity_mappingId() {
		assertEquals("1", activity.getId());
}

	@Test
	
		void test_Activity_mappingName() {
		assertEquals("hike", activity.getName());
	}
	@Test
	
	void test_Activity_mapping_short_description() {
		assertEquals("many trails", activity.getShortDescription());
	}
	@Test
	
	void test_Activity_mapping_long_description() {
		assertEquals("easy moderate difficllt trails", activity.getLongDescription());
	}
	@Test
	
	void test_Activity_mapping_image_url() {
		assertEquals("fakeimage3.url", activity.getImageUrl());
	}
	@Test
	
	void test_Activity_mapping_points() {
		assertEquals(5, activity.getPoints().size());
	}
	
}
