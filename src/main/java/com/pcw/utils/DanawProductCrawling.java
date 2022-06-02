
package com.pcw.utils;


import org.jsoup.Connection;
import org.jsoup.Jsoup;
import org.jsoup.nodes.Document;
import org.jsoup.nodes.Element;
import org.jsoup.select.Elements;
import org.springframework.stereotype.Component;
import org.springframework.util.StringUtils;

import com.pcw.prod.model.DanawProductDTO;

import lombok.extern.slf4j.Slf4j;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

@Component
@Slf4j
public class DanawProductCrawling {
	
	//1.AMDLaptop URI 주소값
	public final static String  AMDLaptop_URI="http://prod.danawa.com/list/?cate=11236452&15main_11_02";	

	//2.cpu  URI 주소값
	public final static String  CPU_URI="http://prod.danawa.com/list/?cate=112747&15main_11_02";
	
	//3.메인보드   URI 주소값
	public final static String  Motherboard_URI="http://prod.danawa.com/list/?cate=112751";
	
	//4.그래픽카드  URI 주소값
	public final static String VGA_URI="http://prod.danawa.com/list/?cate=112753";
	
	//5.SSD  URI 주소값
	public final static String SSD_URI ="http://prod.danawa.com/list/?cate=112760";
	
	//6.조립 PC  URI 주소값
	public final static String Asembly_PC_URI ="http://prod.danawa.com/list/?cate=11236849&15main_11_02";
	
	//7.RAM  URI 주소값
	public final static String RAM_URI = "http://prod.danawa.com/list/?cate=112752&15main_11_02";
	
	//8.애플 맥북 URI 주소값
	public final static String Apple_Macbook_URI = "http://prod.danawa.com/list/?cate=11236463&15main_11_02";


	
	
	/**
	 * 다나와 크롤링
	 * @param danawUrl
	 * @return
	 */
	public List<DanawProductDTO> getProducts(String danawUrl ,int size ) {
					
			//Jsoup 이용한 url 접속
			Connection conn = Jsoup.connect(danawUrl);
	        String id=""; //제품 아이디
	        String thumbLink=""; //이미지 링크 주소
	        String thumbImage=""; //이미지 	
	    	String  prodName=""; //제품명	
	    	String specList=""; //제품 정보
	    	String mtDate="";  //등록월
	    	int price=0; //가격
        	
	        try {
	            Document document = conn.get();
	            // prod_item 클래스  element 를 가져온다
	            Elements productListElements =null;
	            
	            List<DanawProductDTO> products=new ArrayList<DanawProductDTO>();
	
	            int productSize=0;
	            if(size==1) {// size가 1이면 첫번째 값만 가져오기	            
	            	productSize=size;
	            	productListElements= document.getElementsByClass("prod_item").get(0).getAllElements();
	            }else {
	            	productListElements= document.getElementsByClass("prod_item");
	            	productSize=productListElements.size();
	            }
	            
	            
	            log.info("다나와 prod_item 클래스 데이터 갯수 : {}", productSize );
	            
	            //현재 다나와 사이트  prod_item 클래스는 31 ~ 37 사이로  출력 된다.
	            for (int i = 0; i< productSize; i++) {
	            	
	               	//다나와 사이트 prod_item 클래스에서  속성값 id 값을 가져온다. productItem 와 adReaderProductItem 값은 제거
	            	id=productListElements.get(i).attr("id").replaceAll("productItem", "").replaceAll("adReaderProductItem", "");	                
	            	
	            	//다나와 사이트 prod_item 클래스  i 번째 element 에서  thumb_link 클래스의  href 속성값을 가져온다.
	            	thumbLink= productListElements.get(i).getElementsByClass("thumb_link").attr("href");
	            	
	            	//다나와 사이트 prod_item 클래스  i 번째 element 에서  img 태그에서 src 속성값을 가져온다.
	            	thumbImage=productListElements.get(i).getElementsByTag("img").attr("src");
	            	if(!StringUtils.hasText(thumbImage)){ //만약에  img 태그에서 src 속성  값이 없다면,  "data-original 속성값으로 대체 한다.	            		
	            		thumbImage=productListElements.get(i).getElementsByTag("img").attr("data-original");
	            	}

	            	//다나와 사이트 prod_item 클래스  i 번째 element 에서  prod_name 클래스 element 들을 가져온다.
	            	Elements prodNameElements=productListElements.get(i).getElementsByClass("prod_name");
	            	//prod_name element 0번째 인덱스의 텍스트 값을 가져온다.
	            	prodName=prodNameElements.get(0).getElementsByTag("a").text();
	                
	            	
	            	//제품 정보 spec_list 클래스 데이터값을 가져와  specList 에 저장
	                //specList=productListElements.get(i).getElementsByClass("spec_list").text();

	                //날짜값 저장하기
	                Elements mtDateElements=productListElements.get(i).getElementsByClass("mt_date");	                 
	                if(mtDateElements!=null&&mtDateElements.size()>0) {
	                	mtDate=mtDateElements.get(0).getElementsByTag("dd").text();	
	                }
	                
	                
	                //제품 가격 데이터 값 가져와서 저장하기
	                Elements prod_pricelist=productListElements.get(i).getElementsByClass("prod_pricelist");
	                Elements prod_pricelist_li  =prod_pricelist.get(0).getElementsByTag("li");
	                String priceStr=prod_pricelist_li.get(0).getElementsByTag("strong").text().replaceAll("상품비교", "").replaceAll("\\W", "");	                
	                if(StringUtils.hasText(priceStr)) { 	                	//가격이 null 아니고 존재한다면 정수형으로 변환
	            	   price=Integer.parseInt(priceStr);   
	                }
	                
	                
	                if(StringUtils.hasText(id)) { 	//id 값이 null 이 아니고 존재 한다면  DanawProductDTO 생성	                
	                	DanawProductDTO product = 
	                			DanawProductDTO.builder()
	                			.id(id)
	                			.thumbLink(thumbLink)
	                			.thumbImage(thumbImage)	     	            			
	                			.prodName(prodName)
	                			//.specList(specList)
	                			.mtDate(mtDate)
	                			.price(price)
	                			.build();
	                	
	                	//List<DanawProductDTO> products 리스트 객체에  DanawProductDTO 객체 넣기
	                	products.add(product);	               	                	
	                }
	
	            		            	         
	            }
	
     	        return products;
	        } catch (IOException e) {
	            e.printStackTrace();
	            return null;
	        }
	}
	
	
	

	
	
	/**
	 *1.메인 인덱스  인덱스 번호에 따라 제품 가져오기
	 * @return
	 */
	public List<DanawProductDTO> getMainProducts(){
		//1.AMDLaptop  제품 가져오기
		List<DanawProductDTO> AMDLaptopList=getProducts(DanawProductCrawling.AMDLaptop_URI , 1);
		DanawProductDTO AMDLaptop=AMDLaptopList.get(0); 
		

		//2.CPU  제품 가져오기
		List<DanawProductDTO> CPUList=getProducts(DanawProductCrawling.CPU_URI, 1);
		DanawProductDTO cpu=CPUList.get(0);
		

		//3.메인보드  제품 가져오기
		List<DanawProductDTO> motherboardList=getProducts(DanawProductCrawling.Motherboard_URI, 1);
		DanawProductDTO motherboard=motherboardList.get(0);
		
	
		//4.그래픽카드  제품 가져오기
		List<DanawProductDTO> VGAList=getProducts(DanawProductCrawling.VGA_URI, 1);
		DanawProductDTO VGA=VGAList.get(0);
		
		
		//5.SSD  제품 가져오기
		List<DanawProductDTO> SSDList=getProducts(DanawProductCrawling.SSD_URI, 1);
		DanawProductDTO SSD=SSDList.get(0);
		
		
		//6.조립 PC  제품 가져오기
		List<DanawProductDTO> asemblyPCList=getProducts(DanawProductCrawling.Asembly_PC_URI, 1);
		DanawProductDTO asemblyPC=asemblyPCList.get(0);
		
		
		//7.RAM  제품 가져오기
		List<DanawProductDTO> RAMList=getProducts(DanawProductCrawling.RAM_URI, 1);
		DanawProductDTO RAM=RAMList.get(0);
		
		
		//8.애플 맥북 제품 가져오기
		List<DanawProductDTO> appleMacBookList=getProducts(DanawProductCrawling.Apple_Macbook_URI, 1);
		DanawProductDTO appleMacBook=appleMacBookList.get(0);
		
		
		//List 객체 생성후 해당 제품 담기
		List<DanawProductDTO> products=new ArrayList<DanawProductDTO>();
		products.add(AMDLaptop);
		products.add(cpu);
		products.add(motherboard);
		products.add(VGA);
		products.add(SSD);
		products.add(asemblyPC);
		products.add(RAM);
		products.add(appleMacBook);
		
				
		return products;
	}
	
	
	/**
	 * 메뉴별 다나와 제품 가져오기 ,AMDLaptop, cpu, 메인보드, 그래픽카드,SSD, 조립 PC , RAM, 애플 맥북
	 * @param uri
	 * @return
	 */
	public List<DanawProductDTO> getDanaw(String uri){
		List<DanawProductDTO> daList=getProducts(uri ,0);
		return daList;
	}
	
	
	
	/**
	 * 다나와 크로링 테스트
	 * @param args
	 */
	 public static void main(String[] args) {	       
	         DanawProductCrawling danawCrawling=new DanawProductCrawling();
	         //List<Product> products=danawCrawling.getProducts(DanawProductCrawling.RAM_URI);
	         
	         List<DanawProductDTO> products= danawCrawling.getMainProducts();
	         
	         for(DanawProductDTO product : products) {
	        	log.info("다나와 크롤링 테스트   {}" ,product.toString()); 
	         }		         
	  }

	    
}

