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
@Table(name = "destination_user_review ")
public class DestinationReview {

//	Declarations

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private int id;

	@ManyToOne
	@JoinColumn(name = "user_id")
	private User user;

	@Override
	public String toString() {
		StringBuilder builder = new StringBuilder();
		builder.append("DestinationReview [user=");
		builder.append(user);
		builder.append(", destination=");
		builder.append(destination);
		builder.append(", createDate=");
		builder.append(createDate);
		builder.append("]");
		return builder.toString();
	}

	@ManyToOne
	@JoinColumn(name = "destination_id")
	private Destination destination;

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

	public Destination getDestination() {
		return destination;
	}

	public void setDestination(Destination destination) {
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

	public DestinationReview() {
	}

	public DestinationReview(User user, Destination destination, Date createDate, String title, int rating,
			String reviewText) {
		this.user = user;
		this.destination = destination;
		this.createDate = createDate;
		this.title = title;
		this.rating = rating;
		this.reviewText = reviewText;
	}

	public DestinationReview(Destination destination, User user) {
		this.user = user;
		this.destination = destination;
	}
}
