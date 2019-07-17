package com.skilldistillery.tripping.entities;

import static org.junit.jupiter.api.Assertions.assertEquals;

import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.Persistence;

import org.junit.jupiter.api.AfterAll;
import org.junit.jupiter.api.AfterEach;
import org.junit.jupiter.api.BeforeAll;
import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.Test;

public class PointOfInterestCommentTests {

	private static EntityManagerFactory emf;
	private EntityManager em;
	private PointOfInterestComment comment;

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
		comment = em.find(PointOfInterestComment.class, 1);
	}

	@AfterEach
	void tearDown() throws Exception {
		em.close();
		comment = null;
	}

	@Test
	void test_Comment_mappings() {
		assertEquals(1, comment.getId());
		assertEquals("sometext", comment.getCommentText());
	}

	@Test
	void test_Comment_has_Point() {
		assertEquals(1, comment.getPoint().getId());
	}
	
	@Test
	void test_Comment_has_User() {
		assertEquals(1, comment.getUser().getId());
	}

}
