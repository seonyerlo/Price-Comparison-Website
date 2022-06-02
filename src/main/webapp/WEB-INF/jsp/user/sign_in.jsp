<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
	<div class="pcw-sign-logo-box">
		<a href="/index">
	    	<img src="/image/logo.png" alt="pcw로고이미지" width="200px">
	    </a>
	</div>
    <div class="pcw-sign-input-box">
        <input id="userIdOrEmail" type="text" class="userId pcw-sign-input" placeholder="아이디/이메일">
        <input id="userPw" type="password" class="userPw pcw-sign-input" placeholder="비밀번호">
        <div class="confirm-box">
        	<span class="confirm-text d-none"></span>
        </div>
        <div class="pcw-sign-btn-box">
    	 	<button type="button" id="signInBtn" class="pcw-sign-btn">로그인</button>
    	</div>
    	<div class="pcw-find-box">
	        <div><a href="#">아이디 찾기</a></div>
	        <div><a href="#">비밀번호 찾기</a></div>
	        <div><a href="/user/sign_up">회원가입</a></div>
    	</div>
    </div>

<script>
$(document).ready(function() {
	
	$('.pcw-sign-input').on('focus', function() {
		$(this).css('outline', '1px solid #764AF1');
	});
	
	$('.pcw-sign-input').on('blur', function() {
		$(this).css('outline', 'none');
	});
	
	// enter event
	$('.pcw-sign-input').on('keypress', function(e) {
		
		let userIdOrEmail = $('#userIdOrEmail').val().trim();
		let userPw = $('#userPw').val().trim();
		
		if (e.keyCode == 13) {
			// 로그인 함수 호출
			signIn(userIdOrEmail, userPw);
		}
	});
	
	// 로그인 버튼 클릭 시 
	$('#signInBtn').on('click', function(e) {                        
		e.preventDefault();
		
		let userIdOrEmail = $('#userIdOrEmail').val().trim();
		let userPw = $('#userPw').val().trim();
		// 로그인 함수 호출
		signIn(userIdOrEmail, userPw);
	});
});

function signIn(userIdOrEmail, userPw) {
	
	if (userIdOrEmail == '') {
		$('.confirm-text').removeClass('d-none');
		$('.confirm-text').text('아이디를 입력해주세요');
		$('#userIdOrEmail').focus();
		return;
	}
	
	if (userPw == '') {
		$('.confirm-text').removeClass('d-none');
		$('.confirm-text').text('비밀번호를 입력해주세요');
		$('#userPw').focus();
		return;
	}
	
	$.ajax({
		type: "POST"
		, url: "/user/login"
		, data: {"userIdOrEmail":userIdOrEmail, "userPw":userPw}
		, success: function(data) {
			if (data.result == "success") {
				location.href="/index";
			} else {
				$('.pcw-sign-input-box > input').css('border', '1px solid red');
				$('.confirm-text').removeClass('d-none');
				$('.confirm-text').text('아이디/이메일 또는 비밀번호를 잘못 입력하셨습니다.');
				// 비밀번호 초기화
				$('#userPw').val('');
				$('#userPw').css('outline', 'none');
				$('.pcw-sign-input').on('focus', function() {
					$(this).css('outline', 'none');
				});
			}
		}
		, error: function(error) {
			alert("로그인을 실패했습니다. 관리자에게 문의해주세요.");
		}
	});
}
</script>