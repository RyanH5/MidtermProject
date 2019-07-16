package com.skilldistillery.tripping.entities;

import java.util.*;

import javax.persistence.*;

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
	
	@ManyToMany(cascade= {CascadeType.PERSIST, CascadeType.REMOVE})
	@JoinTable(name="activitiy_has_destination",
	joinColumns=@JoinColumn(name="destination_id"),
	inverseJoinColumns=@JoinColumn(name="activity_id"))	
	private List<Activity> activities;
	
	@ManyToMany(cascade= {CascadeType.PERSIST, CascadeType.REMOVE})
	@JoinTable(name="user_destination_review",
	joinColumns=@JoinColumn(name="destination_id"),
	inverseJoinColumns=@JoinColumn(name="user_id"))
	private List<User> users;
	
	
	
	public Destination() {
		super();
	}

	public Destination(String name, String shortDescription, String description, String image,
			List<Activity> activities, List<User> users) {
		super();
//		this.id = id;
		this.name = name;
		this.shortDescription = shortDescription;
		this.description = description;
		this.image = image;
		this.activities = activities;
		this.users = users;
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

	public List<Activity> getActivities() {
		return activities;
	}

	public void setActivities(List<Activity> activities) {
		this.activities = activities;
	}

	public List<User> getUsers() {
		return users;
	}

	public void setUsers(List<User> users) {
		this.users = users;
	}
}
