package com.skilldistillery.tripping.entities;

import java.util.ArrayList;
import java.util.List;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;

import javax.persistence.JoinColumn;
import javax.persistence.JoinTable;
import javax.persistence.ManyToMany;


@Entity
public class Amenity {

//	declarations

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private int id;

	@Column(name = "name")
	private String name;

	@Override
	public String toString() {
		StringBuilder builder = new StringBuilder();
		builder.append("Amenity [name=");
		builder.append(name);
		builder.append(", shortDescription=");
		builder.append(shortDescription);
		builder.append("]");
		return builder.toString();
	}

	@Column(name = "short_description")
	private String shortDescription;

	@Column(name = "long_description")
	private String longDescription;

	@Column(name = "icon_url")
	private String iconUrl;
	
	@ManyToMany(cascade = { CascadeType.PERSIST, CascadeType.REMOVE })
	@JoinTable(name = "point_of_interest_has_amenity", 
	joinColumns = {	@JoinColumn(name = "amenity_id") }, 
	inverseJoinColumns = { @JoinColumn(name = "point_of_interest_id") })
	private List<PointOfInterest> points;

//	@OneToMany(mappedBy="amenity")
//	private Amenity amenity;

	public List<PointOfInterest> getPoints() {
		return points;
	}

	public void setPoints(List<PointOfInterest> points) {
		this.points = points;
	}

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

	public String getShortDescription() {
		return shortDescription;
	}

	public void setShortDescription(String shortDescription) {
		this.shortDescription = shortDescription;
	}

	public String getLongDescription() {
		return longDescription;
	}

	public void setLongDescription(String longDescription) {
		this.longDescription = longDescription;
	}

	public String getIconUrl() {
		return iconUrl;
	}

	public void setIconUrl(String iconUrl) {
		this.iconUrl = iconUrl;
	}

	// Constructors

	public Amenity() {
	}

	
//	To String

	@Override
	public int hashCode() {
		final int prime = 31;
		int result = 1;
		result = prime * result + id;
		return result;
	}

	public Amenity(String name, String shortDescription) {
		super();
		this.name = name;
		this.shortDescription = shortDescription;
	}

	@Override
	public boolean equals(Object obj) {
		if (this == obj)
			return true;
		if (obj == null)
			return false;
		if (getClass() != obj.getClass())
			return false;
		Amenity other = (Amenity) obj;
		if (id != other.id)
			return false;
		return true;
	}

	public void addPoint(PointOfInterest pointOfInterest) {
		if (points == null)
			points = new ArrayList<>();
		if (!points.contains(pointOfInterest)) {
			points.add(pointOfInterest);
			pointOfInterest.addAmenity(this);
		
		}
	}

	public void removePoint(PointOfInterest pointOfInterest) {
		if (points != null && points.contains(pointOfInterest)) {
			points.remove(pointOfInterest);
			pointOfInterest.removeAmenity(this);
		}
	}

}