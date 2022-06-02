<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<div>
	<div class="pcw-sign-logo-box">
		<a href="/index">
		    <img src="/image/logo.png" alt="pcw로고이미지" width="200px">
		</a>
	</div>
	<div class="pcw-sign-input-box">
		<div class="pcw-sign-form-group">
			<label for="userId">아이디</label>
			<input id="userId" type="text" class="pcw-sign-input" placeholder="영문 4자 이상, 최대 20자">
			<div class="pcw-check-box">
	    		<span class="pcw-id-check-text d-none"></span>
			</div>
		</div>
		<div class="pcw-sign-form-group">
			<label for="userPw">비밀번호</label>
			<input id="userPw" type="password" class="pcw-sign-input" placeholder="숫자, 영문, 특수문자 포함 최소 8자 이상">
			<div class="pcw-check-box">
	    		<span class="pcw-pw-check-text d-none"></span>
			</div>
		</div>
		<div class="pcw-sign-form-group">
			<label for="userPwConfirm">비밀번호 확인</label>
			<input id="userPwConfirm" type="password" class="pcw-sign-input" placeholder="숫자, 영문, 특수문자 포함 최소 8자 이상">
			<div class="pcw-check-box">
	    		<span class="pcw-pw-confirm-check-text d-none"></span>
			</div>
		</div>
		<div class="pcw-sign-form-group">
			<label for="userName">이름</label>
			<input id="userName" type="text" class="pcw-sign-input" placeholder="한글 8자, 영문 16자까지 가능">
			<div class="pcw-check-box">
	    		<span class="pcw-name-check-text d-none"></span>
			</div>
		</div>
		<div class="pcw-sign-form-group">
			<label for="userEmail">이메일 주소</label>
			<input id="userEmail" type="text" class="pcw-sign-input" placeholder="이메일 주소 입력">
			<div class="pcw-check-box">
	    		<span class="pcw-email-check-text d-none">이메일 형식을 확인해 주세요.</span>
			</div>
		</div>
		<div class="pcw-sign-form-group">
			<label for="userPhoneNumber">전화번호</label>
			<input id="userPhoneNumber" type="text" class="pcw-sign-input" placeholder="'-'없이 입력" maxlength="13">
			<div class="pcw-check-box">
	    		<span class="pcw-phone-check-text d-none">최대 13이하로 입력하세요.</span>
			</div>
		</div>
		<div class="pcw-sign-form-group">
			<label for="userFindAddress">주소</label>
			<div class="mb-2">
				<input type="text" id="userFindAddress" class="user-address pcw-sign-input" placeholder="우편번호" readonly>
				<button type="button" id="userFindAddressBtn" class="find-address-btn">우편번호 찾기</button>
			</div>
			<input id="userAddress1" type="text" class="user-address pcw-sign-input mb-2" placeholder="주소지 입력" readonly>
			<input id="userAddress2" type="text" class="user-address pcw-sign-input" placeholder="상세주소 입력">
			<div class="pcw-check-box">
	    		<span class="pcw-address-check-text d-none"></span>
			</div>
		</div>
		<div class="pcw-sign-btn-box mt-4">
	    	<button type="button" id="signUpBtn" class="pcw-sign-btn">회원가입</button>
	    </div>
	</div>
	<jsp:include page="../${footer}.jsp" />
</div>


<script>
$(document).ready(function() {
	
	$('.pcw-sign-input').on('focus', function() {
		$(this).css('outline', '1px solid #764AF1');
	});
	
	$('.pcw-sign-input').on('blur', function() {
		$(this).css('outline', 'none');
	});
		
	// 아이디 정규 표현식
	const regId = /^[a-zA-Z0-9]{4,20}$/;
	// 아이디 정규 표현식 (한글 포함 여부)
	const regKorean = /^[ㄱ-ㅎ가-힣]+$/;
	// 비밀번호 정규 표현식
	const regPw = /^(?=.*?[a-zA-Z])(?=.*?[0-9])(?=.*?[#!@$%^&*]).{8,}$/;
	// 이름 정규 표현식
	const regName = /^[ㄱ-ㅎ가-힣a-zA-Z]+$/;
	// 이메일 정규 표현식
	const regEmail = /^[0-9a-zA-Z]([-_\.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_\.]?[0-9a-zA-Z])*\.[a-zA-Z]{2,3}$/;
	// 주소 정규 표현식 (주소지 입력 띄어쓰기 가능)
	const regAddress = /^[0-9-가-힣\s]+$/;
	
	// 아이디 유효성 검사 
	$('#userId').on('input', function(e) {
		
		let userId = $('#userId').val().trim();
		
		if (userId.match(regKorean)) {
			$('.pcw-id-check-text').removeClass('d-none');
			$('.pcw-id-check-text').css('color', 'red');
			$('.pcw-id-check-text').text("한글이 포함되어 있습니다.");
			return;
		}
		
		if (userId.length < 4) {
			$('.pcw-id-check-text').removeClass('d-none');
			$('.pcw-id-check-text').css('color', 'red');
			$('.pcw-id-check-text').text("최소 4자 , 최대 20 자 입니다.");
			return;
		}
		
		if (!userId.match(regId)) {
			$('.pcw-id-check-text').removeClass('d-none');
			$('.pcw-id-check-text').css('color', 'red');
			$('.pcw-id-check-text').text("허용되지 않는 문자열이 포함되어 있습니다.");
			$(this).focus();
			return;
		}
		
		// 아이디 중복확인
		$.ajax({
			url: "/user/is_duplicated_id"
			, data: {"userId":userId}
			, success: function(data) {
				if (data.result) {
					$('.pcw-id-check-text').removeClass('d-none');
					$('.pcw-id-check-text').css('color', 'red');
					$('.pcw-id-check-text').text("사용중이거나 탈퇴한 아이디입니다.");
				} else {
					$('.pcw-id-check-text').removeClass('d-none');
					$('.pcw-id-check-text').css('color', '#764AF1');
					$('.pcw-id-check-text').text("사용 가능한 아이디입니다.");
				}
			}
			, error: function(error) {
				alert("아이디 중복 확인에 실패하였습니다. 관리자에게 문의해주세요.");
			}
		});
	});
	

	// 비밀번호 유효성 검사 (숫자, 영문, 특수문자 포함 최소 8자 이상)
	$('#userPw').on('input', function(e) {
		
		// 초기화
		$('.pcw-pw-check-text').addClass('d-none');
		
		let userPw = $('#userPw').val();
		if (userPw.length < 7) {
			$('.pcw-pw-check-text').removeClass('d-none');
			$('.pcw-pw-check-text').css('color', 'red');
			$('.pcw-pw-check-text').text('너무 짧습니다. 최소 8자 이상 입력하세요.');
			return;
		}
		if (userPw.length > 21) {
			$('.pcw-pw-check-text').removeClass('d-none');
			$('.pcw-pw-check-text').css('color', 'red');
			$('.pcw-pw-check-text').text('너무 깁니다. 최대 20자 이하로 입력하세요.');
			return;
		}
		
		if (!userPw.match(regPw)) {
			$('.pcw-pw-check-text').removeClass('d-none');
			$('.pcw-pw-check-text').css('color', 'red');
			$('.pcw-pw-check-text').text("영문과 숫자와 특수문자를 조합해서 입력해 주세요.");
			return;
		}
		
	});
	
	// 비밀번호 확인 유효성 검사 
	$('#userPwConfirm').on('input', function(e) {
		
		let userPw = $('#userPw').val();
		let userPwConfirm = $('#userPwConfirm').val();
		
		// 초기화
		$('.pcw-pw-confirm-check-text').addClass('d-none');
		
		if (userPwConfirm != userPw) {
			$('.pcw-pw-confirm-check-text').removeClass('d-none');
			$('.pcw-pw-confirm-check-text').css('color', 'red');
			$('.pcw-pw-confirm-check-text').text('비밀번호가 일치하지 않습니다.');
			return;
		}
	});
	
	// 이름 유효성 검사 
	$('#userName').on('input', function(e) {
		
		// 초기화
		$('.pcw-name-check-text').addClass('d-none');
		
		let userName = $('#userName').val();
		if (userName.length == '') {
			$('.pcw-name-check-text').removeClass('d-none');
			$('.pcw-name-check-text').css('color', 'red');
			$('.pcw-name-check-text').text('이름을 입력해주세요.');
			return;
		}
		
		if (!userName.match(regName)) {
			$('.pcw-name-check-text').removeClass('d-none');
			$('.pcw-name-check-text').css('color', 'red');
			$('.pcw-name-check-text').text('이름은 한글, 또는 영문만 입력할 수 있습니다.');
			return;
		}
		
		if (userName.length >= 16) {
			$('.pcw-name-check-text').removeClass('d-none');
			$('.pcw-name-check-text').css('color', 'red');
			$('.pcw-name-check-text').text('한글 8자 영문 16자까지 가능합니다.');
			return;
		}
	});
	
	// 이메일 유효성 검사 
	$('#userEmail').on('focusout', function(e) {
		
		let userEmail = $('#userEmail').val();
		
		// 초기화
		$('.pcw-email-check-text').addClass('d-none');
		
		if (!userEmail.match(regEmail)) {
			$('.pcw-email-check-text').removeClass('d-none');
			$('.pcw-email-check-text').css('color', 'red');
			return;
		}
	});
	
	// 전화번호 유효성 검사 
	$('#userPhoneNumber').on('input', function() { 
		$(this).val($(this).val().replace(/[^0-9]/g, "").replace(/(^02|^0505|^1[0-9]{3}|^0[0-9]{2})([0-9]+)?([0-9]{4})$/,"$1-$2-$3").replace("--", "-") ); 
	});
	
	$('#userFindAddressBtn').on('click', function() {
        new daum.Postcode({
        oncomplete: function(data) {
                $('#userFindAddress').val(data.zonecode);
                $('#userAddress1').val(data.address);
                $('#userAddress2').focus();
            }
        }).open();
    });

	// 우편번호 이벤트
	$('#userFindAddress').on('click', function() {
    	$('#userFindAddressBtn').click();
    });
	
	// 주소지 이벤트
	$('#userAddress1').on('click', function() {
    	$('#userFindAddressBtn').click();
    });
	
	
	// 주소 유효성 검사 
	$('#userAddress2').on('input', function() {
		let userAddress2 = $('#userAddress2').val();
		
		// 초기화
		$('.pcw-address-check-text').addClass('d-none');
		
		if (userAddress2.length == '') {
			$('.pcw-address-check-text').removeClass('d-none');
			$('.pcw-address-check-text').css('color', 'red');
			$('.pcw-address-check-text').text('상세주소를 입력하세요.');
			return;
		}

		if (!userAddress2.match(regAddress)) {
			$('.pcw-address-check-text').removeClass('d-none');
			$('.pcw-address-check-text').css('color', 'red');
			$('.pcw-address-check-text').text('허용되지 않는 문자열이 포함되어 있습니다.');
			return;
		}
		
	});

	
	
	// 회원가입 버튼 클릭 
	$('#signUpBtn').on('click', function(e) {
		
		// 아이디 유효성 검사 
		let userId = $('#userId').val().trim();
		if (userId == '') {
			$('.pcw-id-check-text').removeClass('d-none');
			$('.pcw-id-check-text').css('color', 'red');
			$('.pcw-id-check-text').text("아이디를 입력하세요.");
			$('#userId').focus();
			return;
		} 
		
		if (userId.match(regKorean) || userId.length < 4 || !userId.match(regId)) {
			$('.pcw-id-check-text').removeClass('d-none');
			$('.pcw-id-check-text').css('color', 'red');
			$('.pcw-id-check-text').text("아이디 형식에 맞게 입력하세요.");
			$('#userId').focus();
			return;
		}

		// 비밀번호 유효성 검사 
		let userPw = $('#userPw').val();
		if (userPw == '') {
			$('.pcw-pw-check-text').removeClass('d-none');
			$('.pcw-pw-check-text').css('color', 'red');
			$('.pcw-pw-check-text').text('비밀번호를 입력하세요.');
			$('#userPw').focus();
			return;
		} 
		
		if (userPw.length < 7 || userPw.length > 21 || !userPw.match(regPw)) {
			$('.pcw-pw-check-text').removeClass('d-none');
			$('.pcw-pw-check-text').css('color', 'red');
			$('.pcw-pw-check-text').text('비밀번호 형식에 맞게 입력하세요.');
			return;
		}
		
		// 비밀번호 확인 유효성 검사 
		let userPwConfirm = $('#userPwConfirm').val();
		if (userPwConfirm == '') {
			$('.pcw-pw-confirm-check-text').removeClass('d-none');
			$('.pcw-pw-confirm-check-text').css('color', 'red');
			$('.pcw-pw-confirm-check-text').text('비밀번호를 입력하세요.');
			$('#userPwConfirm').focus();
			return;
		} 
		if (userPwConfirm != userPw) {
			$('.pcw-pw-confirm-check-text').removeClass('d-none');
			$('.pcw-pw-confirm-check-text').css('color', 'red');
			$('.pcw-pw-confirm-check-text').text('비밀번호가 일치하지 않습니다.');
			return;
		}
		
		// 이름 유효성 검사 
		let userName = $('#userName').val().trim();
		if (userName == '') {
			$('.pcw-name-check-text').removeClass('d-none');
			$('.pcw-name-check-text').css('color', 'red');
			$('.pcw-name-check-text').text('이름을 입력하세요.');
			$('#userName').focus();
			return;
		}
		
		if (!userName.match(regName) || userName.length >= 16) {
			$('.pcw-name-check-text').removeClass('d-none');
			$('.pcw-name-check-text').css('color', 'red');
			$('.pcw-name-check-text').text('이름 형식에 맞게 입력하세요.');
			$('#userName').focus();
			return;
		}
		
		// 이메일 유효성 검사 
		let userEmail = $('#userEmail').val().trim();
		if (userEmail == '') {
			$('.pcw-email-check-text').removeClass('d-none');
			$('.pcw-email-check-text').css('color', 'red');
			$('.pcw-email-check-text').text('이메일을 입력하세요.');
			$('#userEmail').focus();
			return;
		} 
		
		if (!userEmail.match(regEmail)) {
			$('.pcw-email-check-text').removeClass('d-none');
			$('.pcw-email-check-text').css('color', 'red');
			$('.pcw-email-check-text').text('이메일 형식에 맞게 입력하세요.');
			$('#userEmail').focus();
			return;
		}
		
		// 전화번호 유효성 검사 
		let userPhoneNumber = $('#userPhoneNumber').val().trim();
		if (userPhoneNumber == '') {
			$('.pcw-phone-check-text').removeClass('d-none');
			$('.pcw-phone-check-text').css('color', 'red');
			$('.pcw-phone-check-text').text('전화번호를 입력하세요.');
			$('#userPhoneNumber').focus();
			return;
		} 
		
		// 주소 유효성 검사(우편번호)
		let userFindAddress = $('#userFindAddress').val().trim();
		if (userFindAddress == '') {
			$('.pcw-address-check-text').removeClass('d-none');
			$('.pcw-address-check-text').css('color', 'red');
			$('.pcw-address-check-text').text('주소를 입력하세요.');
			$('#userFindAddress').focus();
			return;
		}
		
		// 주소 유효성 검사 (주소지)
		let userAddress1 = $('#userAddress1').val().trim();
		if (userAddress1 == '') {
			$('.pcw-address-check-text').removeClass('d-none');
			$('.pcw-address-check-text').css('color', 'red');
			$('.pcw-address-check-text').text('주소를 입력하세요.');
			$('#userAddress1').focus();
			return;
		}
		
		// 주소 유효성 검사 (상세주소)
		let userAddress2 = $('#userAddress2').val().trim();
		if (userAddress2 == '') {
			$('.pcw-address-check-text').removeClass('d-none');
			$('.pcw-address-check-text').css('color', 'red');
			$('.pcw-address-check-text').text('상세주소를 입력하세요.');
			$('#userAddress2').focus();
			return;
		}
		
		if (!userAddress1.match(regAddress) || !userAddress2.match(regAddress)) {
			$('.pcw-address-check-text').removeClass('d-none');
			$('.pcw-address-check-text').css('color', 'red');
			$('.pcw-address-check-text').text('주소 형식에 맞게 입력하세요.');
			return;
		}
		
		// 우편번호, 주소지 상세주소 합침
		userAddress1 = '(' + userFindAddress + ')' + userAddress1;
		
		// 회원가입
		$.ajax({
			type: "POST"
			,url: "/user/join"
			,data: {
					"userId":userId,
					"userPw":userPw,
					"userName":userName,
					"userEmail":userEmail,
					"userPhoneNumber":userPhoneNumber,
					"userAddress1":userAddress1,
					"userAddress2":userAddress2
					}
			,success: function(data) {
				if (data.result == "success") {
					alert("가입을 환영합니다");				
					location.href="/user/sign_in";
				} else {
					alert("가입을 실패하였습니다 다시 시도해주세요.");
				}
			}
			, error: function(error) {
				alert(error_message);
			}
		});
	});
});

</script>