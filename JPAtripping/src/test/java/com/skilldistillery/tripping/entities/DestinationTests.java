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

class DestinationTests {
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
	void test_description_mappings() {
		Destination dest = em.find(Destination.class, 1);
		Destination dest2 = em.find(Destination.class, 2);
		assertEquals(1, dest.getId());
		assertEquals("mt elber", dest.getName());
		assertEquals("mountain mountain", dest.getDescription());
		assertEquals("bigmtn.jpg", dest.getImage());
		assertEquals("it was so awesome i broke my arm", dest2.getDestinationReviews().get(0).getReviewText());
	}

}
