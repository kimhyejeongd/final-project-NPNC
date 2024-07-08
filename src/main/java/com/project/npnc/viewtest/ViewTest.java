package com.project.npnc.viewtest;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class ViewTest {
	
	@RequestMapping("/icon-menu")
	public String test1() {
		return "icon-menu";
	}
	
	@RequestMapping("/sidebar-style-2")
	public String test2() {
		return "sidebar-style-2";
	}




	@RequestMapping("/starter-template")
	public String test31() {
		return "starter-template";
	}


	@RequestMapping("/widgets")
	public String test4() {
		return "widgets";
	}

	
	@RequestMapping("/jsvectormap")
	public String test5() {
		return "maps/jsvectormap";
	}
	
	
	@RequestMapping("/buttons")
	public String test6() {
		return "components/buttons";
	}
	
}
