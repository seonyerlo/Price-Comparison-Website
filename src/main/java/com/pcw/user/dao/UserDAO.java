package com.pcw.user.dao;

import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import com.pcw.user.model.User;

@Repository
public interface UserDAO {

	public int selectUserByLoginId (String userId);
	
	public User selectUserById(int userId);
	
	public User selectUserByUserIdAndPassword (
			@Param("userIdOrEmail") String userIdOrEmail, 
			@Param("userPw") String userPw);
	
	public int insertUser (
			@Param("userId") String userId,
			@Param("userPw") String userPw,
			@Param("userName") String userName,
			@Param("userEmail") String userEmail,
			@Param("userPhoneNumber") String userPhoneNumber,
			@Param("userAddress1") String userAddress1,
			@Param("userAddress2") String userAddress2);
}
