package com.pcw.prod;

import java.util.List;

import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.pcw.prod.model.DanawProductDTO;
import com.pcw.utils.DanawProductCrawling;

@RestController
@RequestMapping("/api")
public class DanawProductApiController {


	/**
	 * 인덱스 메인화면 상품 목록 가져오기
	 * @return
	 * url :/api/mainProducts
	 */
	@GetMapping(value = "/mainProducts")
	public ResponseEntity<List<DanawProductDTO>> mainProducts(DanawProductCrawling danawProductCrawling) {
		//다나와 메인 인덱스 화면 제품만 가져오기
		List<DanawProductDTO> product=danawProductCrawling.getMainProducts();		
		return ResponseEntity.status(HttpStatus.OK).body(product);
	}
	
	/**
	 * API 메뉴별 다나와 제품 가져오기 ,AMDLaptop, cpu, 메인보드, 그래픽카드,SSD, 조립 PC , RAM, 애플 맥북
	 * @param danawProductCrawling
	 * @param url
	 * @return
	 */
	@GetMapping(value = "/danaw/{url}")
	public ResponseEntity<List<DanawProductDTO>> getDanaw(DanawProductCrawling danawProductCrawling , 
			@PathVariable(value ="url") String url) {
		
		List<DanawProductDTO> products=null;
		if(url.equals("amd")) { //1.  URL 주소값이 /api/danaw/amd  일경우
			products=danawProductCrawling.getDanaw(DanawProductCrawling.AMDLaptop_URI);	
		
		}else if(url.equals("cpu")) { //2.  URL 주소값이 /api/danaw/cpu  일경우
			products=danawProductCrawling.getDanaw(DanawProductCrawling.CPU_URI);
		
		}else if(url.equals("motherboard")) {//3.  URL 주소값이 /api/danaw/motherboard  일경우
			products=danawProductCrawling.getDanaw(DanawProductCrawling.Motherboard_URI);
		
		}else if(url.equals("vga")) {//4.  URL 주소값이 /api/danaw/vga  일경우
			products=danawProductCrawling.getDanaw(DanawProductCrawling.VGA_URI);
		
		}else if(url.equals("ssd")) {//5.  URL 주소값이 /api/danaw/ssd  일경우
			products=danawProductCrawling.getDanaw(DanawProductCrawling.SSD_URI);		
		
		}else if(url.equals("asembly")) {//6.  URL 주소값이 /api/danaw/asembly  일경우
			products=danawProductCrawling.getDanaw(DanawProductCrawling.Asembly_PC_URI);				
		
		}else if(url.equals("ram")) {//7.  URL 주소값이 /api/danaw/ram  일경우
			products=danawProductCrawling.getDanaw(DanawProductCrawling.RAM_URI);		
		
		}else if(url.equals("apple")) {//8.  URL 주소값이 /api/danaw/apple  일경우
			products=danawProductCrawling.getDanaw(DanawProductCrawling.Apple_Macbook_URI);		
		}
			
		return ResponseEntity.status(HttpStatus.OK).body(products);
	}
	
	
}

