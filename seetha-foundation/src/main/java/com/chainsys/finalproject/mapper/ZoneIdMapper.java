package com.chainsys.finalproject.mapper;

import java.sql.ResultSet;
import java.sql.SQLException;

import org.springframework.jdbc.core.RowMapper;


import com.chainsys.finalproject.ngo.ZoneId;

public class ZoneIdMapper implements RowMapper<ZoneId>{

	@Override
	public ZoneId mapRow(ResultSet rs, int rowNum) throws SQLException {

		ZoneId zoneId=new ZoneId();
		zoneId.setLocationId(rs.getString(1)); 
		return zoneId;
	}
	

}
