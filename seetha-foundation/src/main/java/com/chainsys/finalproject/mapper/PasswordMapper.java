package com.chainsys.finalproject.mapper;

import java.sql.ResultSet;
import java.sql.SQLException;

import org.springframework.jdbc.core.RowMapper;

import com.chainsys.finalproject.ngo.Password;

public class PasswordMapper implements RowMapper<Password> {

	@Override
	public Password mapRow(ResultSet rs, int rowNum) throws SQLException {
		Password password=new Password();
		password.setPass(rs.getString(1));
		password.setName(rs.getString(2));
		return password;
	}

}
