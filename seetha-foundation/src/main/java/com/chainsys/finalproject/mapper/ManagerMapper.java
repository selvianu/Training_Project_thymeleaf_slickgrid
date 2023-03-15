package com.chainsys.finalproject.mapper;

import java.sql.ResultSet;
import java.sql.SQLException;

import org.springframework.jdbc.core.RowMapper;


import com.chainsys.finalproject.ngo.Manager;

public class ManagerMapper implements RowMapper<Manager> {

	@Override
	public Manager mapRow(ResultSet rs, int rowNum) throws SQLException {
		Manager manager=new Manager();
		manager.setManagerId(rs.getString(1));
		manager.setManagerName(rs.getString(2));
		manager.setManagerPhoneNo(rs.getLong(3));
		manager.setManagerAadharNo(rs.getLong(4));
		manager.setManagerMailId(rs.getString(5));
		manager.setManagerAddress(rs.getString(6));
		manager.setManagerZoneId(rs.getString(7));
		manager.setManagerAccountNo(rs.getLong(8));
		return manager;
	}

}
