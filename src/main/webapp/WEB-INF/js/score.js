$(() => {
	$('.star').click((context) => {
		// 클릭한 별 요소
		const target_star = $(context.currentTarget);
		// 클릭한 별 형제 요소들 
		const stars = [...target_star.parent().children()];
		
		// 클릭한 별의 인덱스
		const star_index = $(stars).index(target_star);
		
		
		const emptyStar_class = "star bi bi-star";
		const fullStar_class = "star bi bi-star-fill";

		// 빈 별이라면
		if(target_star[0].className == emptyStar_class) {
			for(var i = 0; i <= star_index; ++i) {
				stars[i].className = fullStar_class;
			}
		// 채워진 별이라면
		} else {
			for(var i = 4; i >= star_index; --i) {
				if(star_index == 0) {
					break;
				}
				stars[i].className = emptyStar_class;
			}
		}
	})
});


$(() => {
	$('#score_btn').click(() => {
		
		const party_id = $('#score_btn').data("party_id");	
		
		var data = {
			party_id: party_id, 
			member_id: [],
			score: []
				
		};
		const id_list = $('.member_id');
		const boxs = $('.star-container');
		
		$.each(boxs, (index, box) => {
			const fullStar_list = $(box).children('.fas');
			
			data.score.push(fullStar_list.length);
			data.member_id.push(id_list.eq(index).val());
		});
		
		console.log(data);
		
		
		const url = '/meokja/score';
		
		fetch(url, {
			method: "POST",
			headers: {
				"Content-Type": "application/json",
			},
			body: JSON.stringify(data),
		})
		.then(response => {
			return response.json();
		})
		.then(json => {
			console.log(json);
			if(json.result == "success") {
				alert(json.message);
				location.href = '/meokja/mylist';
			}
		})
	});
		
		
		
		
		
		
		
	
});
	
	
	




