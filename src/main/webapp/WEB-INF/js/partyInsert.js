/*==================현재 시간 찍어주는 코드 ===================*/

$(() =>{
   let now = new Date();
   let currentHour = now.getHours();
   let currentMinute = now.getMinutes();

   let hour = String(currentHour).padStart(2, "0");
   let minute = String(currentMinute).padStart(2, "0");

   $('input[name=dateObject2]').val(`${hour}:${minute}`);
   
});

// 파일 업로드 함수 시작
	function photoView(event) {
		$('#output').attr('src', URL.createObjectURL(event.target.files[0]));
	}
	
	function updateValue(value) {
	    document.getElementById("limitValue").textContent = value;
	}
	
	
	function photoView(event) {
	   $('#output').attr('src', URL.createObjectURL(event.target.files[0]));
	}
	function updateValue(value) {
	    document.getElementById("limitValue").textContent = value;
	}
// 파일 업로드 함수 끝

/*=================날짜 제한 시작 ===========================*/

function dateOK() {
  let mealDate = $('input[name=dateObject1]');
  let today = new Date();
  // 선택한 날짜가 오늘 이전인 경우
    let minDate = new Date(today);
    minDate.setDate(minDate.getDate()); // 전날을 선택할 수 없도록 설정

    let year = minDate.getFullYear();
    let month = String(minDate.getMonth() + 1).padStart(2, "0");
    let day = String(minDate.getDate()).padStart(2, "0");
    let minDateString = `${year}-${month}-${day}`;
    
    mealDate.attr('min', minDateString);
   
}
/*=================날짜 제한 끝 ===========================*/


/*=================시간 체크 시작===========================*/
function timeOK() {
   let mealTime = $('input[name=dateObject2]');
   let now = new Date();

   let currentHour = now.getHours();
   let currentMinute = now.getMinutes();
   let hour = String(currentHour).padStart(2, "0");
   let minute = String(currentMinute).padStart(2, "0");

   let selectedHour = parseInt(mealTime.val().split(':')[0]);
   let selectedMinute = parseInt(mealTime.val().split(':')[1]);

   let mealDate = $('input[name="dateObject1"]');
   let selectedDate = new Date(mealDate.val());

   if (selectedDate.toDateString() === now.toDateString()) {
      if (selectedHour < currentHour) {
         alert('시간을 다시 선택해주세요');
         mealTime.val(`${hour}:${minute}`);
      } else if (selectedHour === currentHour && selectedMinute < currentMinute) {
         alert('시간을 다시 선택해주세요');
       	 mealTime.val(`${hour}:${minute}`);
      }
   } 
}
/*=================시간 체크 끝===========================*/

/*================입력 체크 시작 =============================*/
function partyInsertOK (){
   
   let subject =  $('input[name=party_subject]').val();
   let map = $('input[name=map]').val();
   let contents = $('textarea[name=contents]').val();
   let food_category = $('select').eq(0).val();
   let local_category = $('select').eq(1).val();
   let limitNum = $('input[name=limitNum]').val();
   let mealed_at = $('input[name=dateObject1]').val();
   let fileName = $('input[name=fileName]').val();
   let pattern = new RegExp('^[0-9]+$');
   
   
   if(fileName == ''){
      alert('사진을 선택하세요');
      return false;
   }
   
   if(subject.length == 0 || subject == ''){
      alert('파티 이름을 입력하세요');
      return false;
   }
   if(map.length == 0 || map == ''){
      alert('장소를 입력하세요');
      return false;
   }
   
   if(contents.length == 0 || contents == ''){
      alert('내용을 입력하세요');
      return false;
   }
   if(food_category == '음식 카테고리'){
      alert('음식 카테고리를 선택하세요');
      return false;
   }
   
   if(local_category == '전국') {
      alert('지역을 선택하세요');
      return false;
   }
   
   if(limitNum.length == 0 || limitNum == '') {
      alert('인원을 선택하세요');
      return false;
   }
   if(mealed_at.length == 0 || mealed_at == '') {
      alert('날짜를 선택하세요');
      return false;
   }
   
   if (!pattern.test(limitNum)) {
     alert('인원은 숫자만 입력하세요');
     return false;
   }
   
}