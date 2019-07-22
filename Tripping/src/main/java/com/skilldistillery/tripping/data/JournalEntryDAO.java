package com.skilldistillery.tripping.data;

import com.skilldistillery.tripping.entities.JournalEntry;

public interface JournalEntryDAO {

	JournalEntry findJournalEntryById(int id);

	JournalEntry createJournalEntry(JournalEntry trip);

}
