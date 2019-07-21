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
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.persistence.Table;

@Entity
@Table(name = "point_of_interest")
public class PointOfInterest {

//	Declarations
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private int id;

	@Column(name = "name")
	private String name;

	@ManyToOne
	@JoinColumn(name = "address_id")
	private Address address;

	@ManyToOne
	@JoinColumn(name = "destination_id")
	private Destination destination;

	@Column(name = "short_description")
	private String shortDescription;

	@Column(name = "long_description")
	private String longDescription;

	@ManyToMany(cascade = { CascadeType.PERSIST, CascadeType.REMOVE })
	@JoinTable(name = "point_of_interest_has_amenity", joinColumns = {
	@JoinColumn(name = "point_of_interest_id") }, inverseJoinColumns = { @JoinColumn(name = "amenity_id") })
	private List<Amenity> amenities;

	@ManyToMany(cascade = { CascadeType.PERSIST, CascadeType.REMOVE })
	@JoinTable(name = "point_of_interest_has_activity", joinColumns = {
			@JoinColumn(name = "point_of_interest_id") }, inverseJoinColumns = { @JoinColumn(name = "activity_id") })
	private List<Activity> activities;

	@OneToMany(mappedBy = "point")
	private List<PointOfInterestComment> comments;

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

	public Destination getDestination() {
		return destination;
	}

	public void setDestination(Destination destination) {
		this.destination = destination;
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

//	Constructors
	public PointOfInterest() {
	}

//	To String
	@Override
	public String toString() {
		StringBuilder builder = new StringBuilder();
		builder.append("PointOfInterest [id=").append(id).append(", name=").append(name).append("]");
		return builder.toString();
	}

	public Address getAddress() {
		return address;
	}

	public void setAddress(Address address) {
		this.address = address;
	}

	public List<Activity> getActivities() {
		return activities;
	}

	public void setActivities(List<Activity> activities) {
		this.activities = activities;
	}

	public List<Amenity> getAmenities() {
		return amenities;
	}

	public void setAmenities(List<Amenity> amenities) {
		this.amenities = amenities;
	}

	public List<PointOfInterestComment> getComments() {
		return comments;
	}

	public void setComments(List<PointOfInterestComment> comments) {
		this.comments = comments;
	}
	
	public void addComment(PointOfInterestComment comment) {
		if (comments == null)
			comments = new ArrayList<>();
		if (!comments.contains(comment)) {
			comments.add(comment);
			comment.setPoint(this);
		}
	}

	public void removeComment(PointOfInterestComment comment) {
		if (comments != null && comments.contains(comment)) {
			comments.remove(comment);
			comment.setPoint(null);
		}
	}

	public void addActivity(Activity activity) {
		if (activities == null)
			activities = new ArrayList<>();
		if (!activities.contains(activity)) {
			activities.add(activity);
			activity.addPoint(this);
		}
	}

	public void removeActivity(Activity activity) {
		if (activities != null && activities.contains(activity)) {
			activities.remove(activity);
			activity.removePoint(this);
		}
	}

	public void addAmenity(Amenity amenity) {
		if (amenities == null)
			amenities = new ArrayList<>();
		if (!amenities.contains(amenity)) {
			amenities.add(amenity);
			amenity.addPoint(this);
			;
		}
	}

	public void removeAmenity(Amenity amenity) {
		if (amenities != null && amenities.contains(amenity)) {
			amenities.remove(amenity);
			amenity.removePoint(this);
		}
	}

	@Override
	public int hashCode() {
		final int prime = 31;
		int result = 1;
		result = prime * result + id;
		return result;
	}

	@Override
	public boolean equals(Object obj) {
		if (this == obj)
			return true;
		if (obj == null)
			return false;
		if (getClass() != obj.getClass())
			return false;
		PointOfInterest other = (PointOfInterest) obj;
		if (id != other.id)
			return false;
		return true;
	}

}
