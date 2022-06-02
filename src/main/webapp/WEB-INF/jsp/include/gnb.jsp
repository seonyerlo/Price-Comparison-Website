<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<div class="main-top-header">
	<ul>
		<c:if test="${not empty userName}">
			<li><a href="/user/sign_out">로그아웃</a></li>
		</c:if>
		<c:if test="${empty userName}">
			<li><a href="/user/sign_in">로그인</a></li>
		</c:if>
		<li><a href="/user/sign_up">회원가입</a></li>
		<li><a href="#">주문배송</a></li>
		<li><a href="#">고객센터</a></li>
	</ul>
</div>
<header class="main-header">
	<div class="pcw-logo-and-search-box">
		<div class="pcw-logo-box">
			<a href="/index"> <img src="/image/logo1.png" alt="pcw로고이미지">
			</a>
		</div>
		<div class="pcw-search-box">
			<input type="text">
			<button type="button" id="searchBtn" class="pcw-search-btn bx bx-search"></button>
		</div>
	</div>
	<div class="pcw-sub-box">
		<a href="#"> <i class='bx bx-cart'></i> <span>장바구니</span>
		</a> <a href="#"> <i class='bx bx-heart'></i> <span>관심</span>
		</a> <a href="#"> <i class='bx bx-user'></i> <c:if
				test="${not empty userName}">
				<span>${userName}</span>
			</c:if> <c:if test="${empty userName}">
				<span>마이페이지</span>
			</c:if>
		</a>
	</div>
</header>
<nav>
	<div>
		<button class="category-btn">
			<i class='bx bx-menu'></i><i class='bx bx-x d-none'></i><span>전체 카테고리</span>
		</button>
		<ul class="pcw-menu">
			<li><a href="#" class="pcw-menu-select">주요이슈</a></li>
			<li><a href="#" class="pcw-menu-select">데스크탑</a></li>
			<li><a href="#" class="pcw-menu-select">노트북</a></li>
			<li><a href="#" class="pcw-menu-select">PC견적</a></li>
		</ul>
	</div>
	<div class="pcw-content-layout d-none">
		<div class="pcw-category-box pcw-category-layout">
			<ul>
				<li class="pcw-category"><a href="#"><i
						class='bx bx-desktop'></i>데스크탑</a>
					<ul>
						<li><a href="#">CPU</a></li>
						<li><a href="#">메인보드</a></li>
						<li><a href="#">RAM</a></li>
						<li><a href="#">VGA</a></li>
						<li><a href="#">SSD</a></li>
						<li><a href="#">HDD</a></li>
					</ul></li>
				<li class="pcw-category"><a href="#"><i
						class='bx bx-laptop'></i>노트북</a>
					<ul>
						<li><a href="#">전체</a></li>
						<li><a href="#">애플 맥북</a></li>
						<li><a href="#">AMD노트북</a></li>
						<li><a href="#">인텔노트북</a></li>
						<li><a href="#">게이밍노트북</a></li>
					</ul></li>
				<li class="pcw-category"><a href="#"><div class="pc">PC</div>조립PC</a>
					<ul>
						<li><a href="#">가정용/사무용PC</a></li>
						<li><a href="#">게임용PC</a></li>
						<li><a href="#">방송용PC</a></li>
					</ul></li>
			</ul>
		</div>
	</div>
</nav>

<script>
	$(document).ready(function() {
		$('.pcw-category').hover(function(){    
			// hover 되었을 때 
			$(this).addClass('active');
		},
		function() {
			$(this).removeClass('active');   
		});
		
		$('.category-btn').on('click', function() {
			if ($('.pcw-content-layout').hasClass('d-none')) {
				$('.pcw-content-layout').removeClass('d-none');	
				$('.bx-x').removeClass('d-none');
				$('.bx-menu').addClass('d-none');
			} else {
				$('.pcw-content-layout').addClass('d-none');	
				$('.bx-x').addClass('d-none');
				$('.bx-menu').removeClass('d-none');
			}
			
		});
		$('.bx-x').on('click', function() {
			
		});
		
	});
</script>