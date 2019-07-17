package com.skilldistillery.tripping.entities;

import static org.junit.jupiter.api.Assertions.*;

import javax.persistence.*;

import org.junit.jupiter.api.*;

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
		assertEquals(1, dest.getId());
		assertEquals("mt elber", dest.getName());
		assertEquals("mountain mountain", dest.getDescription());
		assertEquals("bigmtn.jpg", dest.getImage());
	}
	
	@Test
	void test_destination_userReviews_association() {
		Destination dest2 = em.find(Destination.class, 2);
		assertEquals("it was so awesome i broke my arm", dest2.getDestinationReviews().get(0).getReviewText());
		
	}
	
	@Test 
	void test_destination_event_association() {
		Destination dest = em.find(Destination.class, 1);
		assertEquals("peaches strawberries blah blach mtn food", dest.getEvents().get(0).getLongDescription());
	}

}
