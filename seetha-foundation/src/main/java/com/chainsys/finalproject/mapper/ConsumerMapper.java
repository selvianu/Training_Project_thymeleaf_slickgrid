package com.chainsys.finalproject.mapper;

import java.sql.ResultSet;
import java.sql.SQLException;

import org.springframework.jdbc.core.RowMapper;

import com.chainsys.finalproject.ngo.Consumer;

public class ConsumerMapper implements RowMapper<Consumer>{

	@Override
	public Consumer mapRow(ResultSet rs, int rowNum) throws SQLException {
		Consumer consumer=new Consumer();
		consumer.setConsumerId(rs.getString(1));
		consumer.setConsumerName(rs.getString(2));
		consumer.setConsumerPhoneNo(rs.getLong(3));
		consumer.setConsumerAadharNo(rs.getLong(4));
		consumer.setConsumerAddress(rs.getString(5));
		consumer.setConsumerZoneId(rs.getString(6));
		consumer.setConsumerAccountNo(rs.getLong(7));
		return consumer;
	}

}
