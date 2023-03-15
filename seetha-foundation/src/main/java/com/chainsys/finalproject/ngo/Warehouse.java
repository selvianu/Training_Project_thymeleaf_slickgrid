package com.chainsys.finalproject.ngo;

import org.springframework.stereotype.Repository;

public class Warehouse {

	private String warehouseId;
	private String location;
	private String zoneId;

	public Warehouse() {

	}

	// constructor
	public Warehouse(String warehouseId, String location, String zoneId) {
		super();
		this.warehouseId = warehouseId;
		this.location = location;
		this.zoneId = zoneId;
	}

	// getter setter
	public String getWarehouseId() {
		return warehouseId;
	}

	public void setWarehouseId(String warehouseId) {
		this.warehouseId = warehouseId;
	}

	public String getLocation() {
		return location;
	}

	public void setLocation(String location) {
		this.location = location;
	}

	public String getZoneId() {
		return zoneId;
	}

	public void setZoneId(String zoneId) {
		this.zoneId = zoneId;
	}

	// toString
	@Override
	public String toString() {
		return "Warehouse [warehouseId=" + warehouseId + ", location=" + location + ", zoneId=" + zoneId + "]";
	}

}
