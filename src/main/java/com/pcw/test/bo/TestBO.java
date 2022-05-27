package com.pcw.test.bo;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.pcw.test.dao.TestDAO;
import com.pcw.test.model.Test;

@Service
public class TestBO {

	@Autowired
	private TestDAO testDAO;
	
	public Test getTest() {
		return testDAO.selectTest();
	}
}
