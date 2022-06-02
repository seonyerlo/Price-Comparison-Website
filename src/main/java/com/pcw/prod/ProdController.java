package com.pcw.prod;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/prod")
public class ProdController {

	/**
	 * 상품 비교
	 * @param model
	 * @return
	 */
	// 요청 URL : http://localhost/prod/prod_comparison
	@RequestMapping("/prod_comparison")
	public String ProdComparisonView(Model model) {
		model.addAttribute("content", "/prod/prod_comparison");
		model.addAttribute("gnb", "/include/gnb");
		model.addAttribute("footer", "/include/footer");
		return "template/prod_layout";
	}
}
