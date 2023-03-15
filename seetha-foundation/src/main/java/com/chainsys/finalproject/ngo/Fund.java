package com.chainsys.finalproject.ngo;

import java.sql.Date;

import org.springframework.stereotype.Repository;

public class Fund {
	private String fundId;
	private Float fundAmount;
	private Long accountNo;
	private Date donateDate;

	public Fund() {

	}

	// constructor
	public Fund(String fundId, Float fundAmount, Long accountNo, Date donateDate) {
		super();
		this.fundId = fundId;
		this.fundAmount = fundAmount;
		this.accountNo = accountNo;
		this.donateDate = donateDate;
	}

	// getter setter
	public String getFundId() {
		return fundId;
	}

	public void setFundId(String fundId) {
		this.fundId = fundId;
	}

	public Float getFundAmount() {
		return fundAmount;
	}

	public void setFundAmount(Float fundAmount) {
		this.fundAmount = fundAmount;
	}

	public Long getAccountNo() {
		return accountNo;
	}

	public void setAccountNo(Long accountNo) {
		this.accountNo = accountNo;
	}

	public Date getDonateDate() {
		return donateDate;
	}

	public void setDonateDate(Date donateDate) {
		this.donateDate = donateDate;
	}

	// toString
	@Override
	public String toString() {
		return "Fund [fundId=" + fundId + ", fundAmount=" + fundAmount + ", accountNo=" + accountNo + ", donateDate="
				+ donateDate + "]";
	}

}
