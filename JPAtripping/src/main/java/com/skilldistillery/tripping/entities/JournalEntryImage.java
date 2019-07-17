package com.skilldistillery.tripping.entities;

import java.util.List;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;

@Entity
public class JournalEntryImage {

//	Declarations

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private int id;

	@Column(name = "journal_id")
	private int journalId;

	@Column(name = "image_url")
	private String imageURL;

//	Getters and setters

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public int getJournalId() {
		return journalId;
	}

	public void setJournalId(int journalId) {
		this.journalId = journalId;
	}

	public String getImageURL() {
		return imageURL;
	}

	public void setImageURL(String imageURL) {
		this.imageURL = imageURL;
	}

//	Constructors

	public JournalEntryImage() {
	}

	public JournalEntryImage(int journalId, String imageURL) {
		this.journalId = journalId;
		this.imageURL = imageURL;
	}

//	To String 

	@Override
	public String toString() {
		StringBuilder builder = new StringBuilder();
		builder.append("JournalEntryImage [id=").append(id).append(", imageURL=").append(imageURL).append("]");
		return builder.toString();
	}

}
