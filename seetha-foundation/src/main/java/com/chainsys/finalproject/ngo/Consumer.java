package com.chainsys.finalproject.ngo;

import org.springframework.stereotype.Repository;

public class Consumer {
	private String consumerId;
	private String consumerName;
	private Long consumerPhoneNo;
	private Long consumerAadharNo;
	private String consumerAddress;
	private String consumerZoneId;
	private Long consumerAccountNo;

	//constructor
	public Consumer() {
		
	}

	public Consumer(String consumerId, String consumerName, Long consumerPhoneNo, Long consumerAadharNo) {
		super();
		this.consumerId = consumerId;
		this.consumerName = consumerName;
		this.consumerPhoneNo = consumerPhoneNo;
		this.consumerAadharNo = consumerAadharNo;
	}

	public Consumer(String consumerAddress, String consumerZoneId, Long consumerAccountNo) {
		super();
		this.consumerAddress = consumerAddress;
		this.consumerZoneId = consumerZoneId;
		this.consumerAccountNo = consumerAccountNo;
	}

	//getter setter
	public String getConsumerId() {
		return consumerId;
	}

	public void setConsumerId(String consumerId) {
		this.consumerId = consumerId;
	}

	public String getConsumerName() {
		return consumerName;
	}

	public void setConsumerName(String consumerName) {
		this.consumerName = consumerName;
	}

	public Long getConsumerPhoneNo() {
		return consumerPhoneNo;
	}

	public void setConsumerPhoneNo(Long consumerPhoneNo) {
		this.consumerPhoneNo = consumerPhoneNo;
	}

	public Long getConsumerAadharNo() {
		return consumerAadharNo;
	}

	public void setConsumerAadharNo(Long consumerAadharNo) {
		this.consumerAadharNo = consumerAadharNo;
	}

	public String getConsumerAddress() {
		return consumerAddress;
	}

	public void setConsumerAddress(String consumerAddress) {
		this.consumerAddress = consumerAddress;
	}

	public String getConsumerZoneId() {
		return consumerZoneId;
	}

	public void setConsumerZoneId(String consumerZoneId) {
		this.consumerZoneId = consumerZoneId;
	}

	public Long getConsumerAccountNo() {
		return consumerAccountNo;
	}

	public void setConsumerAccountNo(Long consumerAccountNo) {
		this.consumerAccountNo = consumerAccountNo;
	}

	//toString
	@Override
	public String toString() {
		return "Consumer [consumerId=" + consumerId + ", consumerName=" + consumerName + ", consumerPhoneNo="
				+ consumerPhoneNo + ", consumerAadharNo=" + consumerAadharNo + ", consumerAddress=" + consumerAddress
				+ ", consumerZoneId=" + consumerZoneId + ", consumerAccountNo=" + consumerAccountNo + "]";
	}

	
	
	
	

}
