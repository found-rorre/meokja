<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%> 
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%> 
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>같이먹장</title>

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
<script type="text/javascript" src="js/loginCheck.js" defer="defer"></script>

<!-- private -->
<script type="text/javascript" src="js/partyInsert.js" defer="defer"></script>
<script type="text/javascript" src="js/daumlocationListAPI.js" defer="defer"></script>
<link rel="stylesheet" href="css/daumapi.css">					

<style>

</style>

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
            <form class="comment-form mb-5 bg-grey p-5" action="partyInsert" method="post" enctype="multipart/form-data" onsubmit="return partyInsertOK()">
               <h3 class="mb-4 text-center">먹방 생성</h3>
               <div class="row">
                  <!-- 파티 명 -->
                  <div class="col-lg-12">
                     <input type="text" class="form-control mb-3" name="subject" autocomplete="off" placeholder="파티명 :"/>
                  </div>
                  <!-- 파일 업로드 -->                  
                  <div class="col-lg-12">
                     <div class="row mb-3">
                        <div class="col-md-4"></div>
                        <div class="col-md-4">
                           <h5 class="mb-3 text-center">파일 업로드</h5>
                           <input class="form-control" type="file" accept="image/*" name="fileName" onchange="photoView(event)"/>
                        </div>
                        <div class="col-md-4"></div>
                     </div>
                     <div class="row mb-3">
                        <div class="col-lg-3"></div>
                        <div class="col-lg-6">
                           <img id="output" class="img-fluid w-100"/><br/>
                        </div>
                        <div class="col-lg-3"></div>
                     </div>
                  </div>
                  <!-- 음식 카테고리 -->
                  <div class="col-md-4">
                     <h5 class="mb-3 text-center">카테고리</h5>
                     <select class="form-control text-center mb-3" name="food_category">
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
                  <!-- 지역 -->
                  <div class="col-md-4">
                     <h5 class="mb-3 text-center">지역</h5>
                     <select class="form-control text-center mb-3" name="local_category">
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
                  
                  <!-- 인원 -->
				<div class="col-md-4">
					<h5 class="mb-3 text-center">인원 제한</h5>
  					<select class="form-control text-center mb-3" name="limitNum">
                        <option>2</option>
                        <option>3</option>
                        <option>4</option>
					</select>
				</div>
                  <!-- 모임 시간 시작 -->
                <div class="col-lg-6">
                	<h5 class="mb-3 text-center">식사 시간</h5>
                    	<div class="row mb-3">
	                        <div class="col-lg-6">
	                        	<input type="date" class="form-control" name="dateObject1" onclick="dateOK()"/>
	                        </div>
	                        <div class="col-lg-6">
	                        	<input type="time" class="form-control" name="dateObject2" value="12:00" min="00:00" max="23:59" onchange="timeOK(this)">
	                        </div>
						</div>
                  </div>
                  <div class="col-lg-6">
                     <h5 class="mb-3 text-center">장소 검색</h5>
                     <div class="row">
                        <div class="col-lg-8">
                           <input type="text" id="keyword" class="form-control mb-3" name="map" autocomplete="off" placeholder="정확한 식당이름을 적어주세요"/>
                        </div>
                        <div class="col-lg-4 text-center">
                           <div>
                              <input type="button" class="btn btn-warning" id="searchButton" value="검색" onclick="searchPlaces(); return false;"/>
                           </div>
                        </div>
                     </div>
                  </div>

                     <!-- 장소 -->
					<div class="col-lg-2"></div>
					<div class="col-lg-8">
						<div class="map_wrap">
							<div id="map" style="width:100%;height:100%;position:relative;overflow:hidden;"></div>
							<div id="menu_wrap" class="bg_white">
								<div class="option">
									<div></div>
								</div>
								<hr>
								<h3>해당하는 장소를 선택해주세요.</h3>
								<ul id="placesList"></ul>
								<div id="pagination"></div>
							</div>
						</div>
					</div>
					<div class="col-lg-2"></div>
                     <!-- 글 내용 -->
					<div class="col-lg-12 pt-3">
						<textarea class="form-control mb-4" name="contents" rows="11"  placeholder="내용" style="resize: none;">글 내용</textarea>
					</div>
				</div>
				<div class="row">
					<div class="col-lg-12 text-center">
                    	<input class="btn btn-primary mb-3" type="submit" value="생성하기"/><br/>
					<div class="btn-group">
                    	<input class="btn btn-primary" type="reset" value="다시쓰기"/>
                        <input class="btn btn-primary" type="button" value="돌아가기" onclick="history.back()"/>
					</div>
				</div>
			</div>
               <!-- (hidden) ip, 작성자 ID, 작성자 nickname -->
               <input type="hidden" name="member_id" value="${user.member_id}"/>
            </form>
         </div>
      </div>
   </div>
   </div>
</section>
<!-- footer -->
<jsp:include page="common/footer.jsp"></jsp:include>

<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=3770323a66e44a0f1eca043b6e64d109&libraries=services"></script>
</body>
</html>