function passwordSerch() {
	let member_id = $('input[name=member_id]').val().trim();
	let name = $('input[name=name]').val().trim();
	let jumin1 = $('#jumin1').val().trim();
	let jumin2 = $('#jumin2').val().trim();
	
	
	let jumin = jumin1 + jumin2;
	$('input[name=jumin]').val(jumin);
	
	
	if(member_id.length == 0 || member_id == ''){
		alert('아이디를 입력하세요');
		return false;
	}
	
	if(name.length == 0 || name == ''){
		alert('이름을 입력하세요');
		return false;
	}
	
	if(jumin.length == 0 || jumin == ''){
		alert('주민번호를 입력하세요');
		return false;
	}
	
	if(isNaN(jumin1) || isNaN(jumin2)) {
		alert('잘못된 주민번호 입니다.');
		return false
	}
	
}