package com.skilldistillery.tripping.entities;

import java.util.ArrayList;
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
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;

import org.hibernate.annotations.CreationTimestamp;

@Entity
@Table(name="journal_entry")
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
	private Destination destination;

	@ManyToOne
	@JoinColumn(name = "event_id")
	private Event event;

	@ManyToOne
	@JoinColumn(name = "activitity_id")
	private Activity activity;

	@OneToMany(mappedBy = "journalId")
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

	public Destination getDestination() {
		return destination;
	}

	public void setDestination(Destination destination) {
		this.destination = destination;
	}

	public Event getEvent() {
		return event;
	}

	public void setEvent(Event event) {
		this.event = event;
	}

	public Activity getActivity() {
		return activity;
	}

	public void setActivity(Activity activity) {
		this.activity = activity;
	}

	public List<JournalEntryImage> getImages() {
		return images;
	}

	public void setImages(List<JournalEntryImage> images) {
		this.images = images;
	}
	
	public void addJournalImage(JournalEntryImage journalImage) {
		if (images == null)
			images = new ArrayList<>();
		if (!images.contains(journalImage)) {
			images.add(journalImage);
		}
	}

	public void removeJournalEntry(JournalEntryImage journalImage) {
		if (images != null && images.contains(journalImage)) {
			images.remove(journalImage);
		}
	}

	// Constructors

	public JournalEntry() {
	}

	public JournalEntry(User user, boolean isPublic, boolean isComplete, String title, String entryText,
			Date createDate, Destination destination, Event event, Activity activity, List<JournalEntryImage> images) {
		this.user = user;
		this.isPublic = isPublic;
		this.isComplete = isComplete;
		this.title = title;
		this.entryText = entryText;
		this.createDate = createDate;
		this.destination = destination;
		this.event = event;
		this.activity = activity;
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
