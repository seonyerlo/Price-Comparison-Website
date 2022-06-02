package com.pcw.order;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.pcw.user.bo.UserBO;
import com.pcw.user.model.User;

@Controller
public class OrderController {

	@Autowired
	private UserBO userBO;
	
	
	@RequestMapping("/order")
	public String orderView(Model model,
			HttpSession session) {
		
		int userId = (int)session.getAttribute("userId");
		
		User user = userBO.getUserById(userId);
		
		model.addAttribute("user", user);
		model.addAttribute("gnb", "/include/main_gnb");
		model.addAttribute("content", "/order/order");
		model.addAttribute("footer", "/include/footer");
		return "/template/layout";
	}
	
}
