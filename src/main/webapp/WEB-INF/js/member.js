// 파일 업로드 함수
function photoView(event) {
	$('#output').attr('src', URL.createObjectURL(event.target.files[0]));
}

function updateValue(value) {
    document.getElementById("limitValue").textContent = value;
}

function photoView(event) {
   $('#output').attr('src', URL.createObjectURL(event.target.files[0]));
}

function updateValue(value) {
    document.getElementById("limitValue").textContent = value;
}


//	이메일 입력 ===================================
function selectEmail() {
	$('input[name=email2]').val($('select').val());
	   
	if($('select').eq(0).val() == '직접 입력하기'){
		$('input[name=email2]').val('');
		$('input[name=email2]').attr('type', 'text');
	    $('input[name=email2]').focus();
	}else {
		$('input[name=email2]').attr('type', 'hidden');
	}
	
}

//	아이디 유효성 검사 함수    안내 수준
//	================================================================================
function idCheck() {
	let member_id = $('#member_id').val().trim();
	let pattern1 = new RegExp('(?=.*[0-9]+)(?=.*[a-z]+)');	// 숫자와 소문자가 1개이상 들어갔는가?
	let pattern2 = new RegExp('[^a-z0-9]+');				// 소문자와 숫자만 들어갔는가?
	
	$('#IDCheckOK').val('NO');	
	if(member_id.length == 0) {
		console.log('확인');
		$('#idChkMessage1').html('');
		$('#idChkMessage2').html('');
		return false;
	}
	
	if (pattern2.test(member_id)) {
		console.log('소문자와 숫자');
		$('#idChkMessage1').html('소문자와 숫자만 입력하세요.');
		$('#idChkMessage2').html('');
		return false;
	}
	$('#idChkMessage1').html('');
	$('#idChkMessage2').html('');
	
	if (!pattern1.test(member_id)) {
		$('#idChkMessage1').html('영소문자, 숫자 각각 1개 이상 포함되어야 합니다.');
		$('#idChkMessage2').html('');
		return false;
	}
	$('#idChkMessage1').html('');
	$('#idChkMessage2').html('');
	
	if(member_id.length <= 6 || member_id.length >= 20) {
		$('#idChkMessage1').html('6자이상 20자이하로 입력하세요');
		$('#idChkMessage2').html('');
		return false;
	}
	$('#idChkMessage1').html('');
	$('#idChkMessage2').html('');
	
	$.ajax({
		type: "post",				// 요청 방식
		url: "memberServlet",		// 요청할 서블릿
		data: { 					// 서블릿으로 전송할 데이터
			"member_id" : member_id				// 변수명: 값
		},
		dataType: "text",
		success: res => {
            console.log('요청 성공: '+ res);
            
            switch (res) {
               
               case '0':
                  $('#idChkMessage1').html('');
                  $('#idChkMessage2').html('사용 가능한 아이디 입니다.');
                  $('#IDCheckOK').val('YES');
                  break;
               case '1':
                  $('#idChkMessage1').html('중복된 아이디 입니다.');
                  $('#idChkMessage2').html('');
                  break;
            }
            
         },
         error: e => console.log('요청 실패: ', e.status)
         
	});
    return true;
}

//	비밀번호 유효성 검사 함수
//	================================================================================

//	비밀번호 유호성 검사
function pwdCheck1() {
	let password = $('#pw').val().trim();
	let pattern1 = new RegExp('(?=.*[0-9]+)(?=.*[a-zA-Z]+)(?=.*[!@#$%^&]+)');
	let pattern2 = new RegExp('[^a-zA-Z0-9!@#$%^&]+');
	
	if(password.length == 0) {
		$('#pwdChkMessage1').html('');
		return false;
	}
	$('#pwdChkMessage1').html('');
	
	if (pattern2.test(password)) {
		$('#pwdChkMessage1').html('특수문자는 ! @ # $ % ^ & 만 입력가능합니다.');
		return false;
	}
	$('#pwdChkMessage1').html('');

	if (!pattern1.test(password)) {
		$('#pwdChkMessage1').html('영문자, 숫자, 특수문자가 각각 1개 이상 포함되어야 합니다.');
		return false;
	}
	$('#pwdChkMessage1').html('');
	
	if(password.length < 8 || password.length > 16) {
		$('#pwdChkMessage1').html('8자이상 16자이하로 입력하세요');
		return false;
	}
	$('#pwdChkMessage1').html('');
	
    return true;
}

//	비밀번호와 비밀번호 확인 일치 검사
function pwdCheck2() {
	let password1 = $('#pw').val();
	let password2 = $('#pw2').val();

	if(password2.length == 0) {
		$('#pwdChkMessage2').html('');
		return false;
	}	
	if (password1.trim() != password2.trim()) {
	   $('#pwdChkMessage2').html('비밀번호가 일치하지 않습니다.');
	   return false;
	}
	$('#pwdChkMessage2').html('');
	
	return true;
}

//	form check 
//	================================================================================
function formCheck() {

	let j1 = $('input[name=jumin1]').val().trim();
	let j2 = $('input[name=jumin2]').val().trim();
	let email1 = $('input[name=email1]').val().trim();
	let email2 = $('input[name=email2]').val().trim();
	let phone1 = $('#phone').val().trim();	
	let phone2 = $('select').eq(1).val();
	let member_id = $('#member_id').val().trim();
	let pw = $('#pw').val().trim();
	let pw2 = $('#pw2').val().trim();
	let name = $('#name').val().trim();
	let nickname = $('input[name=nickname]').val().trim();
	
	let address = $('#address').val().trim();
	let detailAddress = $('#detailAddress').val().trim();
	
	let jumin = j1 + j2;
	let email = email1 + '@' + email2;
	let phone = phone2 + phone1;
	
	$('input[name=jumin]').val(jumin);
	$('input[name=email]').val(email);
	$('input[name=phone]').val(phone);
	$('input[name=address]').val(address +" "+ detailAddress);
	
//	공백 체크 ===================================
	if(member_id.length == 0 || member_id == ''){
		$('#messageContent').html('아이디를 입력하세요');
		$('#messageModal').modal('show');
		return false;
	}
	if(pw.length == 0 || pw == '' ){
		$('#messageContent').html('비밀번호를 입력하세요');
		$('#messageModal').modal('show');
		return false;
	}
	if(pw2.length == 0 || pw2 == '' ){
		$('#messageContent').html('비밀번호를 입력하세요');
		$('#messageModal').modal('show');
		return false;
	}
	if(j1.length == 0 || j2 == '' ){
		$('#messageContent').html('주민등록번호를 입력하세요');
		$('#messageModal').modal('show');
		return false;
	}
	if(email1.length == 0 || email1 == '' ){
		$('#messageContent').html('이메일을 입력하세요');
		$('#messageModal').modal('show');
		return false;
	}
	if(email2.length == 0 || email2 == '' ){
		$('#messageContent').html('이메일을 입력하세요');
		$('#messageModal').modal('show');
		return false;
	}
	if(name.length == 0 || name == ''){
		$('#messageContent').html('이름을 입력하세요');
		$('#messageModal').modal('show');
		return false;
	}
	if(nickname.length == 0 || name == ''){
		$('#messageContent').html('닉네임을 입력하세요');
		$('#messageModal').modal('show');
		return false;
	}
	if(phone.length == 0 || phone == ''){
		$('#messageContent').html('휴대폰 번호를 입력하세요');
		$('#messageModal').modal('show');
		return false;
	}
	if(address.length == 0 || address == ''){
		$('#messageContent').html('주소를 입력하세요');
		$('#messageModal').modal('show');
		return false;
	}
	if(detailAddress.length == 0 || detailAddress == ''){
		$('#messageContent').html('상세주소를 입력하세요');
		$('#messageModal').modal('show');
		return false;
	}
	
//	주민 번호 유효성 검사 ===================================

	if(isNaN(j1) || isNaN(j2)) {
		$('#messageContent').html('잘못된 주민등록번호 입니다.');
		$('#messageModal').modal('show');
		return false
	}
	
	let sum = 0;
	for (let i=0; i<12; i++){
		sum += jumin.charAt(i) * (i % 8 + 2);
	}
	
	let result = (11 - sum % 11) % 10;
	
	if(result != jumin.charAt(12)) {
		$('#messageContent').html('잘못된 주민등록번호 입니다.');
		$('#messageModal').modal('show');
		return false;
	}

//	성별 나이 체크 ===================================
	let date = new Date();

	let year = j1.substr(0,2);
	console.log(year);
	let currentYear = date.getFullYear();
	console.log(currentYear);
		let gender = j2.charAt(0);
	
	if (gender == '1' || gender == '3' || gender == '5') {
		$('input[name=gender]').val('남자');
	} else if (gender == '2' || gender == '4' ||  gender == '6') {
		$('input[name=gender]').val('여자');
	}
	
	if (gender == '1' || gender == '2' || gender == '5') {
		year = parseInt(year) + 1900;
	} else if (gender == '3' || gender == '4' ||  gender == '6') {
		year = parseInt(year) + 2000;
	}
	let age = currentYear - year + 1;
	$('input[name=age]').val(age);
	

//	아이디 비밀번호 체크 ==============================

	if(!idCheck()){
		return false;
	}
	if(!pwdCheck1()){
		return false;
	}
	if(!pwdCheck2()){
		return false;
	}
	
}


// 다음 주소 API
function execDaumPostcode() {
    new daum.Postcode({
        oncomplete: function(data) {
        	// 주소창 초기화
        	document.getElementById("address").value = '';
            // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

            // 각 주소의 노출 규칙에 따라 주소를 조합한다.
            // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
            var addr = ''; // 주소 변수
            var extraAddr = ''; // 참고항목 변수
            
            //사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
            if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
                addr = data.roadAddress;
            } else { // 사용자가 지번 주소를 선택했을 경우(J)
                addr = data.jibunAddress;
            }

            // 사용자가 선택한 주소가 도로명 타입일때 참고항목을 조합한다.
            if(data.userSelectedType === 'R'){
                // 법정동명이 있을 경우 추가한다. (법정리는 제외)
                // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
                if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
                    extraAddr += data.bname;
                }
                // 건물명이 있고, 공동주택일 경우 추가한다.
                if(data.buildingName !== '' && data.apartment === 'Y'){
                    extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
                }
                // 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
                if(extraAddr !== ''){
                    extraAddr = ' (' + extraAddr + ')';
                    // 조합된 참고항목을 주소변수에 넣는다.
                    addr += extraAddr;
                }
            }

            // 우편번호와 주소 정보를 해당 필드에 넣는다.
            document.getElementById('postcode').value = data.zonecode;
            document.getElementById("address").value = addr;
            // 커서를 상세주소 필드로 이동한다.
            document.getElementById("detailAddress").value = '';
            document.getElementById("detailAddress").focus();
        }
    }).open();
}


function loginCheck (){
	alert('로그인이 필요한 서비스입니다.');
	
}
