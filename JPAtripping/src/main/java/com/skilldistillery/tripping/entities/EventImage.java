package com.skilldistillery.tripping.entities;

import javax.persistence.Column;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;

public class EventImage {
	
//	Declarations

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private int id;

	@Column(name = "event_id")
	private int eventId;

	@Column(name = "path")
	private String path;
	
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

	public String getPath() {
		return path;
	}

	public void setPath(String path) {
		this.path = path;
	}
	
//	Constructors

	public EventImage() {
	}

	public EventImage(int id, int eventId, String path) {
		super();
		this.id = id;
		this.eventId = eventId;
		this.path = path;
	}

//	To String
	
	@Override
	public String toString() {
		return "EventImage [id=" + id + ", path=" + path + "]";
	}


}
