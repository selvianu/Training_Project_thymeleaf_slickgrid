package com.chainsys.finalproject.ngo;

import org.springframework.stereotype.Repository;

public class Password {

	private String pass;
	private String name;

	public Password() {

	}

//constructor
	public Password(String pass, String name) {
		super();
		this.pass = pass;
		this.name = name;
	}

	// getter setter
	public String getPass() {
		return pass;
	}

	public void setPass(String pass) {
		this.pass = pass;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	// tostring
	@Override
	public String toString() {
		return "Password [pass=" + pass + ", name=" + name + "]";
	}

}
