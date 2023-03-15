package com.chainsys.finalproject.controller;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.chainsys.finalproject.service.NgoService;
import com.fasterxml.jackson.core.JsonProcessingException;

@Controller
public class SampleController {
	
	NgoService ngoService = new NgoService();

	
	@RequestMapping("/grid")
	public String testGrid(HttpSession session, Model model) throws JsonProcessingException {
		ngoService.managerDetailsService(session, model);
		
		return "SlickGrid.html";
	}

}
