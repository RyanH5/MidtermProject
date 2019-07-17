package com.skilldistillery.tripping.entities;

import static org.junit.jupiter.api.Assertions.*;

import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.Persistence;

import org.junit.jupiter.api.*;

class EventTests {

	private static EntityManagerFactory emf;
	private static EntityManager em;
	private Event evt;

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
		evt = em.find(Event.class, 1);
	}

	@AfterEach
	void tearDown() throws Exception {
		em.close();
		evt = null;
	}

	@Test
	void test_event_mappings() {
		assertEquals("P peaches", evt.getName());
		assertEquals("starts at time ends at later time", evt.getEventDetails());
	}
	
	@Test
	void test_event_destination_association() {
		assertEquals(1, evt.getDestination().getId());
		
	}

}
