package com.skilldistillery.tripping.entities;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;

@Entity
public class Address {

//	Declarations

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private int id;

	@Column(name = "street_1")
	private String street1;

	@Column(name = "street_2")
	private String street2;

	@Column(name = "city")
	private String city;

	@Column(name = "state")
	private String state;

	@Column(name = "zip_code")
	private String zip_code;

	@Column(name = "phone")
	private String phone;

	@Column(name = "latitude")
	private double latitude;

	@Column(name = "longitude")
	private double longitude;

//	Getters and setters

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getStreet1() {
		return street1;
	}

	public void setStreet1(String street1) {
		this.street1 = street1;
	}

	public String getStreet2() {
		return street2;
	}

	public void setStreet2(String street2) {
		this.street2 = street2;
	}

	public String getCity() {
		return city;
	}

	public void setCity(String city) {
		this.city = city;
	}

	public String getState() {
		return state;
	}

	public void setState(String state) {
		this.state = state;
	}

	public String getZip_code() {
		return zip_code;
	}

	public void setZip_code(String zip_code) {
		this.zip_code = zip_code;
	}

	public String getPhone() {
		return phone;
	}

	public void setPhone(String phone) {
		this.phone = phone;
	}

	public double getLatitude() {
		return latitude;
	}

	public void setLatitude(double latitude) {
		this.latitude = latitude;
	}

	public double getLongitude() {
		return longitude;
	}

	public void setLongitude(double longitude) {
		this.longitude = longitude;
	}

//	Constructors

	public Address() {
	}

	public Address(int id, String street1, String street2, String city, String state, String zip_code, String phone,
			double latitude, double longitude) {
		super();
		this.id = id;
		this.street1 = street1;
		this.street2 = street2;
		this.city = city;
		this.state = state;
		this.zip_code = zip_code;
		this.phone = phone;
		this.latitude = latitude;
		this.longitude = longitude;
	}

//	To String

	@Override
	public String toString() {
		StringBuilder builder = new StringBuilder();
		builder.append("Address [id=").append(id).append(", street1=").append(street1).append(", city=").append(city)
				.append(", state=").append(state).append("]");
		return builder.toString();
	}

}
