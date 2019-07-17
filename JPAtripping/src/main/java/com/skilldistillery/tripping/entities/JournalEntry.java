package com.skilldistillery.tripping.entities;

import java.util.Date;
import java.util.List;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
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
	@JoinColumn(name = "user_id")
	private User user;

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

	@ManyToOne
	@JoinColumn(name = "destination_id")
	private int destinationId;

	@ManyToOne
	@JoinColumn(name = "event_id")
	private int eventId;

	@ManyToOne
	@JoinColumn(name = "activity_id")
	private int activityId;

	@OneToMany(mappedBy = "journal_id")
	private List<JournalEntryImage> images;

//	Getters and setters	
	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public User getUser() {
		return user;
	}

	public void setUser(User user) {
		this.user = user;
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

	public List<JournalEntryImage> getImages() {
		return images;
	}

	public void setImages(List<JournalEntryImage> images) {
		this.images = images;
	}

	//	Constructors

	public JournalEntry() {
	}

	public JournalEntry(User user, boolean isPublic, boolean isComplete, String title, String entryText,
			Date createDate, int destinationId, int eventId, int activityId, List<JournalEntryImage> images) {
		super();
		this.user = user;
		this.isPublic = isPublic;
		this.isComplete = isComplete;
		this.title = title;
		this.entryText = entryText;
		this.createDate = createDate;
		this.destinationId = destinationId;
		this.eventId = eventId;
		this.activityId = activityId;
		this.images = images;
	}

//	To String

	@Override
	public String toString() {
		StringBuilder builder = new StringBuilder();
		builder.append("JournalEntry [id=").append(id).append(", title=").append(title).append("]");
		return builder.toString();
	}

}
