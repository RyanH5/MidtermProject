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

class UserTests {

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
	void test_user_mappings() {
		User user = em.find(User.class, 1);
		assertEquals(1, user.getId());
		assertEquals(" password2.0", user.getPassword());
		assertEquals(" ryan", user.getFirstName());
		assertEquals(" harr", user.getLastName());
		assertEquals(" harr@gmail.com", user.getEmail());
//		assertEquals("2015-07-11 11:00:00.0", user.getCreateDate());  <--this is not empty
		assertEquals(" myimage.jpg", user.getImageURL());
		assertEquals(" notAdmin", user.getRole());
		assertEquals(false, user.isActive());
	}


	@Test
	void test_user_has_journal_entries() {
		User user = em.find(User.class, 1);
		assertNotNull(user.getJournalEntries());
		assertEquals("Mtn biking in golden", user.getJournalEntries().get(0).getTitle());
	}

	@Test
	void test_user_has_event_reviews() {
		User user = em.find(User.class, 1);
		assertNotNull(user.getEventReviews().get(0));
		assertEquals("tasty fruits in the mountains", user.getEventReviews().get(0).getTitle());

	}

	@Test
	void test_user_has_destination_reviews() {
		User user = em.find(User.class, 1);
		assertNotNull(user.getDestReviews());
		assertEquals("golden biking review", user.getDestReviews().get(0).getTitle());
	}

	@Test
	void test_user_has_POI_reviews() {
		User user = em.find(User.class, 1);
		assertNotNull(user.getPointComments());
		assertEquals("Great trailhead parking", user.getPointComments().get(0).getCommentText());
	}

	
	@Test
	void test_user_has_point_comments() {
		User user = em.find(User.class, 1);
		assertNotNull(user.getPointComments());
	}

}
