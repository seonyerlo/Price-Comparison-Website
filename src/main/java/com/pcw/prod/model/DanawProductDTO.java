package com.pcw.prod.model;

import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;
import lombok.ToString;

@Data
@ToString
@NoArgsConstructor
public class DanawProductDTO {
	
	private String id; //제품 아이디
	private String thumbLink; //이미지 링크 주소
	private String thumbImage; //이미지 	
	private String prodName; //제품명	
	private String specList; //제품 정보
	private String mtDate ;  //등록월
	private int price; //가격
	
	
	@Builder
	public DanawProductDTO(String id, String thumbLink, String thumbImage,  String prodName, String specList, String mtDate, int price) {		
		this.id = id;
		this.thumbLink = thumbLink;
		this.thumbImage = thumbImage;		
		this.prodName = prodName;
		this.specList = specList;
		this.mtDate = mtDate;		
		this.price = price;
	}
	
	
	
	
}
