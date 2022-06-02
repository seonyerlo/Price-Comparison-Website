package com.pcw.user;

import java.security.NoSuchAlgorithmException;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.pcw.common.SHA256;
import com.pcw.user.bo.UserBO;
import com.pcw.user.model.User;

@RequestMapping("/user")
@RestController	
public class UserRestController {

	
	@Autowired
	private UserBO userBO;
	
	@RequestMapping("/is_duplicated_id")
	public Map<String, Object> isDuplicatedId(
			@RequestParam("userId") String userId
		) {
		Map<String, Object> result = new HashMap<>();
		
		// db
		int count = userBO.getUserByUserId(userId);
		if  (count > 0) {
			// id가 중복, 존재
			result.put("result", true);
		} else {
			// id 사용 가능
			result.put("result", false);
		}
		
		return result;
	}
	
	/**
	 * 로그인
	 * @param userId
	 * @param userPw
	 * @param session
	 * @return
	 * @throws NoSuchAlgorithmException 
	 */
	@PostMapping("/login")
	public Map<String, Object> login(
			@RequestParam("userIdOrEmail") String userIdOrEmail, 
			@RequestParam("userPw") String userPw,
			HttpSession session) throws NoSuchAlgorithmException {
		
		Map<String, Object> result = new HashMap<>();
		
		SHA256 sha256 = new SHA256();
		
		String cryptoram = sha256.encrypt(userPw);
		
		User user = userBO.getUserByUserIdAndPassword(userIdOrEmail, cryptoram);
		
		if (user != null) {
			result.put("result", "success");
			session.setAttribute("userName", user.getUserName());
		} else {
			result.put("result", "error");
			result.put("error_message", "존재하지 않는 사용자입니다.");
		}
		
		return result;
	}
	
	/**
	 * 회원가입
	 * @param userId
	 * @param userPw
	 * @param userName
	 * @param userEmail
	 * @param userPhoneNumber
	 * @param userAddress
	 * @return
	 * @throws NoSuchAlgorithmException 
	 */
	@PostMapping("/join")
	public Map<String, Object> signUp(
			@RequestParam("userId") String userId,
			@RequestParam("userPw") String userPw,
			@RequestParam("userName") String userName,
			@RequestParam("userEmail") String userEmail,
			@RequestParam("userPhoneNumber") String userPhoneNumber,
			@RequestParam("userAddress") String userAddress) throws NoSuchAlgorithmException {
	
		Map<String, Object> result = new HashMap<>();
		
		SHA256 sha256 = new SHA256();

        String cryptoram = sha256.encrypt(userPw);
		
		// db
		int count = userBO.addUser(userId, cryptoram, userName, userEmail, userPhoneNumber, userAddress);
		
		result.put("result", "success");
		
		if (count < 1) {
			result.put("result", "error");
			result.put("error_message", "관리자에게 문의해주세요.");
		}
		
		return result;
	}
}
