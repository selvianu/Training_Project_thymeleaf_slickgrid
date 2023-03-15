package com.chainsys.finalproject.ngo;

import org.springframework.stereotype.Repository;

public class StockDetails {
	private String stockId;
	private String stockName;
	private Integer quantity;
	private String staffId;
	private String wareHouseId;

	// constructor
	public StockDetails() {

	}

	public StockDetails(String stockId, String stockName, Integer quantity, String staffId, String wareHouseId) {
		super();
		this.stockId = stockId;
		this.stockName = stockName;
		this.quantity = quantity;
		this.staffId = staffId;
		this.wareHouseId = wareHouseId;
	}

	// setter getter

	public String getStockId() {
		return stockId;
	}

	public void setStockId(String stockId) {
		this.stockId = stockId;
	}

	public String getStockName() {
		return stockName;
	}

	public void setStockName(String stockName) {
		this.stockName = stockName;
	}

	public Integer getQuantity() {
		return quantity;
	}

	public void setQuantity(Integer quantity) {
		this.quantity = quantity;
	}

	public String getStaffId() {
		return staffId;
	}

	public void setStaffId(String staffId) {
		this.staffId = staffId;
	}

	public String getWareHouseId() {
		return wareHouseId;
	}

	public void setWareHouseId(String wareHouseId) {
		this.wareHouseId = wareHouseId;
	}

	// toString
	@Override
	public String toString() {
		return "StockDetails [stockId=" + stockId + ", stockName=" + stockName + ", quantity=" + quantity + ", staffId="
				+ staffId + ", wareHouseId=" + wareHouseId + "]";
	}

}
