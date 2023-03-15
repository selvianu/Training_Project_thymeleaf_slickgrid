package com.chainsys.finalproject.mapper;

import java.sql.ResultSet;
import java.sql.SQLException;

import org.springframework.jdbc.core.RowMapper;

import com.chainsys.finalproject.ngo.DonationStatus;

public class DonationInfoByDonationId implements RowMapper<DonationStatus>{

	@Override
	public DonationStatus mapRow(ResultSet rs, int rowNum) throws SQLException {
		DonationStatus donation=new  DonationStatus();
		donation.setStockId(rs.getString(1));
		donation.setQuantity(rs.getInt(2));
		donation.setFundAmount(rs.getFloat(3));
		donation.setDescription(rs.getString(4));
		donation.setZoneId(rs.getString(5));
		return donation;
	}

}
