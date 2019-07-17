package com.skilldistillery.tripping.entities;

import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;

import org.hibernate.annotations.CreationTimestamp;

@Entity
public class DestinationReview {

//	Declarations

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private int id;

	@Column(name = "user_id")
	private int userId;

	@Column(name = "destination_id")
	private String destinationId;

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

	public int getUserId() {
		return userId;
	}

	public void setUserId(int userId) {
		this.userId = userId;
	}

	public String getDestinationId() {
		return destinationId;
	}

	public void setDestinationId(String destinationId) {
		this.destinationId = destinationId;
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

	public DestinationReview(int id, int userId, String destinationId, Date createDate, String title, int rating,
			String reviewText) {
		super();
		this.id = id;
		this.userId = userId;
		this.destinationId = destinationId;
		this.createDate = createDate;
		this.title = title;
		this.rating = rating;
		this.reviewText = reviewText;
	}

//	To String

	@Override
	public String toString() {
		StringBuilder builder = new StringBuilder();
		builder.append("DestinationReview [id=").append(id).append(", userId=").append(userId).append(", title=")
				.append(title).append("]");
		return builder.toString();
	}

}
