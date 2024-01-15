$(() => {
	$('.score_box').click((context) => {
		var target = $(context.currentTarget);
		console.log(target);
		target.submit();
	})
	
	
});