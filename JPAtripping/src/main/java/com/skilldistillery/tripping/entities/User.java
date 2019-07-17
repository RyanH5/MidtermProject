package com.skilldistillery.tripping.entities;

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
	private List<DestinationReview> destinationReviews;

	@OneToMany(mappedBy = "user")
	private List<PointOfInterestComment> pointOfInterestComments;

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

	public List<DestinationReview> getDestinationReviews() {
		return destinationReviews;
	}

	public void setDestinationReviews(List<DestinationReview> destinationReviews) {
		this.destinationReviews = destinationReviews;
	}

	public List<PointOfInterestComment> getPointOfInterestComments() {
		return pointOfInterestComments;
	}

	public void setPointOfInterestComments(List<PointOfInterestComment> pointOfInterestComments) {
		this.pointOfInterestComments = pointOfInterestComments;
	}

//	Constructors
	public User() {
	}

	public User(String userName, String password, String firstName, String lastName, Date createDate, String email,
			List<JournalEntry> journalEntries, String imageURL, String role, boolean active,
			List<EventReview> eventReviews, List<DestinationReview> destinationReviews,
			List<PointOfInterestComment> pointOfInterestComments) {
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
		this.destinationReviews = destinationReviews;
		this.pointOfInterestComments = pointOfInterestComments;
	}

//	To String

	@Override
	public String toString() {
		StringBuilder builder = new StringBuilder();
		builder.append("User [id=").append(id).append(", userName=").append(userName).append("]");
		return builder.toString();
	}

}
