package com.pcw.test;

import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.pcw.test.bo.TestBO;

@RequestMapping("/test")
@Controller
public class TestController {

	@Autowired 
	private TestBO testBO;
	
	
	@ResponseBody
	@RequestMapping("/test1")
	public String test1() {
		return "Hello world!";
	}
	
	@ResponseBody
	@RequestMapping("/test2")
	public Map<String, Object> test2() {
		Map<String, Object> result = new HashMap<>();
		result.put("a", "a");
		result.put("b", 1234);
		return result;
	}
	
	@RequestMapping("/test3")
	public String test3() {
		return "test/example";
	}
	
	@RequestMapping("/test4")
	@ResponseBody
	public Map<String, Object> test4() {
		Map<String, Object> result = new HashMap<>();
		result.put("result", testBO.getTest());
		return result;
	}
}
