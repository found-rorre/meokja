<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>         <!-- jstl c -->
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>      <!-- jstl fmt -->
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>   <!-- jstl fn -->
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>파티 관리</title>



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
<script type="text/javascript" src="js/mylist.js"></script>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.2/css/all.min.css">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.8.0/font/bootstrap-icons.css">
<style type="text/css">

	#score_box {
		cursor: pointer;
	}
	.star {
		cursor: pointer;
		color: #dabd18b2;
		font-size: 25px;
	}

</style>

</head>
<body>

<!-- header -->
<jsp:include page="common/header.jsp"></jsp:include>


<section class="single-block-wrapper section-padding">
<div class="container">
<div class="row">
		
	<!-- 본문 내용 -->
	<div class="col-lg-9 col-md-9 col-sm-12 col-xs-12 sidebar-widget">

		
		<!-- 평가 모임 /없을 시 row 삭제 -->
		<c:if test="${list_score.list[0] != null}">
		<div class="row bg-grey  mt-3 mb-3">
		
			<div class="col-lg-12">
				<h4 class="mt-4">같이 먹은 모임원들에게 평점을 주세요!</h4>
				평가는 일주일 후 사라집니다.
			</div>
			
			<!-- 평가 리스트 반복 -->
			<c:forEach var="vo" items="${list_score.list}">
			
			<!-- 평가 모임 (정상) -->
			<c:if test="${vo.reportCount < 2}">
			<div class="col-lg-3 col-md-6">
				<article class="post-grid mb-5">
					<form class="post-thumb mb-4 d-block score_box" action="scorePage" method="post">
						<img src="upload/thumbnail/${vo.thumbnail}" class="img-fluid" style="height: 210px; width: 250px; border-radius: 50px;">
						<span class="text-color font-lg font-extra text-uppercase letter-spacing" style="display: block">${vo.food_category}</span><br/>
						<span class="post-title mt-1">${vo.subject}</span><br/>
						<span class="text-muted letter-spacing font-sm">
							<fmt:formatDate value="${vo.mealed_at}" pattern="yy.MM.dd"/><br/>
							<fmt:formatDate value="${vo.mealed_at}" pattern="HH시 mm분"/>
						</span>
						<input type="hidden" name="party_id" value="${vo.party_id}"/>
					</form>
				</article>
			</div>
			</c:if>
			
			<!-- 평가 모임 (신고) -->
			<c:if test="${vo.reportCount >= 2}">
			<div class="col-lg-3 col-md-6">
				<article class="post-grid mb-5">
					<img src="./images/report.png" class="img-fluid w-100" style="height: 210px; width: 210px;">
					<span class="text-color mt-2 letter-spacing"> </span><br/>
					<span class="text-muted letter-spacing text-uppercase font-sm">
						<fmt:formatDate value="${vo.mealed_at}" pattern="yy.MM.dd"/><br/>
						<fmt:formatDate value="${vo.mealed_at}" pattern="HH시 mm분"/>
					</span><br/>
					<div class="post-title text-center"><b style="color: red; font-size: 20px;">신고 누적된 방입니다.</b></div>
				</article>
			</div>
			</c:if>
			</c:forEach>
			
		</div>
		</c:if>
			<!-- 평가 리스트 끝 -->		
		<!-- 만든 모임 /없을 시 row 삭제	 -->
		<c:if test="${list_create.list[0] != null}">
		<div class="row bg-grey mt-3 mb-3">
		
			<div class="col-lg-12">
				<h1 class="text-center widget-title m-4" style="font-size: 23px;">만든 모임</h1>
			</div>
			
			<!-- 만든 모임 리스트 반복 -->
			<c:forEach var="vo" items="${list_create.list}">
			
			<!-- 만든 모임 (정상) -->
			<c:if test="${vo.reportCount < 2}">
			<div class="col-lg-3 col-md-6">
				<article class="post-grid mb-5">
					<a class="post-thumb mb-4 d-block" href="selectByIdx?party_id=${vo.party_id}&currentPage=1&job=article">
						<img src="upload/thumbnail/${vo.thumbnail}" class="img-fluid" style="height: 210px; width: 250px; border-radius: 50px;">
						<span class="text-color font-lg font-extra text-uppercase letter-spacing" style="display: block">${vo.food_category}</span><br/>
						<span class="post-title mt-1">${vo.subject}</span><br/>
						<span class="text-muted letter-spacing font-sm">
							<fmt:formatDate value="${vo.mealed_at}" pattern="yy.MM.dd"/><br/>
							<fmt:formatDate value="${vo.mealed_at}" pattern="HH시 mm분"/>
						</span>
					</a>
				</article>
			</div>
			</c:if>

			<!-- 만든 모임 (신고) -->
			<c:if test="${vo.reportCount >= 2}">
			<div class="col-lg-3 col-md-6">
				<article class="post-grid mb-5">
					<img src="./images/report.png" class="img-fluid w-100" style="height: 210px; width: 210px;" >
					<span class="text-color mt-2 letter-spacing"> </span><br/>
					<span class="text-muted letter-spacing text-uppercase font-sm">
						<fmt:formatDate value="${vo.mealed_at}" pattern="yy.MM.dd"/><br/>
						<fmt:formatDate value="${vo.mealed_at}" pattern="HH시 mm분"/>
					</span><br/>
					<div class="post-title text-center"><b style="color: red; font-size: 20px;">신고 누적된 방입니다.</b></div>
				</article>
			</div>
			</c:if>
			
			
			</c:forEach>
			<!-- 만든 리스트 끝 -->
		</div>
		</c:if>
		<!-- 참여 모임 /없을 시 row 삭제 -->
		<c:if test="${list_join.list[0] != null}">
		<div class="row bg-grey mt-3 mb-3">
		
			<div class="col-lg-12">
				<h1 class="text-center widget-title m-4" style="font-size: 23px;">참여 모임</h1>
			</div>
			
			<!-- 참여 모임 리스트 반복 -->
			<c:forEach var="vo" items="${list_join.list}">
			
			<!-- 참여 모임 (정상) -->
			<c:if test="${vo.reportCount < 2}">
			<div class="col-lg-3 col-md-6">
				<article class="post-grid mb-5">
					<a class="post-thumb mb-4 d-block" href="selectByIdx?party_id=${vo.party_id}&currentPage=1&job=article">
						<img src="upload/thumbnail/${vo.thumbnail}" class="img-fluid" style="height: 210px; width: 250px; border-radius: 50px;">
						<span class="text-color font-lg font-extra text-uppercase letter-spacing" style="display: block">${vo.food_category}</span><br/>
						<span class="post-title mt-1">${vo.subject}</span><br/>
						<span class="text-muted letter-spacing font-sm">
							<fmt:formatDate value="${vo.mealed_at}" pattern="yy.MM.dd"/><br/>
							<fmt:formatDate value="${vo.mealed_at}" pattern="HH시 mm분"/>
						</span>
					</a>
				</article>
			</div>
			</c:if>

			<!-- 참여 모임 (신고) -->
			<c:if test="${vo.reportCount >= 2}">
			<div class="col-lg-3 col-md-6">
				<article class="post-grid mb-5">
					<img src="./images/report.png" class="img-fluid w-100" style="height: 210px; width: 210px;" >
					<span class="text-color mt-2 letter-spacing"> </span><br/>
					<span class="text-muted letter-spacing text-uppercase font-sm">
						<fmt:formatDate value="${vo.mealed_at}" pattern="yy.MM.dd"/><br/>
					<fmt:formatDate value="${vo.mealed_at}" pattern="HH시 mm분"/>
					</span><br/>
					<div class="post-title text-center"><b style="color: red; font-size: 20px;">신고 누적된 방입니다.</b></div>
				</article>
			</div>
			</c:if>
			
			
			</c:forEach>
			<!-- 참여 리스트 끝 -->
		</div>
		</c:if>

	</div>
	<!-- 본문 내용 끝-->
	
	
	<!-- 왼쪽 사이드 바 -->
	<div class="col-lg-3 col-md-3 col-sm-12 col-xs-12">
		<div class="sidebar sidebar-right">
			<div class="sidebar-wrap mt-5 mt-lg-0">
	        	<div class="sidebar-widget about mb-5 text-center p-3">
					<div class="about-author">
	                	<img src="upload/memberphoto/${user.photo}" class="img-fluid">
					</div>
					<h4 class="mb-0 mt-4"></h4>
					<p>${user.nickname}</p>
					<p>${user.age}</p>
					<p>${user.gender}</p>
					<h4 class="mb-0 mt-4">내 평점</h4>
					<div class="star-container">
						<!-- far: 빈별 fas 채운별 -->
					    <i class="star bi bi-star-fill"></i>
					    <i class="star bi bi-star-half"></i>
					    <i class="star bi bi-star"></i>
					    <i class="star bi bi-star"></i>
					    <i class="star bi bi-star"></i>
					</div>
				</div>	
			</div>
		</div>
	</div>
</div>
</div>	
</section>


<script type="text/javascript">

//평점 찍기
const halfStar_class = "star bi bi-star-half";
const fullStar_class = "star bi bi-star-fill";
const target = $('.star-container');

const stars = [...target.children()];

console.log(stars);

const member_id = '${user.member_id}';
console.log(member_id);

const url = '/meokja/myScore';

fetch(url, {
	method: "POST",
	headers: {
		"Content-Type": "text/plain",
	},
	body: member_id,
})
.then(response => {
	return response.json();
})
.then(json => {
			console.log(json);
			if(json.result == "success") {
				
				const myScore = json.myScore;
				
				
				for(var i = 0; i < Math.floor(myScore); i++) {
					stars[i].className = fullStar_class;
				}
				if(Math.floor(myScore) != myScore){
					stars[Math.floor(myScore)].className = halfStar_class;
				}
				
			}
		})


</script>










<!-- footer -->
<jsp:include page="common/footer.jsp"></jsp:include>
</body>
</html>