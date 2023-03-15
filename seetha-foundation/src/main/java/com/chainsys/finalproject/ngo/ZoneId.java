package com.chainsys.finalproject.ngo;

import org.springframework.stereotype.Repository;

public class ZoneId {

	private String locationId;

	public ZoneId() {

	}

	// constructor
	public ZoneId(String locationId) {
		super();
		this.locationId = locationId;
	}

	// getter setter
	public String getLocationId() {
		return locationId;
	}

	public void setLocationId(String locationId) {
		this.locationId = locationId;
	}

	// toString
	@Override
	public String toString() {
		return "ZoneId [locationId=" + locationId + "]";
	}

}
