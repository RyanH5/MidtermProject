package com.skilldistillery.tripping.entities;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;

@Entity
public class EventImage {

//	Declarations

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private int id;

	@Column(name = "event_id")
	private int eventId;

	@Column(name = "image_url")
	private String imageUrl;

//	Getters and setters

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public int getEventId() {
		return eventId;
	}

	public void setEventId(int eventId) {
		this.eventId = eventId;
	}

	public String getImageUrl() {
		return imageUrl;
	}

	public void setImageUrl(String imageUrl) {
		this.imageUrl = imageUrl;
	}

//	Constructors

	public EventImage() {
	}

	public EventImage(int id, int eventId, String imageUrl) {
		super();
		this.id = id;
		this.eventId = eventId;
		this.imageUrl = imageUrl;
	}

//	To String
	@Override
	public String toString() {
		StringBuilder builder = new StringBuilder();
		builder.append("EventImage [id=").append(id).append(", imageUrl=").append(imageUrl).append("]");
		return builder.toString();
	}

}
