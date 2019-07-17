package com.skilldistillery.tripping.entities;

import java.util.List;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.OneToMany;

@Entity
public class Destination {

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private int id;
	
	private String name;
	
	@Column(name="short_description")
	private String shortDescription;

	private String description;
	
	@Column(name="image_url")
	private String image;
	
	@OneToMany(mappedBy = "destination")
	private List<PointOfInterest> points;

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

	public String getDescription() {
		return description;
	}

	public void setDescription(String description) {
		this.description = description;
	}

	public String getImage() {
		return image;
	}

	public void setImage(String image) {
		this.image = image;
	}

	public List<PointOfInterest> getPoints() {
		return points;
	}

	@Override
	public String toString() {
		return "Destination [name=" + name + ", shortDescription=" + shortDescription + ", description=" + description
				+ ", image=" + image + "]";
	}

	public void setPoints(List<PointOfInterest> points) {
		this.points = points;
	}
	
}
