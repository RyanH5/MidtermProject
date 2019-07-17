package com.skilldistillery.tripping.entities;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;

@Entity
public class Contacts {
	
//	Declarations

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private int id;

	@Column(name = "destination_id")
	private int destId;
	
	@Column(name = "contact_name")
	private String contactName;
	
	@Column(name = "type_of_service")
	private int typeOfService;
	
//	Getters and Setters

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public int getDestId() {
		return destId;
	}

	public void setDestId(int destId) {
		this.destId = destId;
	}

	public String getContactName() {
		return contactName;
	}

	public void setContactName(String contactName) {
		this.contactName = contactName;
	}

	public int getTypeOfService() {
		return typeOfService;
	}

	public void setTypeOfService(int typeOfService) {
		this.typeOfService = typeOfService;
	}
	
//	Constructors

	public Contacts() {
	}

	public Contacts(int id, int destId, String contactName, int typeOfService) {
		super();
		this.id = id;
		this.destId = destId;
		this.contactName = contactName;
		this.typeOfService = typeOfService;
	}

//	To String

	@Override
	public String toString() {
		return "Contacts [id=" + id + ", contactName=" + contactName + ", typeOfService=" + typeOfService + "]";
	}
	
}
