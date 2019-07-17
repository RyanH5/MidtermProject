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
import javax.persistence.Table;


@Entity
@Table(name="activity")
public class Activity {

//	Declarations

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private int id;

	@Column(name = "name")
	private String name;

	@Column(name = "short_description")
	private String shortDescription;

	@Column(name = "long_description")
	private String longDescription;

	@Column(name = "image_url")
	private String imageUrl;
	
	@ManyToMany(cascade = { CascadeType.PERSIST, CascadeType.REMOVE })
	@JoinTable(name = "point_of_interest_has_activity", 
	joinColumns = { @JoinColumn(name = "activity_id") }, 
	inverseJoinColumns = { @JoinColumn(name = "point_of_interest_id") })
	private List<PointOfInterest> points;

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

	public String getImageUrl() {
		return imageUrl;
	}

	public void setImageUrl(String imageUrl) {
		this.imageUrl = imageUrl;
	}

//	Constructors

	public Activity() {
	}

	public Activity(int id, String name, String shortDescription, String longDescription, String imageUrl) {
		super();
		this.id = id;
		this.name = name;
		this.shortDescription = shortDescription;
		this.longDescription = longDescription;
		this.imageUrl = imageUrl;
	}

//	To String

	@Override
	public String toString() {
		StringBuilder builder = new StringBuilder();
		builder.append("Activity [id=").append(id).append(", name=").append(name).append(", shortDescription=")
				.append(shortDescription).append("]");
		return builder.toString();
	}

	public void addPoint(PointOfInterest pointOfInterest) {
		if (points == null)
			points = new ArrayList<>();
		if (!points.contains(pointOfInterest)) {
			points.add(pointOfInterest);
			pointOfInterest.addActivity(this);
			;
		}
	}

	public void removePoint(PointOfInterest pointOfInterest) {
		if (points != null && points.contains(pointOfInterest)) {
			points.remove(pointOfInterest);
			pointOfInterest.removeActivity(this);
		}
	}

}
