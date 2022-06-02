<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<div class="order-layout">
	<div class="order-info-header">
		<div>
			<span class="order-info-header-title">주문/결제</span>
			<div class="order-seq">
				<div><span>장바구니</span></div>
				<div><i class='bx bx-chevron-right'></i></div>
				<div><span class="order-text">주문/결제</span></div>
				<div><i class='bx bx-chevron-right'></i></div>
				<div><span>완료</span></div>
			</div>
		</div>
	</div>
</div>
<div class="order-info-box">
	<div class="order-info-box-1">
		<div class="orderer-info-box info-box">
			<div class="order-info-title">
				<span>주문자 정보</span>
			</div>
			<div class="order-info-form-group">
				<label for="orderer">주문자</label> 
				<input type="text" id="orderer" value="${user.userName}" disabled>
			</div>
			<div class="order-info-form-group">
				<label for="ordererPhoneNumber">연락처</label> 
				<input type="text" id="ordererPhoneNumber" value="${user.userPhoneNumber}" disabled>
			</div>
			<div class="order-info-form-group">
				<label for="ordererEmail">이메일 주소</label> 
				<input type="text" id="ordererEmail" value="${user.userEmail}" disabled>
			</div>
			<c:set var="userAddress" value="${user.userAddress1}"/>
			<div class="order-info-form-group">
				<label for="ordererZipCode">주소</label> 
				<input type="text" id="ordererZipCode" value="${fn:substring(userAddress,1,6)}" disabled>
			</div>
			<div class="order-address-form-group">
				<label></label>
					<input type="text" id="ordererAddress1" class="order-address" value="${fn:substring(userAddress,7,fn:length(userAddress))}" placeholder="주소" disabled> 
					<input type="text" id="ordererAddress2" class="order-address" value="${user.userAddress2}" placeholder="상세주소" disabled>
			</div>
		</div>
		<div class="shipping-info-box info-box">
			<div class="order-info-title">
				<span>배송지 정보</span>
				<div class="shipping-check-box">
					<input type="checkbox" id="shippingInfoCheck"> 
					<label for="shippingInfoCheck"> 
						<i class='spipping-checkbox order-check'></i> 
						<i class='bx bxs-check-square order-check-square d-none'></i> 
						주문자 정보동일
					</label>
				</div>
			</div>
			<div class="order-info-form-group">
				<label for="receiver">수령인</label> 
				<input type="text" id="receiver" value="" placeholder="수령인을 입력하세요.">
			</div>
			<div class="order-info-form-group">
				<label for="shippingPhoneNumber">연락처</label> 
				<input type="text" id="shippingPhoneNumber" value="" placeholder="'-'없이 입력하세요." maxlength="13">
			</div>
			<div class="order-address-form-group">
				<label for="findAddress">배송지 주소</label>
				<input type="text" id="findAddress" value="" placeholder="우편번호" maxlength="5">
					<button type="button" id="findAddressBtn" class="find-address-btn">우편번호 찾기</button>
			</div>
			<div class="order-address-form-group">
				<label></label>
				<input type="text" id="address1" class="order-address" value="" placeholder="주소"> 
				<input type="text" id="address2" class="order-address" placeholder="상세주소">
			</div>
		</div>
		<div class="order-payment-box info-box">
			<div class="order-info-title">
				<span>결제수단</span>
			</div>
			<div class="order-payment-btn-box">
				<button type="button" id="cardBtn" class="card-btn active">신용/체크카드</button>
				<button type="button" id="cashBtn" class="card-btn">무통장 입금</button>
			</div>
			<div>
				<ul class="card-list">
					<li><a href="#"><span class="ico_hyundai"></span><span class="card-text">현대카드</span></a></li>
					<li><a href="#"><span class="ico_kb"></span><span class="card-text">kB 국민카드</span></a></li>
					<li><a href="#"><span class="ico_shinhan"></span><span class="card-text">신한카드</span></a></li>
					<li><a href="#"><span class="ico_samsung"></span><span class="card-text">삼성카드</span></a></li>
					<li><a href="#"><span class="ico_lotte"></span><span class="card-text">롯데카드</span></a></li>
					<li><a href="#"><span class="ico_woori"></span><span class="card-text">우리카드</span></a></li>
					<li><a href="#"><span class="ico_hana"></span><span class="card-text">하나카드</span></a></li>
					<li><a href="#"><span class="ico_bc"></span><span class="card-text">비씨카드</span></a></li>
					<li><a href="#"><span class="ico_nh"></span><span class="card-text">NH농협카드</span></a></li>
					<li><a href="#"><span class="ico_citi"></span><span class="card-text">씨티카드</span></a></li>
					<li><a href="#"><span class="ico_kakao"></span><span class="card-text">카카오뱅크</span></a></li>
				</ul>
				<ul class="cash-list d-none">
					<li><a href="#"><span class="ico_kb"></span><span class="cash-text">국민은행</span></a></li>
					<li><a href="#"><span class="ico_woori"></span><span class="cash-text">우리은행</span></a></li>
					<li><a href="#"><span class="ico_shinhan"></span><span class="cash-text">신한은행</span></a></li>
					<li><a href="#"><span class="ico_hana"></span><span class="cash-text">하나은행</span></a></li>
					<li><a href="#"><span class="ico_nh"></span><span class="cash-text">농협은행</span></a></li>
					<li><a href="#"><span class="ico_busan"></span><span class="cash-text">부산은행</span></a></li>
					<li><a href="#"><span class="ico_standard"></span><span class="cash-text">제일은행</span></a></li>
				</ul>
			</div>
		</div>
	</div>
	<div class="order-info-box-2">
		<div class="order-total-box">
			<div class="order-info-title">
				<span>주문상품</span><span>1</span><span>개</span>
			</div>
			<div>
				<span class="order-seller-text">쿠팡</span>
			</div>
			<div class="order-prod-info-box">
				<a href="#"> 
					<img src="http://img.danawa.com/prod_img/500000/232/168/img/13168232_2.jpg?shrink=330:330&_v=20210323151933" alt="" width="110px">
				</a>
				<div>
					<a href="#"> <span class="order-prod-name">SK하이닉스 Gold S31 (1TB)</span>
					</a>
					<div class="order-prod-price-and-quantity-box">
						<div class="order-prod-price-box">
							<span class="order-prod-price">126,000</span><span>원</span>
						</div>
						<div>
							<span>/</span>
						</div>
						<div class="order-prod-quantity-box">
							<span>1</span><span>개</span>
						</div>
					</div>
				</div>
			</div>
			<div class="order-delivery-box">
				<span>배송비</span><span>무료배송</span>
			</div>
			<div class="order-prod-payment-box">
				<div>
					<span>상품금액</span>
					<div>
						<span>126,000</span><span>원</span>
					</div>
				</div>
				<div>
					<div>
						<span>할인금액</span><i class='bx bx-chevron-down'></i>
					</div>
					<div>
						<span>-290</span><span>원</span>
					</div>
				</div>
				<div>
					<span>배송비</span>
					<div>
						<span>0</span><span>원</span>
					</div>
				</div>
			</div>
			<div class="order-price-total-box">
				<span>총 결제금액</span>
				<div>
					<span>125,710</span> <span>원</span>
				</div>
			</div>
			<button id="paymentBtn" class="payment-btn">결제하기</button>
		</div>
		<div class="order-agree-box">
			<div class="order-all-check-box">
				<input type="checkbox" id="orderAllCheck"> 
				<label for="orderAllCheck"> 
					<i class='order-check order-all-check-ico'></i> 
					<i class='bx bxs-check-square order-all-check-square-ico d-none'></i>
					<span class="order-essential-text">전체동의</span>
					<span class="order-all-check-14-text">만 14세 이상만 구매가능합니다.</span>
				</label>
			</div>
			<div class="order-check-box mt-2">
				<input type="checkbox" id="orderCheck1"> 
				<label for="orderCheck1"> 
					<i class='order-check order-all-check-ico order-check-ico-1'></i> 
					<i class='bx bxs-check-square order-all-check-square-ico order-check-square-ico-1 d-none'></i>
					<div>
						<span class="order-essential-text">필수</span>
						<span class="order-check-text">개인정보 수집 및 이용동의</span>
					</div>
				</label>
				<button>
					자세히<i class='bx bx-chevron-down'></i>
				</button>
			</div>
			<div class="order-check-box">
				<input type="checkbox" id="orderCheck2"> 
				<label for="orderCheck2"> 
				<i class='order-check order-all-check-ico order-check-ico-2'></i> 
				<i class='bx bxs-check-square order-all-check-square-ico order-check-square-ico-2 d-none'></i>
					<div>
						<span class="order-essential-text">필수</span>
						<span class="order-check-text">개인정보 제3자 제공동의</span>
					</div>
				</label>
				<button>
					자세히<i class='bx bx-chevron-down'></i>
				</button>
			</div>
			<div class="order-check-box">
				<input type="checkbox" id="orderCheck3"> 
				<label for="orderCheck3"> 
				<i class='order-check order-all-check-ico order-check-ico-3'></i> 
				<i class='bx bxs-check-square order-all-check-square-ico order-check-square-ico-3 d-none'></i>
					<div>
						<span class="order-essential-text">필수</span>
						<span class="order-check-text">전자금융거래 약관동의</span>
					</div>
				</label>
				<button>
					자세히<i class='bx bx-chevron-down'></i>
				</button>
			</div>
		</div>
	</div>
</div>
<script>
$(document).ready(function() {
    // 배송지 정보 -> 주문자 정보와 동일 이벤트
    $('#shippingInfoCheck').on('change', function() {
        let orderer = $('#orderer').val();
        let phoneNumber = $('#ordererPhoneNumber').val();
        let ordererZipCode = $('#ordererZipCode').val();
        let ordererAddress1 = $('#ordererAddress1').val();
        let ordererAddress2 = $('#ordererAddress2').val();
        
        if ($(this).is(':checked') == true) {
            $('#receiver').val(orderer);
            $('#shippingPhoneNumber').val(phoneNumber);
            $('#findAddress').val(ordererZipCode);
            $('#address1').val(ordererAddress1);
            $('#address2').val(ordererAddress2);
            $('.order-check-square').removeClass('d-none');
            $('.spipping-checkbox').addClass('d-none');
        } else {
            $('#receiver').val('');
            $('#shippingPhoneNumber').val('');
            $('#findAddress').val('');
            $('#address1').val('');
            $('#address2').val('');
            $('.order-check-square').addClass('d-none');
            $('.spipping-checkbox').removeClass('d-none');
        }
    });

    $('#shippingPhoneNumber').on('input', function() { 
	    $(this).val($(this).val().replace(/[^0-9]/g, "").replace(/(^02|^0505|^1[0-9]{3}|^0[0-9]{2})([0-9]+)?([0-9]{4})$/,"$1-$2-$3").replace("--", "-") ); 
    });

    // 우편번호 정규식
    const regZipCode = /^[0-9]+$/;
    $('#findAddress').on('input', function() {
        let findAddress = $('#findAddress').val().trim();
        if(!findAddress.match(regZipCode)) {
            $(this).val($(this).val().replace(/[^0-9]/g, ""));
            return;
        }
    });

    // 우편번호 찾기 버튼 클릭 이벤트
    $('#findAddressBtn').on('click', function() {
        new daum.Postcode({
        oncomplete: function(data) {
                $('#findAddress').val(data.zonecode);
                $('#address1').val(data.address);
                $('#address2').focus();
            }
        }).open();
    });

    $('.card-btn').on('click', function(e) {
        if (e.target.id == 'cardBtn') {
            $('.card-list').removeClass('d-none');
            $('.cash-list').addClass('d-none');
            $('#cardBtn').addClass('active');
            $('#cashBtn').removeClass('active');
            $('.cash-list > li').removeClass('active');
            
        } else if (e.target.id == 'cashBtn') {
            $('.card-list').addClass('d-none');
            $('.cash-list').removeClass('d-none');
            $('#cardBtn').removeClass('active');
            $('#cashBtn').addClass('active');
            $('.card-list > li').removeClass('active');
        }
    });

    $('.card-list > li').on('click', function(e) {
        e.preventDefault();
        $('.card-list > li').addClass('active');
        $(this).siblings().removeClass('active'); 
    });

    $('.cash-list > li').on('click', function(e) {
        e.preventDefault();
        $('.cash-list > li').addClass('active');
        $(this).siblings().removeClass('active'); 
    });
    
    // 전체동의 이벤트 
    $('#orderAllCheck').on('change', function() {
        if($('#orderAllCheck').prop('checked')) {
            $('.order-all-check-ico').addClass('d-none');
            $('.order-all-check-square-ico').removeClass('d-none');
            $('#orderCheck1').prop('checked', true);
            $('#orderCheck2').prop('checked', true);
            $('#orderCheck3').prop('checked', true);
        } else {
            $('.order-all-check-ico').removeClass('d-none');
            $('.order-all-check-square-ico').addClass('d-none');
            $('#orderCheck1').prop('checked', false);
            $('#orderCheck2').prop('checked', false);
            $('#orderCheck3').prop('checked', false);
        }
    });

    $('#orderCheck1').on('change', function() {
        if($('#orderCheck1').prop('checked')) {
            $('.order-check-ico-1').addClass('d-none');
            $('.order-check-square-ico-1').removeClass('d-none');
         } else {
            $('.order-check-ico-1').removeClass('d-none');
            $('.order-check-square-ico-1').addClass('d-none');
         } 
    });

    $('#orderCheck2').on('change', function() {
        if($('#orderCheck2').prop('checked')) {
            $('.order-check-ico-2').addClass('d-none');
            $('.order-check-square-ico-2').removeClass('d-none');
         } else {
            $('.order-check-ico-2').removeClass('d-none');
            $('.order-check-square-ico-2').addClass('d-none');
         } 
    });

    $('#orderCheck3').on('change', function() {
        if($('#orderCheck3').prop('checked')) {
            $('.order-check-ico-3').addClass('d-none');
            $('.order-check-square-ico-3').removeClass('d-none');
         } else  {
            $('.order-check-ico-3').removeClass('d-none');
            $('.order-check-square-ico-3').addClass('d-none');
         } 
    });

    // 유효성 검사 
    $('#paymentBtn').on('click', function() {
        let receiver = $('#receiver').val();
        let phoneNumber = $('#shippingPhoneNumber').val();
        let findAddress = $('#findAddress').val();
        let address1 = $('#address1').val();
        let address2 = $('#address2').val();
        
        if (receiver.length < 1) {
            alert('수령인을 입력하세요.');
            $('#receiver').focus();
            return;
        } 
        if (phoneNumber.length < 1) {
            alert('연락처를 입력하세요.');
            $('#shippingPhoneNumber').focus();
            return;
        }

        if (findAddress.length < 1) {
            alert('우편번호를 입력하세요.');
            $('#findAddress').focus();
            return;
        }

        if (address1.length < 1) {
            alert('주소를 입력하세요.');
            $('#shippingPhoneNumber').focus();
            return;
        }
        if (address2.length < 1) {
            alert('주소를 입력하세요.');
            return;
        }

        if (!$('.card-list > li').hasClass('active') && !$('.cash-list > li').hasClass('active')) {
            alert('결제수단을 선택하세요.');
            return;
        }

        if ($('#orderCheck1').is(':checked') == false || $('#orderCheck2').is(':checked') == false || $('#orderCheck3').is(':checked') == false) {
            alert('개인정보 수집 및 이용에 동의해주세요.');
            return;
        }
    });

});
</script>