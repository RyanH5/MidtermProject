package com.skilldistillery.tripping.entities;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name="journal_entry_image")
public class JournalEntryImage {

//	Declarations

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private int id;

	
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
		JournalEntryImage other = (JournalEntryImage) obj;
		if (id != other.id)
			return false;
		return true;
	}

	@Column(name = "journal_id")
	private int journalId;

	
	@Column(name="image_url")
	private String imageURL;
	
	
//	Getters and Setters


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
