package com.pcw.user;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/user")
public class UserController {

	/** 회원가입
	 * @param model
	 * @return
	 */
	
	// 요청 URL : http://localhost/user/sign_up
	@RequestMapping("/sign_up")
	public String signUpView(Model model) {
		model.addAttribute("title", "회원가입");
		model.addAttribute("content", "/user/sign_up");
		model.addAttribute("footer", "/include/sign_footer");
		return "template/sign_layout";
	}

	/** 로그인
	 * @param model
	 * @return
	 */
	// 요청 URL : http://localhost/user/sign_in
	@RequestMapping("/sign_in")
	public String signInView(Model model) {
		model.addAttribute("title", "로그인");
		model.addAttribute("content", "/user/sign_in");
		model.addAttribute("footer", "/include/sign_footer");
		return "template/sign_layout";
	}
	
	@RequestMapping("/sign_out")
	public String signOut(HttpSession session) {
		session.removeAttribute("userName");
		return "redirect:/index";
	}
}
