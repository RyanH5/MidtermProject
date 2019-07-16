package com.skilldistillery.tripping.entities;

import java.util.List;

import javax.persistence.Column;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;

public class JournalEntryImage {
	
//	Declarations

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private int id;

	@Column(name = "entry_id")
	private int entryId;

	@Column(name = "image_url")
	private List<String> imageURL;
	
//	Getters and setters

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public int getEntryId() {
		return entryId;
	}

	public void setEntryId(int entryId) {
		this.entryId = entryId;
	}

	public List<String> getImageURL() {
		return imageURL;
	}

	public void setImageURL(List<String> imageURL) {
		this.imageURL = imageURL;
	}

//	Contructors
	
	public JournalEntryImage() {
	}

	public JournalEntryImage(int id, int entryId, List<String> imageURL) {
		super();
		this.id = id;
		this.entryId = entryId;
		this.imageURL = imageURL;
	}

//	To String 
	@Override
	public String toString() {
		return "JournalEntryImages [id=" + id + ", imageURL=" + imageURL + "]";
	}
	
}
