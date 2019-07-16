package com.skilldistillery.tripping.entities;

import javax.persistence.Column;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;

public class PointOfInterest {
	
//	Declarations
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private int id;
	
	@Column(name="name")
	private String name;
	
	@Column(name="address_id")
	private String addressId;
	
	@Column(name="destination_id")
	private String destinationId;
	
	@Column(name="short_description")
	private String shortDestination;
	
	@Column(name="long_description")
	private String longDescription;

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getAddressId() {
		return addressId;
	}

	public void setAddressId(String addressId) {
		this.addressId = addressId;
	}

	public String getDestinationId() {
		return destinationId;
	}

	public void setDestinationId(String destinationId) {
		this.destinationId = destinationId;
	}

	public String getShortDestination() {
		return shortDestination;
	}

	public void setShortDestination(String shortDestination) {
		this.shortDestination = shortDestination;
	}

	public String getLongDescription() {
		return longDescription;
	}

	public void setLongDescription(String longDescription) {
		this.longDescription = longDescription;
	}

//	Constructors
	public PointOfInterest() {
	}

	public PointOfInterest(int id, String name, String addressId, String destinationId, String shortDestination,
			String longDescription) {
		super();
		this.id = id;
		this.name = name;
		this.addressId = addressId;
		this.destinationId = destinationId;
		this.shortDestination = shortDestination;
		this.longDescription = longDescription;
	}

//	To String
	@Override
	public String toString() {
		StringBuilder builder = new StringBuilder();
		builder.append("PointOfInterest [id=").append(id).append(", name=").append(name).append("]");
		return builder.toString();
	}
	
}
