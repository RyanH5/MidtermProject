package com.skilldistillery.tripping.entities;

import java.util.List;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.OneToMany;

@Entity
public class Destination {

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private int id;
	private String name;	

	@Column(name="short_description")
	private String shortDescription;
	
	@Column(name="image_url")
	private String image;

	@OneToMany(mappedBy="destination")
	private List<DestinationReview> destinationReviews;
	
	@OneToMany(mappedBy="destination")
	private List<PointOfInterest> points;
	
	@OneToMany(mappedBy="destination")
	private List<Event> events;

	public Destination() {
		super();
	}

	public Destination(String name, String shortDescription, String description, String image,
			List<DestinationReview> destinationUserReviews, List<User> users) {
		super();
		this.name = name;
		this.shortDescription = shortDescription;
		this.description = description;
		this.image = image;
		this.destinationReviews = destinationUserReviews;
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

	public String getDescription() {
		return description;
	}

	public void setDescription(String description) {
		this.description = description;
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
	
	
}
