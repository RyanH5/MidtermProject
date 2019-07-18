package com.skilldistillery.tripping.entities;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.ManyToMany;
import javax.persistence.OneToMany;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;

import org.hibernate.annotations.CreationTimestamp;

@Entity
public class User {

//	Declarations

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private int id;

	@Column(name = "username")
	private String userName;

	@Column(name = "password")
	private String password;

	@Column(name = "first_name")
	private String firstName;

	@Column(name = "last_name")
	private String lastName;

	@Column(name = "create_date")
	@Temporal(TemporalType.TIMESTAMP)
	@CreationTimestamp
	private Date createDate;

	@Column(name = "email")
	private String email;

	@OneToMany(mappedBy = "user")
	private List<JournalEntry> journalEntries;

	@Column(name = "image_url")
	private String imageURL;

	@Column(name = "role")
	private String role;

	@Column(name = "active")
	private boolean active;

	@OneToMany(mappedBy = "user")
	private List<EventReview> eventReviews;

	@OneToMany(mappedBy = "user")
	private List<DestinationReview> destReviews;

	@OneToMany(mappedBy = "user")
	private List<PointOfInterestComment> pointComments;

//	Getters and setters

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getUserName() {
		return userName;
	}

	public void setUserName(String userName) {
		this.userName = userName;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public String getFirstName() {
		return firstName;
	}

	public void setFirstName(String firstName) {
		this.firstName = firstName;
	}

	public String getLastName() {
		return lastName;
	}

	public void setLastName(String lastName) {
		this.lastName = lastName;
	}

	public Date getCreateDate() {
		return createDate;
	}

	public void setCreateDate(Date createDate) {
		this.createDate = createDate;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public List<JournalEntry> getJournalEntryId() {
		return journalEntries;
	}

	public void setJournalEntryId(List<JournalEntry> journalEntryId) {
		this.journalEntries = journalEntryId;
	}

	public String getImageURL() {
		return imageURL;
	}

	public void setImageURL(String imageURL) {
		this.imageURL = imageURL;
	}

	public String getRole() {
		return role;
	}

	public void setRole(String role) {
		this.role = role;
	}

	public boolean isActive() {
		return active;
	}

	public void setActive(boolean active) {
		this.active = active;
	}

	public List<JournalEntry> getJournalEntries() {
		return journalEntries;
	}

	public void setJournalEntries(List<JournalEntry> journalEntries) {
		this.journalEntries = journalEntries;
	}

	public List<EventReview> getEventReviews() {
		return eventReviews;
	}

	public void setEventReviews(List<EventReview> eventReviews) {
		this.eventReviews = eventReviews;
	}

	public List<DestinationReview> getDestReviews() {
		return destReviews;
	}

	public void setDestReviews(List<DestinationReview> destReviews) {
		this.destReviews = destReviews;
	}

	public List<PointOfInterestComment> getPointComments() {
		return pointComments;
	}

	public void setPointComments(List<PointOfInterestComment> pointComments) {
		this.pointComments = pointComments;
	}

	public void addJournalEntry(JournalEntry journalEntry) {
		if (journalEntries == null)
			journalEntries = new ArrayList<>();
		if (!journalEntries.contains(journalEntry)) {
			journalEntries.add(journalEntry);
		}
	}

	public void removeJournalEntry(JournalEntry journalEntry) {
		if (journalEntries != null && journalEntries.contains(journalEntry)) {
			journalEntries.remove(journalEntry);
		}
	}

	public void addEventReview(EventReview eventReview) {
		if (eventReviews == null)
			eventReviews = new ArrayList<>();
		if (!eventReviews.contains(eventReview)) {
			eventReviews.add(eventReview);
		}
	}

	public void removeEventReview(EventReview eventReview) {
		if (eventReviews != null && eventReviews.contains(eventReview)) {
			eventReviews.remove(eventReview);
		}
	}

	public void addDestinationReview(DestinationReview destReview) {
		if (destReviews == null)
			destReviews = new ArrayList<>();
		if (!destReviews.contains(destReview)) {
			destReviews.add(destReview);
		}
	}

	public void removeDestinationReview(DestinationReview destReview) {
		if (destReviews != null && destReviews.contains(destReview)) {
			destReviews.remove(destReview);
		}
	}

	public void addPointComment(PointOfInterestComment pointComment) {
		if (pointComments == null)
			pointComments = new ArrayList<>();
		if (!pointComments.contains(pointComment)) {
			pointComments.add(pointComment);
		}
	}

	public void removePointComment(PointOfInterestComment pointComment) {
		if (pointComments != null && pointComments.contains(pointComment)) {
			pointComments.remove(pointComment);
		}
	}

//	Constructors
	public User() {
	}

	public User(String userName, String password, String firstName, String lastName, Date createDate, String email,
			List<JournalEntry> journalEntries, String imageURL, String role, boolean active,
			List<EventReview> eventReviews, List<DestinationReview> destReviews,
			List<PointOfInterestComment> pointComments, PointOfInterest point) {
		super();
		this.userName = userName;
		this.password = password;
		this.firstName = firstName;
		this.lastName = lastName;
		this.createDate = createDate;
		this.email = email;
		this.journalEntries = journalEntries;
		this.imageURL = imageURL;
		this.role = role;
		this.active = active;
		this.eventReviews = eventReviews;
		this.destReviews = destReviews;
		this.pointComments = pointComments;
	}

	@Override
	public String toString() {
		StringBuilder builder = new StringBuilder();
		builder.append("User [id=");
		builder.append(id);
		builder.append(", userName=");
		builder.append(userName);
		builder.append(", password=");
		builder.append(password);
		builder.append(", firstName=");
		builder.append(firstName);
		builder.append(", lastName=");
		builder.append(lastName);
		builder.append(", createDate=");
		builder.append(createDate);
		builder.append(", email=");
		builder.append(email);
		builder.append(", imageURL=");
		builder.append(imageURL);
		builder.append(", role=");
		builder.append(role);
		builder.append(", active=");
		builder.append(active);
		builder.append("]");
		return builder.toString();
	}

	


}
