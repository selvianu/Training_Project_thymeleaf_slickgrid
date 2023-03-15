package com.chainsys.finalproject.mapper;

import java.sql.ResultSet;
import java.sql.SQLException;

import org.springframework.jdbc.core.RowMapper;

import com.chainsys.finalproject.ngo.Transaction;

public class TransactionMapper implements RowMapper<Transaction>{

	@Override
	public Transaction mapRow(ResultSet rs, int rowNum) throws SQLException {
		Transaction transaction=new Transaction();
		transaction.setTransactionNo(rs.getInt(1));
		transaction.setTransactionDate(rs.getDate(2));
		transaction.setAccountNo(rs.getLong(3));
		transaction.setTransactionType(rs.getString(4));
		transaction.setAmount(rs.getFloat(5));
		transaction.setDescription(rs.getString(6));
		return transaction;
	}

}
