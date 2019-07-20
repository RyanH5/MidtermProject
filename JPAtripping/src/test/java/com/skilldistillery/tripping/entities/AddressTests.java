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

public class AddressTests {

	private static EntityManagerFactory emf;
	private EntityManager em;
	private Address address;

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
		address = em.find(Address.class, 1);
	}

	@AfterEach
	void tearDown() throws Exception {
		em.close();
		address = null;
	}

	@Test
	void test_Address_mappings() {
		assertEquals(1, address.getId());
		assertEquals("Denver", address.getCity());
		assertEquals("1119 Zazpo Place", address.getStreet1());
		assertEquals("1120 Zazpo Place", address.getStreet2());
		assertEquals("CO", address.getState());
		assertEquals("970-947-2926", address.getPhone());
		assertEquals("80123", address.getZipcode());
//		assertEquals(39.833, address.getLatitude());
//		assertEquals(59.543, address.getLongitude());
		// TODO: FIXME:bdrgd
	}

}
