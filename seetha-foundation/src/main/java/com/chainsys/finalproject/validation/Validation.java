package com.chainsys.finalproject.validation;

import java.util.regex.Matcher;
import java.util.regex.Pattern;

import javax.servlet.http.HttpSession;

public class Validation {

	// check name contain only character both lower and upper cases
	public Boolean nameCheck(String name, HttpSession session) {

		String regex1 = "[a-z .A-Z]+";
		Pattern p1 = Pattern.compile(regex1);
		Matcher valid1 = p1.matcher(name);
		Boolean ans1 = valid1.matches();
		if (Boolean.FALSE.equals(ans1)) {
			
			String errorMessage = "Invalid name use only alphabetic sequence in the name field!";
		
			session.setAttribute("errorMessage1", errorMessage);

			return false;
		}
		

		String regex = "^.{3,25}$";
		Pattern p = Pattern.compile(regex);
		Matcher valid = p.matcher(name);
		Boolean ans = valid.matches();
		if (Boolean.FALSE.equals(ans)) {
			
			String errorMessage = "Invalid Name, name must be in the range between 3 to 25 characters!";
			
			session.setAttribute("errorMessage2", errorMessage);

			return false;

		}
		return true;

	

	}

	// check mail id contains minimum 3 character front of '@' and after minimum 5
	// character must contain '.'
	public Boolean email(String mail, HttpSession session) {

		String regex = "^(.+)@(.+)$";
		Pattern p = Pattern.compile(regex);
		Matcher valid = p.matcher(mail);
		Boolean ans = valid.matches();
		if (Boolean.FALSE.equals(ans)) {
			
			String errorMessage = "Invalid mail id format, mail id must contain '@' and domain name \\n 'use: abcd@domain.com'";
			
			session.setAttribute("errorMessage3", errorMessage);
			return false;
		}
		return true;

	}

	// check phone number length not exceed 10 digit and also not null and continue
	// sequence digits
	public Boolean phoneNoLength(Long phoneNo, HttpSession session) {

		String num = phoneNo.toString();
		String regex = "^(0/91)?[6-9]\\d{9}$";// Initialize the format
		Pattern p = Pattern.compile(regex);
		Matcher valid = p.matcher(num);
		Boolean ans = valid.matches();
		if (Boolean.FALSE.equals(ans)) {
			
			String errorMessage = "Invalid phone number, phone number must be 10 digit or phone number must be start between 6 to 9";
			
			session.setAttribute("errorMessage4", errorMessage);
			return false;
		}

		return true;
	}

	// check password whether length between 5 to 20
	public Boolean passwordLength(String password, HttpSession session) {

		if (password.length() > 7 && password.length() < 21) {
			return true;
		} else {

			
			String errorMessage = "Attention! password lenght must be in the range between 8 to 20 character";
			
			session.setAttribute("errorMessage5", errorMessage);
			return false;
		}

	}

	// check address whether length 100 or not
	public Boolean addressLength(String address, HttpSession session) {

		if (address.length() < 100&&address.length()>4) {
			return true;
		} else {

			
			String errorMessage = "Address length must not exceed 100 character!";
			
			session.setAttribute("errorMessage6", errorMessage);
			return false;
		}

	}

	// check aadhar number length not exceed 12 digit as well as not null
	public Boolean aadharNo(Long aadharNo, HttpSession session) {

		String num = aadharNo.toString();

		String regex = "^[2-9]\\d{11}$";// Initialize the format
		Pattern p = Pattern.compile(regex);
		Matcher valid = p.matcher(num);
		Boolean ans = valid.matches();
		if (Boolean.FALSE.equals(ans)) {
			
			String errorMessage = "Invalid Aadhar Number, Aadhar Number must contain 12 digits!";
			
			session.setAttribute("errorMessage7", errorMessage);
			return false;
		}

		return true;
	}

	// check account number length = 10||13||15||17 digit as well as not null
	public Boolean accountNo(Long accountNo, HttpSession session) {

		String num = accountNo.toString();
		String regex = "^(\\d{10}|\\d{13}|\\d{15}|\\d{17})$";// Initialize the format

		Pattern p = Pattern.compile(regex);
		Matcher valid = p.matcher(num);
		Boolean ans = valid.matches();
		if (Boolean.FALSE.equals(ans)) {
			
			String errorMessage = "Invalid Account number, account number should be 10 or 13 or 15 or 17 digits depends on respective bank accroding to RBI rules ";
			
			session.setAttribute("errorMessage8", errorMessage);
			return false;
		}

		return true;
	}

}
