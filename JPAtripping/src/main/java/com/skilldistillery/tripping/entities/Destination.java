package com.skilldistillery.tripping.entities;

import java.util.*;

import javax.persistence.*;

@Entity
public class Destination {

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private int id;
	private String name;	
	private String description;

	@Column(name="short_description")
	private String shortDescription;

	
	@Column(name="image_url")
	private String image;
	
	
	
	@ManyToMany(cascade= {CascadeType.PERSIST, CascadeType.REMOVE})
	@JoinTable(name="user_destination_review",
	joinColumns=@JoinColumn(name="destination_id"),
	inverseJoinColumns=@JoinColumn(name="user_id"))
	private List<DestinationReview> destinationReviews;
	
	
	
	
	
	public Destination() {
		super();
	}

	public Destination(String name, String shortDescription, String description, String image,
			List<DestinationReview> destinationUserReviews, List<User> users) {
		super();
		this.name = name;
		this.shortDescription = shortDescription;
		this.description = description;
		this.image = image;
		this.destinationReviews = destinationUserReviews;
	}

	
}
