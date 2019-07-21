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

class EventUserReviewTests {
	private static EntityManagerFactory emf;
	private static EntityManager em;

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
	}

	@AfterEach
	void tearDown() throws Exception {
		em.close();
	}
	
	@Test
	void test_event_review_mappings() {
		EventReview eventReview = em.find(EventReview.class, 1);
		assertEquals(1, eventReview.getUser().getId());
		assertEquals(1, eventReview.getEvent().getId());
		assertNotNull(eventReview.getCreateDate()); 
		assertEquals("tasty fruits in the mountains", eventReview.getTitle());
		assertNotNull(eventReview.getRating());
		assertNotNull(eventReview.getReview_text());
	}
	
	@Test
	void test_event_review_has_an_event() {
		EventReview eventReview = em.find(EventReview.class, 1);
		assertNotNull(1, eventReview.getEvent().getName());
		assertEquals("Jazz Fest, Estes Park", eventReview.getEvent().getName());
	}

	

}
