$(() => {
	
})


function test() {
	var count = $('#count').val();
	console.log(count);
	
	var scoreList = [];
	for (var i = 0; i < count; i++) {
		var scoreId = $(`input[name=scoreId${i}]`).val();
		var manner = $(`input[name=manner${i}]`).val();
		var promise = $(`input[name=promise${i}]`).val();
		var clean = $(`input[name=clean${i}]`).val();

		console.log(scoreId);
		console.log(manner);
		console.log(promise);
		console.log(clean);
		
		$.ajax({
			type: "post",				// 요청 방식
			url: "scoreServlet",		// 요청할 서블릿
			data: { 					// 서블릿으로 전송할 데이터
				"scoreId": scoreId,		// 변수명: 값
				"manner": manner,
				"promise": promise,
				"clean": clean		
			},
			dataType: "text",
			success: res => {
				console.log('요청 성공: '+ res);
			},
			error: e => {
				console.log('요청 실패: ', e.status)
			}
			
		});
	}
	
	/*
	data: { 					// 서블릿으로 전송할 데이터
		"scoreId": scoreId,		// 변수명: 값
		"manner": manner,
		"promise": promise,
		"clean": clean		
	},
	*/
}

