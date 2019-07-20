package com.skilldistillery.tripping.entities;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;

@Entity
public class EventImage {

//	Declarations

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private int id;

	@ManyToOne
	@JoinColumn(name = "event_id")
	private Event event;

	@Column(name = "image_url")
	private String imageUrl;

//	Getters and setters

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}


	public Event getEvent() {
		return event;
	}

	public void setEvent(Event event) {
		this.event = event;
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

	public EventImage(int id, Event event, String imageUrl) {
		super();
		this.id = id;
		this.event = event;
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
