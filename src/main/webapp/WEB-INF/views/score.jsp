<%@ page language="java" contentType="text/html; charset=UTF-8"	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>같이먹장</title>

<!-- common -->
<meta name="viewport" content="width=device-width, initial-scale=1.0" />		<!-- device-width -->
<link rel="icon" href="images/favicon.png">										<!--  favicon -->
<script type="text/javascript" src="common/jquery-3.7.0.js"></script>			<!-- jQury -->
<link rel="stylesheet" href="common/bootstrap/bootstrap.min.css">				<!-- bootstrap -->
<script src="common/bootstrap/bootstrap.min.js"></script>						<!-- bootstrap -->
<script src="common/bootstrap/popper.min.js"></script>							<!-- bootstrap -->
<script type="text/javascript" src="common/custom.js" defer="defer"></script>	<!-- template -->
<link rel="stylesheet" href="common/style.css" />								<!-- template -->

<link rel="stylesheet" href="common/slick-carousel/slick-theme.css">			<!-- slick -->
<link rel="stylesheet" href="common/slick-carousel/slick.css">					<!-- slick -->
<script src="common/slick-carousel/slick.min.js"></script>						<!-- slick -->
<script type="text/javascript" src="js/loginCheck.js" defer="defer"></script>
<!-- private -->
<script type="text/javascript" src="js/daumlocationListAPI.js" defer="defer"></script>
<link rel="stylesheet" href="css/daumapi.css">
<script type="text/javascript" src="js/score.js" defer="defer"></script>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.8.0/font/bootstrap-icons.css">

<style type="text/css">
	.star {
		cursor: pointer;
		color: #dabd18b2;
		font-size: 25px;
	}
</style>


</head>
<body>
	
${vo}
	
<!-- header -->
<jsp:include page="common/header.jsp"></jsp:include>

<section class="single-block-wrapper section-padding">
<div class="container">
<div class="row">
		
	<!-- 본문 -->
	<div class="col-lg-12 bg-grey my-5">
       	
		<!-- 1 줄 -->
       	<div class="row my-3">
       		
       		<div class="col-lg-12 text-center mb-2">
	           	<h2 class="post-title">
	               <c:set var="subject" value="${fn:replace(vo.subject, '<', '&lt;')}"/>
	               <c:set var="subject" value="${fn:replace(subject, '>', '&gt;')}"/>
					${subject}
				</h2>
				<h4 class="post-title">${vo.map}</h4>
			</div>
		</div>
			
		<!-- 2 줄 -->	
		<div class="row my-3">
			<div class="col-lg-6 col-sm-12">
				<img src="upload/thumbnail/${vo.thumbnail}" class="img-fluid" style="height: 450px;"/>
			</div>
			<!-- 모임정보 지도 -->
			<div class="col-lg-6 col-sm-12">
				<div class="row mb-4">
					<!-- 음식카테고리 -->
					<div class="col-lg-4 col-sm-4">
						<h5 class="mb-3 text-center">음식 카테고리</h5>
						<div class="text-center">${vo.food_category}</div>
					</div>
					<!-- 모임 시간 -->
					<div class="col-lg-4 col-sm-4">
						<h5 class="mb-3 text-center">식사 시간</h5>
						<div class="text-center">
							<fmt:formatDate value="${vo.mealed_at}" pattern="MM월 dd일 HH:mm"/>
						</div>
					</div>
					<!-- 인원 -->
					<div class="col-lg-4 col-sm-4">
						<h5 class="mb-3 text-center">인원 제한</h5>
						<div class="text-center">${vo.limitNum}명</div>
					</div>
				</div>
				<!-- 지도 -->
				<div class="col-lg-12 col-sm-12">
					<input id="keyword" value="${vo.map}" hidden="hidden">
					<div class="map_wrap" style="width:450px;height:360px;">
						<div id="map" style="width:420px;height:360px;position:relative;overflow:hidden;"></div>
						<div id="menu_wrap" class="bg_white" hidden="hidden">
							<div class="option">
							</div>
							<hr>
							<ul id="placesList"></ul>
							<div id="pagination"></div>
						</div>
					</div>
               	</div>
			</div>
		</div>
	</div>
	<!-- 본문 내용 끝-->
		<!-- 평가하기 시작 -->
	<div class="col-lg-12 bg-grey my-5">
		<div class="row my-3">
		
		<!-- 리스트 수에 따른 문서 나누기 -->
		 
		<!-- 평가할 맴버 리스트 출력 -->
		<c:forEach var="list" items="${scoreList.list}">
			<div class="col-lg-2 col-md-3 col-sm-6 my-3">
				<img src="upload/memberphoto/${list.photo}" class="img-circle" style="width: 100%; border-radius: 100%">
			</div>
			<div class="col-lg-2 col-md-3 col-sm-6 text-center pt-5">
				<h5>${list.nickname}</h5>
				<h5 class="text-muted">${list.age}세 ${list.gender}</h5>
				<div class="star-container">
					<!--bi-star: 빈별
						bi-star-fill 채운별
						bi-star-half 반별 -->
				    <i class="star bi bi-star-fill"></i>
				    <i class="star bi bi-star"></i>
				    <i class="star bi bi-star"></i>
				    <i class="star bi bi-star"></i>
				    <i class="star bi bi-star"></i>
				</div>
			</div>
			<input type="hidden" class="member_id" value="${list.member_id}">
			<div class="col-lg-2">&nbsp;</div>
		</c:forEach>
		
		
		
		</div>
		<div class="row">
			<div class="col-lg-12 text-center my-3">
				<input type="button" id="score_btn" class="btn btn-primary"
					data-party_id="${vo.party_id}" value="평가하기">
			</div>
		</div>
	</div>
	<!-- 평가 끝 -->
</div>
</div>	
</section>
	<script type="text/javascript">
	$(() => {
		searchPlaces();
	});
	</script>

<!-- footer -->
<jsp:include page="common/footer.jsp"></jsp:include>

<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=3770323a66e44a0f1eca043b6e64d109&libraries=services"></script>
</body>
</html>