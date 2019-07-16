package com.skilldistillery.tripping.entities;

import java.util.Date;

import javax.persistence.Column;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;

import org.hibernate.annotations.CreationTimestamp;

public class PointOfInterestComment {

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private int id;

	@Column(name="user_id")
	private String userId;
	
	@Column(name="poi_id")
	private String poiId;
	
	@Column(name="comment_text")
	private String commentText;
	
	@Column(name="rating")
	private int rating;
	
	@Column(name = "comment_date")
	@Temporal(TemporalType.TIMESTAMP)
	@CreationTimestamp
	private Date commentDate;

//	Getters and setters
	
	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getUserId() {
		return userId;
	}

	public void setUserId(String userId) {
		this.userId = userId;
	}

	public String getPoiId() {
		return poiId;
	}

	public void setPoiId(String poiId) {
		this.poiId = poiId;
	}

	public String getCommentText() {
		return commentText;
	}

	public void setCommentText(String commentText) {
		this.commentText = commentText;
	}

	public int getRating() {
		return rating;
	}

	public void setRating(int rating) {
		this.rating = rating;
	}

	public Date getCommentDate() {
		return commentDate;
	}

	public void setCommentDate(Date commentDate) {
		this.commentDate = commentDate;
	}
	
//	Constructors

	public PointOfInterestComment() {
	}

	public PointOfInterestComment(int id, String userId, String poiId, String commentText, int rating,
			Date commentDate) {
		super();
		this.id = id;
		this.userId = userId;
		this.poiId = poiId;
		this.commentText = commentText;
		this.rating = rating;
		this.commentDate = commentDate;
	}

//	To String
	@Override
	public String toString() {
		StringBuilder builder = new StringBuilder();
		builder.append("PointOfInterestComment [id=").append(id).append(", commentText=").append(commentText)
				.append("]");
		return builder.toString();
	}

	
}
