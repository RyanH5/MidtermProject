package com.skilldistillery.tripping.entities;

import java.util.Date;
import java.util.List;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;

@Entity
public class Event {

//	Declarations

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private int id;

	@ManyToOne
	@JoinColumn(name = "destination_id")
	private Destination destination;

	@OneToMany
	@JoinColumn(name = "event_id")
	private List<EventReview> reviews;

	@OneToMany
	@JoinColumn(name = "event_id")
	private List<EventImage> images;

	@Column(name = "name")
	private String name;

	@Column(name = "short_description")
	private String shortDescription;

	@Column(name = "long_description")
	private String longDescription;

	@Column(name = "start_date")
	@Temporal(TemporalType.TIMESTAMP)
	private Date startDate;

	@Column(name = "end_date")
	@Temporal(TemporalType.TIMESTAMP)
	private Date endDate;

	@Column(name = "event_details")
	private String eventDetails;

//	Getters and Setters

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public Destination getDestination() {
		return destination;
	}

	public void setDestination(Destination destination) {
		this.destination = destination;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getShortDescription() {
		return shortDescription;
	}

	public void setShortDescription(String shortDescription) {
		this.shortDescription = shortDescription;
	}

	public String getLongDescription() {
		return longDescription;
	}

	public void setLongDescription(String longDescription) {
		this.longDescription = longDescription;
	}

	public Date getStartDate() {
		return startDate;
	}

	public void setStartDate(Date startDate) {
		this.startDate = startDate;
	}

	public Date getEndDate() {
		return endDate;
	}

	public void setEndDate(Date endDate) {
		this.endDate = endDate;
	}

	public String getEventDetails() {
		return eventDetails;
	}

	public void setEventDetails(String eventDetails) {
		this.eventDetails = eventDetails;
	}

	public List<EventImage> getImages() {
		return images;
	}

	public void setImage(List<EventImage> images) {
		this.images = images;
	}

	public List<EventReview> getReviews() {
		return reviews;
	}

	public void setReviews(List<EventReview> reviews) {
		this.reviews = reviews;
	}

//	Constructors

	public Event() {
	}

//	To String

	public Event(Destination destination, String name, String shortDescription, String longDescription, Date startDate,
			Date endDate, String eventDetails) {
		super();
		this.destination = destination;
		this.name = name;
		this.shortDescription = shortDescription;
		this.longDescription = longDescription;
		this.startDate = startDate;
		this.endDate = endDate;
		this.eventDetails = eventDetails;
	}

	@Override
	public String toString() {
		StringBuilder builder = new StringBuilder();
		builder.append("Event [id=").append(id).append(", name=").append(name).append("]");
		return builder.toString();
	}

}
