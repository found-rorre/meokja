function loginCheck(page) {
    var user = window.user; // 변수 mo는 JSP 파일에서 전달됩니다.
	

	if (user == null || user == "") {
        alert("로그인이 필요한 서비스입니다.");
        location.href = "loginPage";
    } else if (page == 'partyInsert') {
        location.href = "partyInsertPage";
    } else if (page == 'mylist') {
        location.href = "mylist";
    }
    
}