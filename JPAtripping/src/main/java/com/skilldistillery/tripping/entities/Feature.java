package com.skilldistillery.tripping.entities;

import javax.persistence.Column;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;

public class Feature {
	
//	declarations
	
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private int id;
	
	@Column(name = "destination_id")
	private int destId;
	
	@Column(name = "restaurant")
	private String restaurant;
	
	@Column(name = "hotel")
	private String hotel;
	
	@Column(name = "campsite")
	private String campsite;
	
	@Column(name = "pet_friendly")
	private String petFriendly;
	
	@Column(name = "accessible")
	private String accessible;

//	Getters and setters
	
	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public int getDestId() {
		return destId;
	}

	public void setDestId(int destId) {
		this.destId = destId;
	}

	public String getRestaurant() {
		return restaurant;
	}

	public void setRestaurant(String restaurant) {
		this.restaurant = restaurant;
	}

	public String getHotel() {
		return hotel;
	}

	public void setHotel(String hotel) {
		this.hotel = hotel;
	}

	public String getCampsite() {
		return campsite;
	}

	public void setCampsite(String campsite) {
		this.campsite = campsite;
	}

	public String getPetFriendly() {
		return petFriendly;
	}

	public void setPetFriendly(String petFriendly) {
		this.petFriendly = petFriendly;
	}

	public String getAccessible() {
		return accessible;
	}

	public void setAccessible(String accessible) {
		this.accessible = accessible;
	}

//	Constructors
	
	public Feature() {
	}

	public Feature(int id, int destId, String restaurant, String hotel, String campsite, String petFriendly,
			String accessible) {
		super();
		this.id = id;
		this.destId = destId;
		this.restaurant = restaurant;
		this.hotel = hotel;
		this.campsite = campsite;
		this.petFriendly = petFriendly;
		this.accessible = accessible;
	}
	
//	To String

	@Override
	public String toString() {
		return "Features [id=" + id + ", restaurant=" + restaurant + ", hotel=" + hotel + ", campsite=" + campsite
				+ ", petFriendly=" + petFriendly + ", accessible=" + accessible + "]";
	}

}
