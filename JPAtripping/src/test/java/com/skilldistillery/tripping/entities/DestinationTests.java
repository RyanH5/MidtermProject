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
		assertEquals("Estes Park", dest.getName());
		assertEquals("Estes Park lies at the entrence to Colorado's jewl, Rocky Mountain National Park. At an elevation of 7522', Estes Park offers fantastic scenery and wildlife, as well as great shops, restaurants, and prime lodging.", dest.getDescription());
		assertEquals("Estes Park is a great place to escape the hustle and bustle of Denver and the summertime heat at lower elevation.", dest.getShortDescription());
		assertEquals("https://i.pinimg.com/originals/bd/2d/1a/bd2d1a7d8983b3ee48a3fbace93b1039.jpg", dest.getImage());
	}
	
	@Test
	void test_destination_userReviews_association() {
		Destination dest2 = em.find(Destination.class, 2);
		assertEquals("it was so awesome i broke my arm", dest2.getDestinationReviews().get(0).getReviewText());
		
	}
	
	@Test 
	void test_destination_event_association() {
		Destination dest = em.find(Destination.class, 1);
		assertEquals("Many bands in one great location with a great backdrop", dest.getEvents().get(0).getLongDescription());
	}

}
