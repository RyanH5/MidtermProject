package com.skilldistillery.tripping.entities;

import static org.junit.jupiter.api.Assertions.assertEquals;
import static org.junit.jupiter.api.Assertions.assertNotNull;
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

class DestinationReviewTests {

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

	@Disabled
	@Test
	void test() {
		fail("Not yet implemented");
	}

	@Test
	void test_Destination_review_mappings() {
		DestinationReview destReview = em.find(DestinationReview.class, 1);
		assertEquals(1, destReview.getId());
		assertEquals(2, destReview.getDestination().getId());
		assertNotNull(destReview.getCreateDate());
		assertEquals("golden biking review", destReview.getTitle());
		assertEquals(4, destReview.getRating());
		assertEquals("it was so awesome i broke my arm", destReview.getReviewText());
	}
	
	@Test
	void test_Destination_Review_has_destinations () {
		DestinationReview destReview = em.find(DestinationReview.class, 1);
		assertNotNull(destReview.getDestination().getName());
		assertEquals("Dinosaur", destReview.getDestination().getName());
	}
	@Test
	void test_Destination_Review_has_users () {
		DestinationReview destReview = em.find(DestinationReview.class, 1);
		assertNotNull(destReview.getDestination());
		assertEquals("Ryan", destReview.getUser().getFirstName());
	}

}
