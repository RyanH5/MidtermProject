package com.skilldistillery.tripping.entities;

import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;

import org.hibernate.annotations.CreationTimestamp;

@Entity
public class JournalEntry {

//	Declarations

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private int id;

	@ManyToOne
	@JoinColumn(name="user_id")
	private int userId;

	@Column(name = "is_public")
	private boolean isPublic;

	@Column(name = "is_complete")
	private boolean isComplete;

	@Column(name = "title")
	private String title;

	@Column(name = "entry_text")
	private String entryText;

	@Column(name = "create_date")
	@Temporal(TemporalType.TIMESTAMP)
	@CreationTimestamp
	private Date createDate;

	@Column(name = "destination_id")
	private int destinationId;

	@Column(name = "event_id")
	private int eventId;

	@Column(name = "activity_id")
	private int activityId;

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

	public boolean isPublic() {
		return isPublic;
	}

	public void setPublic(boolean isPublic) {
		this.isPublic = isPublic;
	}

	public boolean isComplete() {
		return isComplete;
	}

	public void setComplete(boolean isComplete) {
		this.isComplete = isComplete;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getEntryText() {
		return entryText;
	}

	public void setEntryText(String entryText) {
		this.entryText = entryText;
	}

	public Date getCreateDate() {
		return createDate;
	}

	public void setCreateDate(Date createDate) {
		this.createDate = createDate;
	}

	public int getDestinationId() {
		return destinationId;
	}

	public void setDestinationId(int destinationId) {
		this.destinationId = destinationId;
	}

	public int getEventId() {
		return eventId;
	}

	public void setEventId(int eventId) {
		this.eventId = eventId;
	}

	public int getActivityId() {
		return activityId;
	}

	public void setActivityId(int activityId) {
		this.activityId = activityId;
	}

//	Constructors

	public JournalEntry() {
	}

	public JournalEntry(int id, int userId, boolean isPublic, boolean isComplete, String title, String entryText,
			Date createDate) {
		super();
		this.id = id;
		this.userId = userId;
		this.isPublic = isPublic;
		this.isComplete = isComplete;
		this.title = title;
		this.entryText = entryText;
		this.createDate = createDate;
	}

	public JournalEntry(int id, int userId, boolean isPublic, boolean isComplete, String title, String entryText,
			Date createDate, int destinationId, int eventId, int activityId) {
		super();
		this.id = id;
		this.userId = userId;
		this.isPublic = isPublic;
		this.isComplete = isComplete;
		this.title = title;
		this.entryText = entryText;
		this.createDate = createDate;
		this.destinationId = destinationId;
		this.eventId = eventId;
		this.activityId = activityId;
	}

//	To String

	@Override
	public String toString() {
		StringBuilder builder = new StringBuilder();
		builder.append("JournalEntry [id=").append(id).append(", title=").append(title).append("]");
		return builder.toString();
	}

}
