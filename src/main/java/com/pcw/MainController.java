package com.pcw;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.pcw.utils.DanawProductCrawling;

@Controller
public class MainController {

	
	
	@RequestMapping(value = { "/" , "/index" })
	public String main(Model model) {		
		model.addAttribute("gnb", "/include/main_gnb");
		model.addAttribute("content", "/main/index");
		model.addAttribute("footer", "/include/footer");
		return "/template/layout";
		
	}
	
	
	
}



