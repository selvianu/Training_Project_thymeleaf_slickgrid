package com.chainsys.finalproject.mapper;

import java.sql.ResultSet;
import java.sql.SQLException;

import org.springframework.jdbc.core.RowMapper;

import com.chainsys.finalproject.ngo.DonationHistory;

public class DonationHistoryMapper implements RowMapper<DonationHistory>{

	@Override
	public DonationHistory mapRow(ResultSet rs, int rowNum) throws SQLException {
		DonationHistory history=new DonationHistory();
		history.setHistoryId(rs.getString(1));
		history.setZoneId(rs.getString(2));
		history.setDonationYear(rs.getString(3));
		history.setNoOfCivilians(rs.getInt(4));
		history.setDonationCause(rs.getString(5));
		history.setDonationExpenses(rs.getFloat(6));
		return history;
	}

}
