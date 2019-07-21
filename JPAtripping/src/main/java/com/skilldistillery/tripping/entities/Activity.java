package com.skilldistillery.tripping.entities;

import java.util.ArrayList;
import java.util.List;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.ManyToMany;
import javax.persistence.Table;

@Entity
@Table(name = "activity")
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
	
	@Column(name = "icon_url")
	private String iconUrl;

	@ManyToMany(mappedBy = "activities")
	private List<PointOfInterest> points;

	public List<PointOfInterest> getPoints() {
		return points;
	}
	
//	Hash Code


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
		Activity other = (Activity) obj;
		if (id != other.id)
			return false;
		return true;
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

	public Activity(String name, String shortDescription) {
		super();
		this.name = name;
		this.shortDescription = shortDescription;
	}

public Activity(String name, String shortDescription, String longDescription, String imageUrl) {
		super();
		this.name = name;
		this.shortDescription = shortDescription;
		this.longDescription = longDescription;
		this.imageUrl = imageUrl;
	}

//	To String

	@Override
	public String toString() {
		StringBuilder builder = new StringBuilder();
		builder.append("Activity [name=");
		builder.append(name);
		builder.append(", shortDescription=");
		builder.append(shortDescription);
		builder.append("]");
		return builder.toString();
	}

// Add and Remove Methods 
	
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

	public String getIconUrl() {
		return iconUrl;
	}

	public void setIconUrl(String iconUrl) {
		this.iconUrl = iconUrl;
	}

}
