package com.pcw;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class MainController {

	@RequestMapping("/index")
	public String main(Model model) {
		model.addAttribute("gnb", "/include/main_gnb");
		model.addAttribute("content", "/main/index");
		model.addAttribute("footer", "/include/footer");
		return "/template/layout";
		
	}
}
