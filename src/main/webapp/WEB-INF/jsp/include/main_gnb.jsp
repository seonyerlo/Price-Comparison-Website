<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
			<a href="/index">
				<img src="../image/logo.png" alt="pcw로고이미지">
			</a>
		</div>
		<div class="pcw-search-box">
			<input type="text">
			<button type="button" id="searchBtn" class="pcw-search-btn bx bx-search"></button>
		</div>
	</div>
	<div class="pcw-sub-box">
		<a href="#">
			<i class='bx bx-cart'></i> <span>장바구니</span>
		</a>
		<a href="#">
			<i class='bx bx-heart'></i> <span>관심</span>
		</a>
		<a href="#">
			<i class='bx bx-user'></i>
			<c:if test="${not empty userName}">
				<span>${userName}</span>
			</c:if>
			<c:if test="${empty userName}">
				<span>마이페이지</span>
			</c:if>
		</a>
	</div>
</header>
<nav>
	<div>
		<button class="category-btn">
			<i class='bx bx-menu'></i><span>전체 카테고리</span>
		</button>
		<ul class="pcw-menu">
			<li><a href="#" class="pcw-menu-select">주요이슈</a></li>
			<li><a href="#" class="pcw-menu-select">데스크탑</a></li>
			<li><a href="#" class="pcw-menu-select">노트북</a></li>
			<li><a href="#" class="pcw-menu-select">PC견적</a></li>
		</ul>
	</div>
</nav>