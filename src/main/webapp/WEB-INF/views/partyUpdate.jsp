<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>         <!-- jstl c -->
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>      <!-- jstl fmt -->
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>   <!-- jstl fn -->
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>수정할 글 보기</title>

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

</head>
<body>
<fmt:requestEncoding value="UTF-8"/>

<!-- header -->
<jsp:include page="common/header.jsp"></jsp:include>

<section class="single-block-wrapper section-padding">
<div class="container">
<div class="row">
	<div class="col-lg-8 col-md-12 col-sm-12 col-xs-12">
		<div class="single-post">
			<div class="post-header mb-5 text-center">
				<h2 class="post-title mt-2">
	               <c:set var="subject" value="${fn:replace(vo.subject, '<', '&lt;')}"/>
	               <c:set var="subject" value="${fn:replace(subject, '>', '&gt;')}"/>
					${subject}
				</h2>
				<div class="post-featured-image mt-5">
					<img src="upload/thumbnail/${vo.thumbnail}" class="img-fluid w-100" style="height: 420px;"/>
				</div>
			</div>
			<div class="post-body">
	            <form action="partyUpdate" method="post">
	            <div class="container bg-grey comment-form">
					<div class="row">
		               	<div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
		                   	<div class="col-lg-12">
		                       	<div class="row">
		                          	<!-- 장소 -->
		                          	<div class="col-lg-12">
			                           	<h5 class="m-3 text-center">장소</h5>
			                           	<div class="text-center m-3">${vo.map}</div>
			                           	<input id="keyword" value="${vo.map}" hidden="hidden">
										<div class="map_wrap mb-3">
											<div id="map" style="width:100%;height:100%;position:relative;overflow:hidden;"></div>
											<div id="menu_wrap" class="bg_white" hidden="hidden">
												<div class="option">
													<div></div>
												</div>
												<hr>
												<h3></h3>
												<ul id="placesList"></ul>
												<div id="pagination"></div>
											</div>
										</div>
		                          	</div>
		                          	<!-- 제목 -->
		                          	<div class="col-lg-12">
		                          		<div class="text-center m-3">
			                           	<h5 class="mb-3 text-center">제목을 수정해주세요</h5>
		                           			<input style="width: 100%" type="text" class="text-center mb-3 p-3" name="subject" value="${vo.subject}"/>
		                           		</div>
		                          	</div>
		                          	<!-- 음식카테고리 -->
		                          	<div class="col-lg-4 col-md-6">
		                           	<h5 class="mb-3 text-center">음식 카테고리</h5>
		                           		<div class="text-center mb-3">${vo.food_category}</div>
		                          	</div>
		                          	<!-- 모임 시간 -->
		                          	<div class="col-lg-4 col-md-6">
		                           		<h5 class="mb-3 text-center">식사 시간</h5>
		                           		<div class="text-center mb-5">
		                           			<fmt:formatDate value="${vo.mealed_at}" pattern="MM월 dd일 HH:mm"/>
		                           		</div>
		                          	</div>
		                          	<!-- 인원 -->
		                          	<div class="col-lg-4 col-md-6">
		                           	<h5 class="mb-3 text-center">인원 제한</h5>
		                           		<div class="text-center mb-3">${vo.limitNum}명</div>
		                          	</div>
		                          
		                          	<!-- 글 내용 -->
		                          	<div class="col-lg-12">
			                           	<h5 class="mb-3 text-center">내용을 수정하세요</h5>
		                             	<c:set var="contents" value="${fn:replace(vo.contents, '<', '&lt;')}"/>
		                             	<c:set var="contents" value="${fn:replace(contents, '>', '&gt;')}"/>
		                             	<c:set var="contents" value="${fn:replace(contents, '<br/>', enter)}"/>
		                             	<textarea class="form-control mb-3" name="contents" rows="15" cols="30" style="resize: none;">${contents}</textarea>
		                          	</div>
									</div>
		                       		<div class="row">   
			                       		<div class="col-lg-12 text-center" style="margin-bottom: 15px;">
			                       			<input type="hidden" name="currentPage" value="${currentPage}">
			                       			<input type="hidden" name="party_id" value="${vo.party_id}">
											<div class="btn-group">
												<input class="btn btn-primary" type="submit" value="수정하기"/>
				                               	<input class="btn btn-primary" type="button" value="돌아가기" onclick="history.back()"/>
											</div>
										</div>
									</div>
								</div>
							</div>
						</div>
					</div>
				</form>
			</div>
		</div>
	</div>
   
	<div class="col-lg-4 col-md-4 col-sm-12 col-xs-12">
		<div class="sidebar sidebar-right">
			<div class="sidebar-wrap mt-5 mt-lg-0">
				<div class="sidebar-widget about mb-5 text-center p-3">
					<div class="about-author">
						<img src="upload/memberphoto/${master.photo}" alt="" class="img-fluid">
					</div>
					<h4 class="mb-0 mt-4">모임장</h4>
					<p>${master.nickname}</p>
				</div>
			</div>
		</div>
	</div>

</div>
</div>s
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



