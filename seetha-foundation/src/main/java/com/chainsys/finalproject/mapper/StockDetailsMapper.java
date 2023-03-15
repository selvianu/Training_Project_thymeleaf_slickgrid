package com.chainsys.finalproject.mapper;

import java.sql.ResultSet;
import java.sql.SQLException;

import org.springframework.jdbc.core.RowMapper;

import com.chainsys.finalproject.ngo.StockDetails;

public class StockDetailsMapper implements RowMapper<StockDetails>{

	@Override
	public StockDetails mapRow(ResultSet rs, int rowNum) throws SQLException {
		StockDetails stock=new StockDetails();
		stock.setStockId(rs.getString(1));
		stock.setStockName(rs.getString(2));
		stock.setQuantity(rs.getInt(3));
		stock.setStaffId(rs.getString(4));
		stock.setWareHouseId(rs.getString(5));
		return stock;
	}

}
