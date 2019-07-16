package com.skilldistillery.tripping.entities;

import java.util.Date;
import java.util.List;

import javax.persistence.Column;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;

public class Event {

//	Declarations

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private int id;

	@Column(name = "start_date")
	private Date startDate;

	@Column(name = "end_date")
	private Date endDate;

	@Column(name = "began_date")
	private Date beganDate;

	@Column(name = "destination_id")
	private int destId;

	@Column(name = "review")
	private List<Review> reviews;

	@Column(name = "sh_description")
	private String shortDescrition;

	@Column(name = "long_description")
	private String longDescrition;

	@Column(name = "event_image")
	private List<EventImage> eventImages;

//	Getters and Setters

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
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

	public Date getBeganDate() {
		return beganDate;
	}

	public void setBeganDate(Date beganDate) {
		this.beganDate = beganDate;
	}

	public int getDestId() {
		return destId;
	}

	public void setDestId(int destId) {
		this.destId = destId;
	}

	public List<Review> getReviews() {
		return reviews;
	}

	public void setReviews(List<Review> reviews) {
		this.reviews = reviews;
	}

	public String getShortDescrition() {
		return shortDescrition;
	}

	public void setShortDescrition(String shortDescrition) {
		this.shortDescrition = shortDescrition;
	}

	public String getLongDescrition() {
		return longDescrition;
	}

	public void setLongDescrition(String longDescrition) {
		this.longDescrition = longDescrition;
	}

	public List<EventImage> getEventImages() {
		return eventImages;
	}

	public void setEventImages(List<EventImage> eventImages) {
		this.eventImages = eventImages;
	}

//	Constructors

	public Event() {
	}

	public Event(int id, Date startDate, Date endDate, Date beganDate, int destId, List<Review> reviews,
			String shortDescrition, String longDescrition, List<EventImage> eventImages) {
		super();
		this.id = id;
		this.startDate = startDate;
		this.endDate = endDate;
		this.beganDate = beganDate;
		this.destId = destId;
		this.reviews = reviews;
		this.shortDescrition = shortDescrition;
		this.longDescrition = longDescrition;
		this.eventImages = eventImages;
	}

//	To String
	
	@Override
	public String toString() {
		return "Event [id=" + id + ", shortDescrition=" + shortDescrition + "]";
	}

}
