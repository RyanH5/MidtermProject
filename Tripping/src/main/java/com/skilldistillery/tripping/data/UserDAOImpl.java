package com.skilldistillery.tripping.data;

import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.transaction.Transactional;

import org.springframework.stereotype.Service;

import com.skilldistillery.tripping.entities.DestinationReview;
import com.skilldistillery.tripping.entities.EventReview;
import com.skilldistillery.tripping.entities.JournalEntry;
import com.skilldistillery.tripping.entities.JournalEntryImage;
import com.skilldistillery.tripping.entities.PointOfInterestComment;
import com.skilldistillery.tripping.entities.User;

@Transactional
@Service
public class UserDAOImpl implements UserDAO {

	@PersistenceContext
	private EntityManager em;
	List<JournalEntryImage> journalEntryImages;

	@Override
	public User addUser(User user) {
		em.persist(user);
		return user;
	}

	@Override
	public User findUserById(int id) {
		return em.find(User.class, id);
	}

	@Override
	public boolean updateUser(int id, User user) {
		User updatedUser = em.find(User.class, user.getId());
		updatedUser.setUserName(user.getUserName());
		updatedUser.setPassword(user.getPassword());
		updatedUser.setFirstName(user.getFirstName());
		updatedUser.setLastName(user.getLastName());
		updatedUser.setCreateDate(user.getCreateDate());
		updatedUser.setEmail(user.getEmail());
		updatedUser.setImageURL(user.getImageURL());
		updatedUser.setRole(user.getRole());
		updatedUser.setActive(user.isActive());
		updatedUser.setJournalEntries(user.getJournalEntries());
		updatedUser.setEventReviews(user.getEventReviews());
		updatedUser.setDestReviews(user.getDestReviews());
		updatedUser.setPointComments(user.getPointComments());
		em.persist(updatedUser);
		return true;
	}

	@Override
	public boolean deleteUser(int id) {
		User user = em.find(User.class, id);
		user.setJournalEntries(null);
		user.setEventReviews(null);
		user.setDestReviews(null);
		user.setPointComments(null);
		em.remove(user);
		return true;
	}

	@Override
	public JournalEntry addJournalEntry(JournalEntry journalEntry) {
		em.persist(journalEntry);
		return journalEntry;
	}

	@Override
	public JournalEntry findJournalEntryById(int id) {
		return em.find(JournalEntry.class, id);
	}

	@Override
	public boolean updateJournalEntry(int id, JournalEntry journalEntry) {
		JournalEntry updatedJournalEntry = em.find(JournalEntry.class, journalEntry.getId());
		updatedJournalEntry.setUser(journalEntry.getUser());
		updatedJournalEntry.setPublic(journalEntry.isPublic());
		updatedJournalEntry.setComplete(journalEntry.isComplete());
		updatedJournalEntry.setTitle(journalEntry.getTitle());
		updatedJournalEntry.setEntryText(journalEntry.getEntryText());
		updatedJournalEntry.setCreateDate(journalEntry.getCreateDate());
		updatedJournalEntry.setDestination(journalEntry.getDestination());
		updatedJournalEntry.setEvent(journalEntry.getEvent());
		updatedJournalEntry.setActivity(journalEntry.getActivity());
		updatedJournalEntry.setImages(journalEntry.getImages());
		return true;
	}

	@Override
	public boolean deleteJournalEntry(int id) {
		JournalEntry journalEntry = em.find(JournalEntry.class, id);
		journalEntry.setImages(null);
		em.remove(journalEntry);
		return true;
	}

	@Override
	public List<JournalEntryImage> addJournalEntryImages(JournalEntry journalEntry, Integer[] imageIds) {
		for (Integer imgIds : imageIds) {
			journalEntry.addJournalImage(em.find(JournalEntryImage.class, imgIds));
		}
		return journalEntryImages;
	}

	@SuppressWarnings("unchecked")
	@Override
	public List<JournalEntryImage> findJournalEntryImagesById(int id) {
		journalEntryImages = (List<JournalEntryImage>) em.find(JournalEntryImage.class, id);
		return journalEntryImages;
	}

	@Override
	public boolean updateJournalEntryImages(int id, List<JournalEntryImage> journalEntryImages) {
		JournalEntryImage updatedImages = em.find(JournalEntryImage.class, id);
		for (JournalEntryImage journalEntryImage : journalEntryImages) {
			updatedImages.setImageURL(journalEntryImage.getImageURL());
			updatedImages.setJournalId(journalEntryImage.getJournalId());
		}
		return true;
	}

	@Override
	public boolean deleteJournalEntryImages(int id) {
		JournalEntryImage journalEntryImage = em.find(JournalEntryImage.class, id);
		em.remove(journalEntryImage);
		return true;
	}

	@Override
	public DestinationReview addDestinationReview(DestinationReview newDestReview) {
		em.persist(newDestReview);
		return newDestReview;
	}

	@Override
	public DestinationReview findDestinationReview(int id) {
		return em.find(DestinationReview.class, id);
	}

	@Override
	public boolean updateDestinationReview(int id, DestinationReview destReview) {
		DestinationReview updatedDestReview = em.find(DestinationReview.class, id);
		updatedDestReview.setUser(destReview.getUser());
		updatedDestReview.setDestination(destReview.getDestination());
		updatedDestReview.setCreateDate(destReview.getCreateDate());
		updatedDestReview.setTitle(destReview.getTitle());
		updatedDestReview.setRating(destReview.getRating());
		updatedDestReview.setReviewText(destReview.getReviewText());
		return true;
	}

	@Override
	public boolean deleteDestinationReview(int id) {
		DestinationReview destReview = em.find(DestinationReview.class, id);
		em.remove(destReview);
		return true;
	}

	@Override
	public EventReview addEventReview(EventReview eventReview) {
		em.persist(eventReview);
		return eventReview;
	}

	@Override
	public EventReview findEventReview(int id) {
		return em.find(EventReview.class, id);
	}

	@Override
	public boolean updateEventReview(int id, EventReview eventReview) {
		EventReview updatedEventReview = em.find(EventReview.class, id);
		updatedEventReview.setUser(eventReview.getUser());
		updatedEventReview.setEvent(eventReview.getEvent());
		updatedEventReview.setCreateDate(eventReview.getCreateDate());
		updatedEventReview.setTitle(eventReview.getTitle());
		updatedEventReview.setRating(eventReview.getRating());
		updatedEventReview.setReview_text(eventReview.getReview_text());
		return true;
	}

	@Override
	public boolean deleteEventReview(int id) {
		EventReview eventReview = em.find(EventReview.class, id);
		em.remove(eventReview);
		return true;
	}

	@Override
	public PointOfInterestComment addPOIComment(PointOfInterestComment poiComment) {
		em.persist(poiComment);
		return poiComment;
	}

	@Override
	public PointOfInterestComment findPOIComment(int id) {
		return em.find(PointOfInterestComment.class, id);
	}

	@Override
	public boolean updatePOIComment(int id, PointOfInterestComment poiComment) {
		PointOfInterestComment updatedPoiComment = em.find(PointOfInterestComment.class, id);
		updatedPoiComment.setUser(poiComment.getUser());
		updatedPoiComment.setPoint(poiComment.getPoint());
		updatedPoiComment.setCommentText(poiComment.getCommentText());
		updatedPoiComment.setRating(poiComment.getRating());
		updatedPoiComment.setCommentDate(poiComment.getCommentDate());
		return true;
	}
	
}