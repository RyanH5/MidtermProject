package com.skilldistillery.tripping.entities;

import java.util.*;

import javax.persistence.*;

@Entity
public class Destination {

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private int id;
	private String name;

	@Column(name = "short_description")
	private String shortDescription;

	private String description;

	public String getDescription() {
		return description;
	}

	public void setDescription(String description) {
		this.description = description;
	}

	@Column(name = "image_url")
	private String image;

	@OneToMany(mappedBy = "destination")
	private List<DestinationReview> destinationReviews;

	@OneToMany(mappedBy = "destination")
	private List<PointOfInterest> points;

	@OneToMany(mappedBy = "destination")
	private List<Event> events;

//	INSTEAD OF VOID ID LIKE TO RETURN A STRING TO SHOW THAT ALL ADD/REMOVE WORK
	public void addDestinationReview(DestinationReview review) {
		if (destinationReviews == null) {
			destinationReviews = new ArrayList<>();
		}

		if (!destinationReviews.contains(review)) {
			destinationReviews.add(review);
			review.setDestination(this);
		}
	}

	public void removeDestinationReview(DestinationReview review) {
		if (destinationReviews != null && destinationReviews.contains(review)) {
			destinationReviews.remove(review);
		}
	}

	public void addPointOfInteres(PointOfInterest poi) {
		if (points == null) {
			points = new ArrayList<>();
		}

		if (!points.contains(poi)) {
			points.add(poi);
			poi.setDestination(this);
		}
	}

	public void removePointOfInterest(PointOfInterest poi) {
		if (points != null && points.contains(poi)) {
			points.remove(poi);
		}
	}

	public void addEvent(Event event) {
		if (events == null) {
			events = new ArrayList<>();
		}

		if (!events.contains(event)) {
			events.add(event);
			event.setDestination(this);
		}
	}

	public void removeEvent(Event event) {
		if (events != null && events.contains(event)) {
			events.remove(event);
		}
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
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

	public String getImage() {
		return image;
	}

	public void setImage(String image) {
		this.image = image;
	}

	public List<DestinationReview> getDestinationReviews() {
		return destinationReviews;
	}

	public void setDestinationReviews(List<DestinationReview> destinationReviews) {
		this.destinationReviews = destinationReviews;
	}

	public List<PointOfInterest> getPoints() {
		return points;
	}

	public void setPoints(List<PointOfInterest> points) {
		this.points = points;
	}

	public List<Event> getEvents() {
		return events;
	}

	public void setEvents(List<Event> events) {
		this.events = events;
	}

	public Destination() {
		super();
	}

	public Destination(String name, String shortDescription, String image,
			List<DestinationReview> destinationUserReviews, List<User> users) {
		super();
		this.name = name;
		this.shortDescription = shortDescription;
		this.image = image;
		this.destinationReviews = destinationUserReviews;
	}

}
