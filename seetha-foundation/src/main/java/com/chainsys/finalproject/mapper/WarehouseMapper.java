package com.chainsys.finalproject.mapper;

import java.sql.ResultSet;
import java.sql.SQLException;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.RowMapper;

import com.chainsys.finalproject.ngo.Warehouse;

public class WarehouseMapper implements RowMapper<Warehouse>{

	
	@Override
	public Warehouse mapRow(ResultSet rs, int rowNum) throws SQLException {
		Warehouse warehouse =new Warehouse();
		warehouse.setZoneId(rs.getString(1));
		warehouse.setLocation(rs.getString(2));
		warehouse.setWarehouseId(rs.getString(3));
		
		return warehouse;
	}

}
