
let danaw={
	init:function(){
		$(".danawMenu").on("click",(e)=>{
			
			
			e.preventDefault();			
			const event=e.target
			const menu=$(event).attr("data-menu");
			console.log(menu);
			console.log(" json 데이터 가져오기  url :" ,"http://localhost/api/danaw/"+menu );
			this.getProduct("/api/danaw/"+menu);
		});
	},
	
	getProduct:function(url){
		danawCrawlingProduct(url);
	}
	
}

danaw.init();

//다나와 크로링 제품 가져오기  파라미터 값 url
function danawCrawlingProduct(url){

		//1.로딩 시작
		$("#page-loading").show();
		
	    //2.json 형태의 데이터를 가져온다.
		$.getJSON(url, function(data){
			let items =[];
			$.each(data, function(index, product){
				//const id=product.id;
				const thumbLink=product.thumbLink;
				const thumbImage=product.thumbImage;
				const prodName=product.prodName;
				const price=commaSetting(product.price);
				//console.log(thumbLink, thumbLink, prodName, price);					
				//items 배열에 등록한다.	
				
				if(index<30){
					items.push(
						`
							<li class="product-list-item">
									<a href="${thumbLink}" target="_blank">
										<div>
											<img src="${thumbImage}" alt="">
										</div> <span class="product-name">${prodName}</span> <span
										class="product-price">${price}<span>원</span></span>
									</a>
							</li>
						`	
					);						
				}	

			});
			

						
			//product-lis 클래스에 데이터를 넣는다.
			$(".product-list").html(items);
						
			if(url!=="/api/mainProducts"){ // 메인 페이지가 아니라면 하단 css 수정
				const pcBest="<div class='pcw-best-shoppingmall-box'>"+$(".pcw-best-shoppingmall-box").html() +"</div>";
				const footer="<footer>" +$("footer").html()+"</footer>" ;		
				$(".pcw-best-shoppingmall-box").remove();
				$("footer").remove();
				
				$("#pcw-best").append(pcBest);
				$("#wrap").append(footer);				
				let height=$(".pcw-best-seller-box").css("height").replace("px","");
				//console.log(parseInt(height)+430+"px");
				$("#pcw-best").css("position", "relative").css("top", parseInt(height)+450+"px");
				$("footer").css("top", parseInt(height)+450+"px");
			
			}

			
			//3.로딩 끝	
			$("#page-loading").hide();
		});
		
}

//정규식을 이용하여 3자리마다 콤마 넣기
function commaSetting(price){
	return price.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ',');	
}

