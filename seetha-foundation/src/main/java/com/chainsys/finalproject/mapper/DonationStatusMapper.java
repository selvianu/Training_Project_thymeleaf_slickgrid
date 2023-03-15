package com.chainsys.finalproject.mapper;

import java.sql.Date;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.time.LocalDate;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.Calendar;
import java.util.GregorianCalendar;
import java.util.Locale;

import org.springframework.jdbc.core.RowMapper;

import com.chainsys.finalproject.ngo.DonationStatus;

public class DonationStatusMapper implements RowMapper<DonationStatus> {

	@Override
	public DonationStatus mapRow(ResultSet rs, int rowNum) throws SQLException {
		DonationStatus status = new DonationStatus();
		status.setDonationId(rs.getString(1));
		status.setStaffId(rs.getString(2));
		status.setConsumerId(rs.getString(3));
		status.setStockId(rs.getString(4));
		status.setQuantity(rs.getInt(5));
		status.setFundAmount(rs.getFloat(6));
		status.setDescription(rs.getString(7));

		status.setDonationDate(rs.getDate(8));

		String approvedBy = rs.getString(9);

		if (approvedBy == null) {
			String approve = "-";
			status.setApprovedBy(approve);
		} else {

			status.setApprovedBy(approvedBy);
		}
		status.setApprovalStatus(rs.getString(10));
		status.setZoneId(rs.getString(11));

		return status;
	}

}
