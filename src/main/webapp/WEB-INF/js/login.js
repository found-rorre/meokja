function formCheck() {
	
	let member_id = $('input[name=member_id]').val().trim();
	let pw = $('input[name=pw]').val().trim();
	
	if(member_id == null || member_id.length == 0){
		alert('아이디를 입력해주세요.');
		return false
	}
	if(pw == null || pw.length == 0){
		alert('비밀번호를 입력해주세요.');
		return false
	}
	
}


$(() => {
    let savedUsername = getCookie("userId");
    if (savedUsername) {
        $("#userId").val(savedUsername);
        $("#idSave").prop("checked", true);
    }
});

// 쿠키 설정 함수
function setCookie(name, value, days) {
    var expires = "";
    if (days) {
        var date = new Date();
        date.setTime(date.getTime() + (days * 24 * 60 * 60 * 1000));
        expires = "; expires=" + date.toUTCString();
    }
    document.cookie = name + "=" + (value || "") + expires + "; path=/";
}

// 쿠키 가져오기 함수
function getCookie(name) {
    var nameEQ = name + "=";
    var cookies = document.cookie.split(";");
    for (var i = 0; i < cookies.length; i++) {
        var cookie = cookies[i];
        while (cookie.charAt(0) == " ") {
            cookie = cookie.substring(1, cookie.length);
        }
        if (cookie.indexOf(nameEQ) == 0) {
            return cookie.substring(nameEQ.length, cookie.length);
        }
    }
    return null;
}

// 로그인 함수
function login() {
    var usernameInput = $("#userId");
    var username = usernameInput.val();
    var idSaveCheckbox = $("#idSave");
    var isChecked = idSaveCheckbox.is(":checked");

    if (username) {
        if (isChecked) {
            setCookie("userId", username, 30); // 30일 동안 쿠키 저장
        } else {
            setCookie("userId", "", -1); // 쿠키 삭제
        }
    } 
 }
 function loginCheck (){
	alert('로그인이 필요한 서비스입니다.');
	
}
