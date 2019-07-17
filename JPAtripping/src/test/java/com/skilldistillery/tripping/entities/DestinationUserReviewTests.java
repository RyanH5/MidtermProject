package com.skilldistillery.tripping.entities;

import static org.junit.jupiter.api.Assertions.*;

import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.Persistence;

import org.junit.jupiter.api.AfterAll;
import org.junit.jupiter.api.AfterEach;
import org.junit.jupiter.api.BeforeAll;
import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.Test;

class DestinationUserReviewTests {

	private static EntityManagerFactory emf;
	private static EntityManager em;
	private DestinationReview dr1;

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
		dr1 = em.find(DestinationReview.class, 1);
	}

	@AfterEach
	void tearDown() throws Exception {
		em.close();
		dr1 = null;
	}

	@Test
	void test_destination_usr_review_mappings() {
		assertEquals("golden biking review", dr1.getTitle());
	}
	
	@Test
	void test_destination_usr_review_association_destination() {
		assertEquals("alpine mtn", dr1.getDestination().getShortDescription());
	}
	

	@Test 
	void test_desst_usr_review_association_to_user() {
		assertEquals(" harr", dr1.getUser().getLastName());
		
	}

}
