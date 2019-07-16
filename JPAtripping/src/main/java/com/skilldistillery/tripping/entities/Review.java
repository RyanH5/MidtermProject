package com.skilldistillery.tripping.entities;

import javax.persistence.Column;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;

public class Review {

//	Declarations
	
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private int id;
	
	@Column(name = "user_id")
	private int userId;
	
	@Column(name = "destination_id")
	private int destId;
	
	@Column(name = "rating_number")
	private int ratingNumber;
	
	@Column(name = "rating_test")
	private String ratingTest;
	
//	Getters and setters

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

	public int getDestId() {
		return destId;
	}

	public void setDestId(int destId) {
		this.destId = destId;
	}

	public int getRatingNumber() {
		return ratingNumber;
	}

	public void setRatingNumber(int ratingNumber) {
		this.ratingNumber = ratingNumber;
	}

	public String getRatingTest() {
		return ratingTest;
	}

	public void setRatingTest(String ratingTest) {
		this.ratingTest = ratingTest;
	}

//	Constructors
	
	public Review() {
	}

	public Review(int id, int userId, int destId, int ratingNumber, String ratingTest) {
		super();
		this.id = id;
		this.userId = userId;
		this.destId = destId;
		this.ratingNumber = ratingNumber;
		this.ratingTest = ratingTest;
	}

//	To String
	
	@Override
	public String toString() {
		return "Review [id=" + id + ", userId=" + userId + "]";
	}
	
}
