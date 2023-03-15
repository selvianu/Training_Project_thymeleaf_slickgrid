package com.chainsys.finalproject.mapper;

import java.sql.ResultSet;
import java.sql.SQLException;

import org.springframework.jdbc.core.RowMapper;

import com.chainsys.finalproject.ngo.DonationStatus;

public class DonationYearMapper implements RowMapper<DonationStatus>{

	@Override
	public DonationStatus mapRow(ResultSet rs, int rowNum) throws SQLException {
		DonationStatus status=new DonationStatus();
		status.setDescription(rs.getString(1));	//set donation year only to description because of using extract key
		status.setZoneId(rs.getString(2));
		return status;
	}

}
