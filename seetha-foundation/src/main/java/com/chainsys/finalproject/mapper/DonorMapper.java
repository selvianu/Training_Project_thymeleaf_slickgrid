package com.chainsys.finalproject.mapper;

import java.sql.ResultSet;
import java.sql.SQLException;

import org.springframework.jdbc.core.RowMapper;

import com.chainsys.finalproject.ngo.Donor;

public class DonorMapper implements RowMapper<Donor> {

	@Override
	public Donor mapRow(ResultSet rs, int rowNum) throws SQLException {
		Donor donor=new Donor();
		donor.setVolunteerId(rs.getString(1));
		donor.setVolunteerName(rs.getString(2));
		donor.setVolunteerPhoneNo(rs.getLong(3));
		donor.setVolunteerAadharNo(rs.getLong(4));
		donor.setVolunteerMailId(rs.getString(5));
		donor.setVolunteerAddress(rs.getString(6));
		donor.setVolunteerZoneId(rs.getString(7));
		donor.setVolunteerAccountNo(rs.getLong(8));
		return donor;
	}

}
