package com.claim.entity;

public class Event {

	private String eventName;
	private String eventDate;
	private String eventLocation;
	private String eventPicPath;

	public Event() {}
	
	public Event(String eventName, String eventDate, String eventLocation, String eventPicPath) {
		this.eventName = eventName;
		this.eventDate = eventDate;
		this.eventLocation = eventLocation;
		this.eventPicPath = eventPicPath;
	}

	public String getEventName() {
		return eventName;
	}
	
	public void setEventName(String eventName) {
		this.eventName = eventName;
	}
	
	public String getEventDate() {
		return eventDate;
	}
	
	public void setEventDate(String eventDate) {
		this.eventDate = eventDate;
	}
	
	public String getEventLocation() {
		return eventLocation;
	}
	
	public void setEventLocation(String eventLocation) {
		this.eventLocation = eventLocation;
	}

	public String getEventPicPath() {
		return eventPicPath;
	}

	public void setEventPicPath(String eventPicPath) {
		this.eventPicPath = eventPicPath;
	}
	
}
