package com.chainsys.finalproject.ngo;

import java.sql.Date;

import org.springframework.stereotype.Repository;

public class Transaction {
	private Integer transactionNo;
	private Date transactionDate;
	private Long accountNo;
	private String transactionType;
	private Float amount;
	private String description;

	// constructor
	public Transaction() {

	}

	public Transaction(Integer transactionNo, Date transactionDate, Long accountNo, String transactionType,
			Float amount, String description) {
		super();
		this.transactionNo = transactionNo;
		this.transactionDate = transactionDate;
		this.accountNo = accountNo;
		this.transactionType = transactionType;
		this.amount = amount;
		this.description = description;
	}

	// getter setter
	public Integer getTransactionNo() {
		return transactionNo;
	}

	public void setTransactionNo(Integer transactionNo) {
		this.transactionNo = transactionNo;
	}

	public Date getTransactionDate() {
		return transactionDate;
	}

	public void setTransactionDate(Date transactionDate) {
		this.transactionDate = transactionDate;
	}

	public Long getAccountNo() {
		return accountNo;
	}

	public void setAccountNo(Long accountNo) {
		this.accountNo = accountNo;
	}

	public String getTransactionType() {
		return transactionType;
	}

	public void setTransactionType(String transactionType) {
		this.transactionType = transactionType;
	}

	public Float getAmount() {
		return amount;
	}

	public void setAmount(Float amount) {
		this.amount = amount;
	}

	public String getDescription() {
		return description;
	}

	public void setDescription(String description) {
		this.description = description;
	}

	// toString
	@Override
	public String toString() {
		return "Transaction [transactionNo=" + transactionNo + ", transactionDate=" + transactionDate + ", accountNo="
				+ accountNo + ", transactionType=" + transactionType + ", amount=" + amount + ", description="
				+ description + "]";
	}

}
