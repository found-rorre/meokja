function passwordCheck() {
	let passwordChk = $('input[name=passwordChk]').val();
	let originPassword = $('input[name=originPassword]').val();
	
	if(passwordChk.length == 0 || passwordChk == '') {

		alert('비밀번호를 입력하세요');
		return false;
	}
	
	if (passwordChk.trim() != originPassword.trim()) {
	   alert('현재 비밀번호가 일치하지 않습니다.');
	   return false;
	}
}