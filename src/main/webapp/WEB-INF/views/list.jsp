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



</head>
<body>
	<!-- header -->
	<jsp:include page="common/header.jsp"></jsp:include>


	<fmt:requestEncoding value="UTF-8" />

	<section class="slider mt-4">
		<div class="container-fluid">
			<div class="row no-gutters">
				<div class="col-lg-12 col-sm-12 col-md-12 slider-wrap">
					<!-- Slider 시작 -->
					<c:forEach var="so" items="${sliderList.list}">
						<div class="slider-item">
							<div class="slider-item-content">
								<div class="post-thumb mb-4">
									<a class="post-thumb mb-4 d-block" href="selectByIdx?party_id=${so.party_id}&currentPage=${currentPage}&job=article">
										<img src="upload/thumbnail/${so.thumbnail}" class="img-fluid" style="height: 500px;">
									</a>
								</div>
								<div class="slider-post-content">
									<span class="text-color font-sm font-extra letter-spacing">${so.food_category}</span>
									<h3 class="post-title mt-1">
										<a href="selectByIdx?party_id=${so.party_id}&currentPage=${currentPage}&job=article">${so.subject}</a>
									</h3>
									<span class=" text-muted  text-capitalize">
										<fmt:formatDate	value="${so.mealed_at}" pattern="yy.MM.dd HH시mm분"/>
									</span>
								</div>
							</div>
						</div>
					</c:forEach>
					<!-- Slider 끝 -->
				</div>
			</div>
		</div>
	</section>


	<!-- main 시작 -->

	<section class="section-padding">
		<div class="container">
			<div class="row">
				<!-- 파티 리스트 시작 -->
				<div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
					<div class="row">
						<div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
							<!-- 검색 -->
							<form class="mb-5" action="list" method="post">
								<div class="col-md-12 mb-5">
									<div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
										<div class="row mb-3">
											<div class="col-md-2"></div>
											<!-- 지역 -->
											<div class="col-md-3">
												<select class="form-control" name="local_category">
													<option>전국</option>
													<option>서울</option>
													<option>경기/인천</option>
													<option>강원</option>
													<option>대전</option>
													<option>세종</option>
													<option>충남</option>
													<option>충북</option>
													<option>부산</option>
													<option>울산</option>
													<option>경남</option>
													<option>경북</option>
													<option>대구</option>
													<option>광주</option>
													<option>전남</option>
													<option>전북</option>
													<option>제주</option>
												</select>
											</div>
											<!-- 카테고리 -->
											<div class="col-md-3">
												<select class="form-control" name="food_category">
													<option>음식 카테고리</option>
													<option>한식</option>
													<option>일식</option>
													<option>중식</option>
													<option>양식</option>
													<option>카페&디저트</option>
													<option>고기&구이</option>
													<option>치킨</option>
												</select>
											</div>
										</div>
									</div>
								</div>
								<div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
									<div class="row mb-3">
										<div class="col-md-2"></div>
										 <!-- 검색어 -->
								        <div class="col-md-2">
								            <select class="form-control" name="condition">
								                <option>파티명</option>
								                <option>내용</option>
								                <option>내용+파티명</option>
								            </select>
								        </div>
								        <!-- 검색 내용 -->
								        <div class="col-md-7"> 
								            <div class="input-group">
								                <input type="text" class="form-control" name="item" placeholder="검색" value="${item}" />
								                <div class="input-group-append"> <!-- input-group-append 추가 -->
								                <!-- 검색 버튼 -->
								                     <button type="submit" class="serchBtn" style="border: 1px solid black; padding: 6px 10px; border-radius: 0 8px 8px 0; ">
								                        <img src="images/serchBtn8.png" alt="검색 버튼" />
								                    </button>
								                </div>
								            </div>
								        </div>
								        <div class="col-md-1"></div>
								    </div>
								</div>
							</form>
							<!-- 검색 끝 -->
						</div>
						<!-- 반복문으로 list 출력 시작-->
						<c:set var="view" value="${partyList.list}"/>
						<c:forEach var="vo" items="${view}">
							<c:if test="${vo.reportCount < 2}">
							<div class="col-lg-3 col-md-6">
								<article class="post-grid mb-5">
									<a class="post-thumb mb-4 d-block article_box" href="selectByIdx?party_id=${vo.party_id}&currentPage=${currentPage}&job=article">
										<img src="upload/thumbnail/${vo.thumbnail}" class="img-fluid w-100" style="height: 210px; width: 210px;">
										<span class="text-color mt-2 letter-spacing">${vo.food_category}</span><br/>
										<span class="text-muted letter-spacing font-sm">
											<fmt:formatDate	value="${vo.mealed_at}" pattern="yy.MM.dd"/>&nbsp;
											<fmt:formatDate	value="${vo.mealed_at}" pattern="HH시mm분"/>
										</span><br/>
										<span class="post-title">${vo.subject}</span><br/>
										<span class="py-1">${vo.local_category}</span>
									</a>
								</article>
							</div>
							</c:if>	
							<c:if test="${vo.reportCount >= 2}">
							<div class="col-lg-3 col-md-6">
								<article class="post-grid mb-5">
									<img src="images/report.jpg" class="img-fluid w-100" style="height: 210px; width: 210px;">
									<div class="post-title text-center">
										<br/>
										<b style="color: red; font-size: 20px;">신고 누적된 방입니다.</b>
									</div>
								</article>
							</div>
							</c:if>
						</c:forEach>
						<!-- 반복문으로 list 출력 끝-->
					</div>
				</div>
				<!-- 파티 리스트 끝 -->

				<!-- 페이징 작업 시작 -->
				<div class="m-auto">
					<div class="pagination mt-5 pt-4">
						<ul class="list-inline">
							<!-- 처음으로 -->
							<!-- 활성화 -->
							<c:if test="${partyList.currentPage >1}">
								<li class="list-inline-item">
									<a class="active" href="?currentPage=1&item=${item}&condition=${condition}&local_category=${local_category}&food_category=${food_category}">처음</a>
								</li>
							</c:if>

							<!-- 10페이지 앞으로 -->
							<c:if test="${partyList.startPage >1}">
								<li class="list-inline-item">
									<a href="?currentPage=${partyList.startPage - 1}&item=${item}&condition=${condition}&local_category=${local_category}&food_category=${food_category}">이전</a>
								</li>
							</c:if>

							<c:if test="${partyList.startPage <= 1}">
								<li class="list-inline-item">
									<a class="active">이전</a>
								</li>
							</c:if>

							<!-- 페이지 이동버튼 -->
							<c:forEach var="i" begin="${partyList.startPage}" end="${partyList.endPage}" step="1">
								<c:if test="${partyList.currentPage == i}">
									<li class="list-inline-item">
										<a class="active">${i}</a>
									</li>
								</c:if>

								<c:if test="${partyList.currentPage != i}">
									<li class="list-inline-item">
										<a href="?currentPage=${i}&item=${item}&condition=${condition}&local_category=${local_category}&food_category=${food_category}">${i}</a>
									</li>
								</c:if>
							</c:forEach>

							<!-- 10페이지 뒤로 -->
							<c:if test="${partyList.endPage < partyList.totalPage}">
								<li class="list-inline-item">
									<a	href="?currentPage=${partyList.endPage + 1}&item=${item}&condition=${condition}&local_category=${local_category}&food_category=${food_category}">다음</a>
								</li>
							</c:if>

							<c:if test="${partyList.endPage >= partyList.totalPage}">
								<li class="list-inline-item">
									<a class="active">다음</a>
								</li>
							</c:if>

							<!-- 마지막 -->
							<c:if test="${partyList.currentPage < partyList.totalPage}">
								<li class="list-inline-item">
									<a class="active" href="?currentPage=${partyList.totalPage}&item=${item}&condition=${condition}&local_category=${local_category}&food_category=${food_category}">끝</a>
								</li>
							</c:if>
						</ul>
					</div>
				</div>
				<!-- 페이징 작업 시작 끝 -->
			</div>
		</div>
	</section>

	<!-- footer -->
	<jsp:include page="common/footer.jsp"></jsp:include>



	
	


</body>
</html>