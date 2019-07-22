package com.skilldistillery.tripping.data;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.transaction.Transactional;

import org.springframework.stereotype.Service;

import com.skilldistillery.tripping.entities.JournalEntry;

@Transactional
@Service
public class JournalEntryDAOImpl implements JournalEntryDAO {

	@PersistenceContext
	private EntityManager em;

	@Override
	public JournalEntry findJournalEntryById(int id) {
		return em.find(JournalEntry.class, id);
	}

	@Override
	public JournalEntry createJournalEntry(JournalEntry trip) {
		em.persist(trip);
		return trip;
	}

}