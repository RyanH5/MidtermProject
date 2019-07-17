package com.skilldistillery.tripping.entities;

import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;

import org.hibernate.annotations.CreationTimestamp;

@Entity
@Table(name="destination_user_review ")
public class DestinationReview {

//	Declarations

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private int id;

	@ManyToOne
	@JoinColumn(name = "user_id")
	private User user;

	@Column(name = "destination_id")
	private String destination;

	@Column(name = "create_date")
	@Temporal(TemporalType.TIMESTAMP)
	@CreationTimestamp
	private Date createDate;

	@Column(name = "title")
	private String title;

	@Column(name = "rating")
	private int rating;

	@Column(name = "review_text")
	private String reviewText;

	
//	Getters and Setters

	

	

public int getId() {
		return id;
	}



	public void setId(int id) {
		this.id = id;
	}



	public User getUser() {
		return user;
	}



	public void setUser(User user) {
		this.user = user;
	}



	public String getDestination() {
		return destination;
	}



	public void setDestination(String destination) {
		this.destination = destination;
	}



	public Date getCreateDate() {
		return createDate;
	}



	public void setCreateDate(Date createDate) {
		this.createDate = createDate;
	}



	public String getTitle() {
		return title;
	}



	public void setTitle(String title) {
		this.title = title;
	}



	public int getRating() {
		return rating;
	}



	public void setRating(int rating) {
		this.rating = rating;
	}



	public String getReviewText() {
		return reviewText;
	}



	public void setReviewText(String reviewText) {
		this.reviewText = reviewText;
	}

//	Constructors
	
	public DestinationReview() {
	}


	public DestinationReview(User user, String destination, Date createDate, String title, int rating,
			String reviewText) {
		super();
		this.user = user;
		this.destination = destination;
		this.createDate = createDate;
		this.title = title;
		this.rating = rating;
		this.reviewText = reviewText;
	}

	
}
