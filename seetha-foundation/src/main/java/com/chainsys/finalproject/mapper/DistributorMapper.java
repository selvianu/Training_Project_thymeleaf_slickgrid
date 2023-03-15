package com.chainsys.finalproject.mapper;

import java.sql.ResultSet;
import java.sql.SQLException;

import org.springframework.jdbc.core.RowMapper;

import com.chainsys.finalproject.ngo.Distributor;


public class DistributorMapper implements RowMapper<Distributor> {

	@Override
	public Distributor mapRow(ResultSet rs, int rowNum) throws SQLException {
		Distributor distributor=new Distributor();
		distributor.setDistributorId(rs.getString(1));
		distributor.setDistributorName(rs.getString(2));
		distributor.setPhoneNo(rs.getLong(3));
		distributor.setAadharNo(rs.getLong(4));
		distributor.setMailId(rs.getString(5));
		distributor.setAddress(rs.getString(6));
		distributor.setZoneId(rs.getString(7));
		distributor.setAccountNo(rs.getLong(8));
		return distributor;
	}

}
