package com.chainsys.finalproject.mapper;

import java.sql.ResultSet;
import java.sql.SQLException;

import org.springframework.jdbc.core.RowMapper;

import com.chainsys.finalproject.ngo.Manager;

public class CheckExitingMailIdMapper implements RowMapper<Manager> {

	@Override
	public Manager mapRow(ResultSet rs, int rowNum) throws SQLException {
		Manager manager=new Manager();
		manager.setManagerMailId(rs.getString(1));
		return manager;
	}

}
