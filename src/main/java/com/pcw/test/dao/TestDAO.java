package com.pcw.test.dao;

import org.springframework.stereotype.Repository;

import com.pcw.test.model.Test;

@Repository
public interface TestDAO {

	public Test selectTest();
	
}
