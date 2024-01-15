function passwordChange() {
	let password1 = $('#password').val();
	let password2 = $('#password2').val();
	
	if(password1.length == 0 || password1 == '') {
		alert('비밀번호를 입력하세요');
		return false;
	}
	
	if(password2.length == 0 || password2 == '') {
		alert('비밀번호를 입력하세요');
		return false;
	}
		
	if (password1.trim() != password2.trim()) {
	   alert('비밀번호가 일치하지 않습니다.');
	   return false;
	}
	
}

function passwordCheck() {
	let password1 = $('input[name=password]').val();
	let password2 = $('input[name=password2]').val();
	
	if(password1.length == 0 || password1 == '' || 
		password2.length == 0 || password2 == '' ) {

		alert('비밀번호를 입력하세요');
		return false;
	}
	
	if (password1.trim() != password2.trim()) {
	   alert('변경할 비밀번호 서로 일치하지 않습니다.');
	   return false;
	}
}