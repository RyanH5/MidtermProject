package com.skilldistillery.tripping.data;

import java.util.List;

import com.skilldistillery.tripping.entities.DestinationReview;
import com.skilldistillery.tripping.entities.EventReview;
import com.skilldistillery.tripping.entities.JournalEntry;
import com.skilldistillery.tripping.entities.JournalEntryImage;
import com.skilldistillery.tripping.entities.PointOfInterestComment;
import com.skilldistillery.tripping.entities.User;

public interface UserDAO {

	public User addUser(User user);

	public User findUserById(int id);

	public boolean updateUser(int id, User user);

	public boolean deleteUser(int id);

	public JournalEntry addJournalEntry(JournalEntry journalEntry);

	public JournalEntry findJournalEntryById(int id);

	public boolean updateJournalEntry(int id, JournalEntry journalEntry);

	public boolean deleteJournalEntry(int id);

	public List<JournalEntryImage> addJournalEntryImages(JournalEntry journalEntry, Integer[] imageIds);

	public List<JournalEntryImage> findJournalEntryImagesById(int id);

	public boolean updateJournalEntryImages(int id, List<JournalEntryImage> journalEntryImages);

	public boolean deleteJournalEntryImages(int id);

	public DestinationReview addDestinationReview(DestinationReview newDestReview);

	public DestinationReview findDestinationReview(int id);

	public boolean updateDestinationReview(int id, DestinationReview destReview);

	public boolean deleteDestinationReview(int id);

	public EventReview addEventReview(EventReview eventReview);

	public EventReview findEventReview(int id);

	public boolean updateEventReview(int id, EventReview eventReview);

	public boolean deleteEventReview(int id);
	
	public PointOfInterestComment addPOIComment(PointOfInterestComment poiComment);
	
	public PointOfInterestComment findPOIComment(int id);
	
	public boolean updatePOIComment(int id, PointOfInterestComment poiComment);
	
	
	
}
