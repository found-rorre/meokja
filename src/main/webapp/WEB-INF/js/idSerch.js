function idSerch(){
	let name = $('input[name=name]').val();
	let jumin1 = $('#jumin1').val().trim();
	let jumin2 = $('#jumin2').val().trim();
	
	
	let jumin = jumin1 + jumin2;
	$('input[name=jumin]').val(jumin);
	
	
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
	
	let sum = 0;
	for (let i=0; i<12; i++){
		sum += jumin.charAt(i) * (i % 8 + 2);
	}
	
	let result = (11 - sum % 11) % 10;
	
	if(result != jumin.charAt(12)) {
		alert('잘못된 주민번호 입니다.');
		return false;
	}
	
}