<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>         <!-- jstl c -->
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>      <!-- jstl fmt -->
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>   <!-- jstl fn -->
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>내정보</title>

<!-- common -->
<meta name="viewport" content="width=device-width, initial-scale=1.0"/>			<!-- device-width -->
<link rel="icon" href="images/favicon.png">										<!--  favicon -->
<script type="text/javascript" src="common/jquery-3.7.0.js"></script>			<!-- jQury -->
<link rel="stylesheet" href="common/bootstrap/bootstrap.min.css">				<!-- bootstrap -->
<script src="common/bootstrap/bootstrap.min.js"></script>						<!-- bootstrap -->
<script src="common/bootstrap/popper.min.js"></script>							<!-- bootstrap -->
<script type="text/javascript" src="common/custom.js" defer="defer"></script>	<!-- template -->
<link rel="stylesheet" href="common/style.css"/>								<!-- template -->

<link rel="stylesheet" href="common/slick-carousel/slick-theme.css">			<!-- slick -->
<link rel="stylesheet" href="common/slick-carousel/slick.css">					<!-- slick -->
<script src="common/slick-carousel/slick.min.js"></script>						<!-- slick -->

<!-- private -->
<link rel="stylesheet" href="css/member.css"/>
<script type="text/javascript" src="js/myProfile.js"></script>
<script type="text/javascript" src="js/loginCheck.js" defer="defer"></script>

</head>
<body>

<!-- header -->
<jsp:include page="common/header.jsp"></jsp:include>

<!-- 메인 시작 -->
<section class="section-padding">
	<div class="container">
		<div class="row">
			<div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
				<div class="col-lg-12">
					<h3 class="mb-4 text-center">내 정보</h3>
<!-- form 시작 -->				
					<form class="bg-grey" action="myProfileOK" method="post" enctype="multipart/form-data" onsubmit="return formCheck()"
						style="padding: 10px 150px;">
						<!-- 프로필 사진 -->
						<div class="col-lg-12">
							<div class="row mb-3">	
						    	<div class="col-md-2"></div>
						    		<div class="col-md-8">
						         		<h5 class="mb-3 text-center">파일 업로드</h5>
						         		<input class="form-control" type="file" accept="image/*" name="fileName" onchange="photoView(event)"/>
						         		<input type="hidden" name="defaultImgCheck">
						      		</div>
						      	<div class="col-md-2"></div>
						   	</div>
						   	<div class="row mb-3">
								<div class="col-lg-12">
									<img id="output" class="img-fluid w-100" src="upload/memberphoto/${user.photo}" style="width: 350px; height: 350px;"/>
								</div>
								<div class="col-lg-12 text-center mt-5">
									<input class="btn btn-success" type="button" value="사진 초기화" onclick="defaultImg()"/>
								</div>
						   	</div>
						</div>
						<!-- 아이디 -->
						<div class="col-lg-12">
							아이디
							<input id="member_id" name="member_id" class="form-control" type="text" value="${user.member_id}" readonly="readonly"
                     			placeholder="아이디" autocomplete="off" onkeyup="idCheck()"/>
						</div>
						<!-- 이름 -->
						<div class="col-lg-12">
							이름
							<input id="name" class="form-control" type="text" value="${user.name}" readonly="readonly"
	                     		placeholder="이름" autocomplete="off"/>
						</div>
						<!-- 닉넥임 -->
						<div class="col-lg-12">
							닉네임
							<input id="nickname" class="form-control" type="text" value="${user.nickname}" readonly="readonly"
								placeholder="닉네임" autocomplete="off"/>
						</div>
						<!-- 주민번호 -->
						<div class="col-lg-12">
							주민번호
							<div class="d-flex">
								<input type="text" class="form-control" maxlength="6"  placeholder="주민번호 앞자리"
									value="${user.jumin.substring(0, 6)}" readonly="readonly"/>
								<b style="margin: 10px 15px;">-</b>
								<input type="password" class="form-control" maxlength="7"  placeholder="뒷자리"
									value="0000000" readonly="readonly"/>
							</div>
						</div>
						<!-- 이메일 -->
						<div class="col-lg-12">
							이메일
							<c:set var="email" value="${user.email.split('@')}"/>
							<div class="d-flex">
								<input type="text" name="email1" class="form-control" value="${email[0]}"
									autocomplete="off" placeholder="이메일"/>
								<b style="margin: 10px;">@</b>
								<select class="form-control" style="margin: 0 0 14px 0;" onchange="selectEmail()">
				                	<option>gmail.com</option>
				                    <option>naver.com</option>	
				                    <option>daum.net</option>
				                    <option>nate.net</option>
				                    <option selected="selected">직접 입력하기</option>
								</select>
								<input type="text" name="email2" class="form-control" autocomplete="off" placeholder="직접 입력하기" value="${email[1]}"
									style="width: 130px; height: 46px; margin-left: 20px;"/>
							</div>
						</div>
						
						<!-- 주소 -->
						<div class="col-lg-12">
							<div class="address_box">
								주소
								<div class="d-flex justify-content-between">
									<input id="address_show" type="text" class="form-control mr-4" placeholder="주소" readonly="readonly" value="${user.address}">
									<input class="btn btn-primary ml-4 address_swicth" type="button" value="주소 변경"/>
								</div>
							</div>
							<div class="address_box" hidden>
								우편번호
								<div class="d-flex justify-content-between">
									<input type="text" class="form-control mr-3" id="postcode" placeholder="우편번호" readonly="readonly">
									<input type="button" class="btn btn-success ml-3" onclick="execDaumPostcode()" value="주소 찾기">
								</div>
								주소
								<input type="text" class="form-control" id="address" placeholder="주소" readonly="readonly">
								상세주소
								<input type="text" class="form-control" id="detailAddress" placeholder="상세주소">
								<div class="text-center">
										<span class="btn-group">
										<input class="btn btn-primary address_swicth" type="button" value="주소 변경"/>
										<input id="back" class="btn btn-danger" type="button" value="돌아가기"/>
									</span>
								</div>
							</div>
						</div>
						
						<!-- 전화번호 -->
						<div class="col-lg-12">
							전화번호
							<div class="d-flex">
								<select class="form-control" style="margin-bottom: 15px;">
							    	<option>010</option>
									<option>011</option>
									<option>016</option>
									<option>017</option>
									<option>018</option>
									<option>019</option>
								</select>
								<b style="margin: 10px 15px;">-</b>
								<input id="phone" class="form-control" type="text" value="${user.phone.substring(3, 11)}"
									placeholder="휴대폰 번호('-'없이 입력하세요)" maxlength="8" autocomplete="off"/>
							</div>
						</div>

						<div class="col-lg-12 text-center">
							<input class="btn btn-primary m-3" type="submit" value="내 정보 수정하기" style="width: 400px;" />
						</div>
						<div class="col-lg-12 text-center">
							<a class="btn btn-success" style="width: 400px; margin-left: auto; margin-right: auto;" href="pwdChangePage">비밀번호 변경</a>
						</div>
							<input type="hidden" name="email"/>
							<input type="hidden" name="phone"/>
							<input type="hidden" name="address"/>
							<input type="hidden" name="postCode"/>
							
					</form>
				</div>
			</div>
		</div>
	</div>
</section>



<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<!-- footer -->
<jsp:include page="common/footer.jsp"></jsp:include>

</body>
</html>