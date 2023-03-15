package com.chainsys.finalproject.mapper;

import java.sql.Date;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;

import org.springframework.jdbc.core.RowMapper;

import com.chainsys.finalproject.ngo.Fund;

public class FundMapper implements RowMapper<Fund> {

	@Override
	public Fund mapRow(ResultSet rs, int rowNum) throws SQLException {
		Fund fund = new Fund();
		fund.setFundId(rs.getString(1));
		fund.setFundAmount(rs.getFloat(2));
		fund.setAccountNo(rs.getLong(3));
		fund.setDonateDate(rs.getDate(4));

		return fund;
	}

}
