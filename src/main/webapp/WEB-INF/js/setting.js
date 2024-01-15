function setting(idx, mode, title, name, content) {
	let frm = document.commentForm; // 댓글 폼을 저장한다.
//	수정 또는 삭제할 댓글 번호를 넣어준다. 댓글 입력 작업시는 0을 넣어줄다.
	frm.idx.value = idx;
//	commentOK.jsp에서 사용할 댓글 작업 모드를 넣어준다. 1 => 저장, 2 => 수정, 3 => 삭제
	frm.mode.value = mode;
//	submit 버튼에 표시할 텍스트를 넣어준다.
	frm.commentBtn.value = title;
//	수정 또는 삭제할 댓글 작성자 이름을 댓글 폼의 name 속성이 name인 텍스트 상자에 넣어준다.
	frm.name.value = name;
	
//	수정 또는 삭제할 댓글 내용을 댓글 폼의 name 속성이 content인 textarea에 넣어준다.
//	frm.content.value = content;
//	위와 같이 실행해서 처리가 되면 좋겠으나.... enter키(\r\n) 때문에 문제가 발생된다.

//	${co.content}를 인수로 넘기면 자바스크립트는 이스케이프 시퀀스(\r\n)가 포함된 데이터를 인수로 받을 수
//	없기 때문에 정상적으로 동작되지 않는다.
//	${content}는 \r\n이 입력된 부분을 브라우저에서 줄을 바꿔 출력하기 위해 <br/> 태그로 치환한 데이터가 
//	저장되어있고 이것을 인수로 넘겨받으면 <br/>이 문자열로 출력되므로 다시 \r\n으로 바꿔야 한다.

//	java나 jsp의 replace() 메소드는 모든 내용을 일괄적으로 치환하지만 자바스크립트의 replace() 함수는
//	맨 처음 1개만 치환을 한다.
//	frm.content.value = content.replace('<br/>', '\r\n');
//	위와 같이 코딩하면 최초의 <br/>만 \r\n으로 치환되고 나머지 <br/>은 그대로 출력된다.

//	인수로 넘어온 데이터에서 더 이상 <br/>이 없을때까지 반복하며 \r\n으로 치환한다.
	while (content.indexOf('<br/>') != -1) {
		content = content.replace('<br/>', '\r\n');
	}
	frm.content.value = content;
}























