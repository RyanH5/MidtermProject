package com.skilldistillery.tripping.entities;

import javax.persistence.Column;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;

public class JournalEntry {
	
//	Declarations

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private int id;

	@Column(name = "user_id")
	private int userId;
	
	@Column(name = "title")
	private String title;
	
	@Column(name = "image_path")
	private String imagePath;
	
	@Column(name = "is_public")
	private boolean isPublic;
	
	@Column(name = "note")
	private int note;
	
	@Column(name = "is_complete")
	private boolean isComplete;
	
//	Getters and setters

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public int getUserId() {
		return userId;
	}

	public void setUserId(int userId) {
		this.userId = userId;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getImagePath() {
		return imagePath;
	}

	public void setImagePath(String imagePath) {
		this.imagePath = imagePath;
	}

	public boolean isPublic() {
		return isPublic;
	}

	public void setPublic(boolean isPublic) {
		this.isPublic = isPublic;
	}

	public int getNote() {
		return note;
	}

	public void setNote(int note) {
		this.note = note;
	}

	public boolean isComplete() {
		return isComplete;
	}

	public void setComplete(boolean isComplete) {
		this.isComplete = isComplete;
	}

//	Constructors
	
	public JournalEntry() {
	}

	public JournalEntry(int id, int userId, String title, String imagePath, boolean isPublic, int note,
			boolean isComplete) {
		super();
		this.id = id;
		this.userId = userId;
		this.title = title;
		this.imagePath = imagePath;
		this.isPublic = isPublic;
		this.note = note;
		this.isComplete = isComplete;
	}

//	To String
	
	@Override
	public String toString() {
		return "JournalEntry [id=" + id + ", title=" + title + "]";
	}
	

}
