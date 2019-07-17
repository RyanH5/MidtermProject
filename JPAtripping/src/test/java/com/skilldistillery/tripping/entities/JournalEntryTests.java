package com.skilldistillery.tripping.entities;

import static org.junit.jupiter.api.Assertions.assertEquals;
import static org.junit.jupiter.api.Assertions.assertNotNull;
import static org.junit.jupiter.api.Assertions.assertNull;
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

class JournalEntryTests {
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
	void test_journal_entry_mappings() {
		JournalEntry jEntry = em.find(JournalEntry.class, 1);
		assertEquals(1, jEntry.getUser().getId());
		assertEquals(false, jEntry.isPublic());
		assertEquals(true, jEntry.isComplete());
		assertEquals("Mtn biking in golden", jEntry.getTitle());
		assertEquals("went riding it was sick btw it was awesome", jEntry.getEntryText());
		assertNotNull(jEntry.getCreateDate());
	}
		
	@Test
	void test_journal_has_activities() {
		JournalEntry jEntry = em.find(JournalEntry.class, 1);
		assertNull(jEntry.getActivity());
//		assertEquals("hike", jEntry.getActivity().getName());
	}
	
	@Test
	void test_journal_has_events() {
		JournalEntry jEntry = em.find(JournalEntry.class, 1);
		assertNull(jEntry.getEvent());
//		assertEquals("P peaches", jEntry.getEvent().getName());
		
	}
	@Test
	void test_journal_has_destinations() {
		JournalEntry jEntry = em.find(JournalEntry.class, 1);
		assertNull(jEntry.getDestination());
// 		assertNotNull(jEntry.getDestination().getId());
//		assertEquals("mt elber", jEntry.getDestination());
	}
	
	@Test 
	void test_journal_entry_has_images() {
		JournalEntryImage jEntryImage = em.find(JournalEntryImage.class, 1);
		assertNotNull(jEntryImage.getImageURL());
	}
}
