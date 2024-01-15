function repleControlInert(obj) {
	$('#repleForm').attr('action', 'repleInsert.jsp');
	$('#seq').attr('value', obj);
	$('#repleForm').submit();
}

function repleControlUpdate(obj) {
	var result = confirm("수정하시겠습니까?")
	if(result){
		$('#repleForm').attr('action', 'repleInsert.jsp');
		$('#seq').attr('value', obj);
		$('#repleForm').submit();
	}
}

function repleControlDelete(obj) {
	var reseult = confirm("삭제하시겠습니까?")
	if(reseult){
		$('#repleForm').attr('action', 'repleInsert.jsp');
		$('#seq').attr('value', obj);
		$('#repleForm').submit();
	}
}