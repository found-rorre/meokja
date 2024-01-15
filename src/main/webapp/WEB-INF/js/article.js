//	방장의 승인 및 거절 버튼 확인 메시지
function join(word, party_id, currentPage, join_id, limitNum, count){
   var result = confirm(word + "하시겠습니까?");
   if(result){
      if(word =="승인"){
         location.href = "joinOK?party_id=" +party_id+ "&currentPage=" +currentPage+ "&join_id=" +join_id+ "&limitNum=" +limitNum+ "&count=" +count;
      } else if(word =="거절"){
         location.href = "joinNO?party_id=" +party_id+ "&currentPage=" +currentPage+ "&join_id=" +join_id;
      } else if(word =="파티 취소"){
         location.href = "joinCancel?party_id=" +party_id+ "&currentPage=" +currentPage+ "&join_id=" +join_id;
      }
   }
}

const joinChk = () => {
	let contents = $('textarea[name=contents]').val();
    console.log(contents);
     
    if(contents.length == 0 || contents == ''){
    	alert('내용을 입력하a세요.');
        return false;
	}
}



$(() => {
	let party_id = $('input[name=party_id]').val();
	
//	참여자인지 확인
	$.ajax({
    	type: "post",             // 요청 방식
    	url: "joinCHK",      // 요청할 서블릿
    	data: {   				// 서블릿으로 전송할 데이터
    		"party_id" : party_id
	},
	dataType: "text",
	success: res => {
    	console.log('요청 성공: '+ res);
           
        if(res != '0'){
        	$('#join_box').attr('hidden', 'hidden');
        	$('#back_btn').removeAttr('hidden');
        }
	},
    error: e => console.log('요청 실패: ', e.status)
	});
	
	$('#report_btn').click((context) => {
		
		var is = confirm('신고하시겠습니까?');
		
		if(is) {
			var target = $(context.currentTarget);
			
			var formElm = target.closest("form");
			
			formElm.attr('action', 'reportInsert');
			formElm.removeAttr('onsubmit');
			formElm.submit();
		}
	});
	
	
	
});
















