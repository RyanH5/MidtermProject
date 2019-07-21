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

	@Test
	void test_Destination_review_mappings() {
		DestinationReview destReview = em.find(DestinationReview.class, 1);
		assertEquals(1, destReview.getId());
		assertEquals(1, destReview.getDestination().getId());
		assertNotNull(destReview.getCreateDate());
		assertEquals("Rocky Mountain National Park is a MUST!", destReview.getTitle());
		assertEquals(5, destReview.getRating());
		assertEquals("The entire area is gorgeous! Rocky Mountain National Park is a must. I liked the Bear Lake Blueberry Wheat beer at the Estes Park Brewery. It goes great with wings.", destReview.getReviewText());
	}
	
	@Test
	void test_Destination_Review_has_destinations () {
		DestinationReview destReview = em.find(DestinationReview.class, 1);
		assertNotNull(destReview.getDestination().getName());
		assertEquals("Estes Park", destReview.getDestination().getName());
	}
	@Test
	void test_Destination_Review_has_users () {
		DestinationReview destReview = em.find(DestinationReview.class, 1);
		assertNotNull(destReview.getDestination());
		assertEquals("Ryan", destReview.getUser().getFirstName());
	}

}
