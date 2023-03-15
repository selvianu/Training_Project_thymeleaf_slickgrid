package com.chainsys.finalproject;

import static org.junit.jupiter.api.Assertions.assertEquals;
import static org.junit.jupiter.api.Assertions.assertNotEquals;

import org.junit.jupiter.api.Test;

public class LoginTestCase {

	public Boolean login(String userName, String pass, String loginType) {
		if (loginType.equals("admin")) {
			String adminUserName = "A101";
			String adminPass = "admin@123";
			if (userName.equals(adminUserName) && pass.equals(adminPass)) {
				return true;

			}
			

		}
		if (loginType.equals("management")) {
			String managerUserName = "M101";
			String managerPass = "ragu@123";
			if (userName.equals(managerUserName) && pass.equals(managerPass)) {
				return true;

			}
			

		}
		if (loginType.equals("staff")) {
			String staffUserName = "E101";
			String staffPass = "raja@123";
			if (userName.equals(staffUserName) && pass.equals(staffPass)) {
				return true;

			}

		}
		return false;
	}

	@Test
	public void loginTestCase1() {
		Boolean login = login("A101", "admin@123", "admin");
		assertEquals(true, login);
		assertNotEquals(false, login);
	}

	@Test
	public void loginTestCase2() {
		Boolean login = login("M101", "ragu@123", "management");
		assertEquals(true, login);
		assertNotEquals(false, login);
	}

	@Test
	public void loginTestCase3() {
		Boolean login = login("E101", "raja@123", "staff");
		assertEquals(true, login);
		assertNotEquals(false, login);
	}

}
