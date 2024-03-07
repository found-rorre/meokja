<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>         <!-- jstl c -->
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>      <!-- jstl fmt -->
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>   <!-- jstl fn -->
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>파티글 보기</title>

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
<script type="text/javascript" src="js/article.js" defer="defer"></script>
<script type="text/javascript" src="js/daumlocationListAPI.js" defer="defer"></script>
<link rel="stylesheet" href="css/daumapi.css">
	
</head>
<body>	
<!-- header -->
<jsp:include page="common/header.jsp"></jsp:include>
		
<section class="single-block-wrapper section-padding">
<div class="container">
<div class="row">
	<!-- 본문 -->
	<div class="col-lg-9 col-md-9 col-sm-12 col-xs-12 bg-grey">
       	<div class="post-header m-5 text-center">
           	<h2 class="post-title mt-2">
               <c:set var="subject" value="${fn:replace(vo.subject, '<', '&lt;')}"/>
               <c:set var="subject" value="${fn:replace(subject, '>', '&gt;')}"/>
				${subject}
			</h2>
			<!-- 음식 카테고리 -->
			<h4 class="post-title mt-4">${vo.food_category}</h4>
			<div class="post-featured-image mt-5">
				<img src="upload/thumbnail/${vo.thumbnail}" class="img-fluid w-100" style="height: 450px;"/>
			</div>
		</div>
		<div class="post-body">
			<!--  -->
			<div class="container comment-form">
			<div class="row">
               	<div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                   	<div class="col-lg-12">
                       	<div class="row">
                          	<!-- 장소 -->
                          	<div class="col-lg-12">
	                           	<h5 class="m-3 text-center">장소</h5>
	                           	<div class="text-center m-3">${vo.map}</div>
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
                             	<c:set var="contents" value="${fn:replace(vo.contents, '<', '&lt;')}"/>
                             	<c:set var="contents" value="${fn:replace(contents, '>', '&gt;')}"/>
                             	<c:set var="contents" value="${fn:replace(contents, '<br/>', enter)}"/>
                             	<textarea class="form-control mb-3" rows="15" cols="30" style="resize: none;" readonly="readonly">${contents}</textarea>
                          	</div>
							<!-- 지도 -->
                          	<div class="col-lg-12">
                          		<input id="keyword" value="${vo.map}" hidden="hidden">
								<div class="map_wrap mb-3">
									<div id="map" style="width:100%;height:100%;position:relative;overflow:hidden;"></div>
									<div id="menu_wrap" class="bg_white" hidden="hidden">
										<div class="option">
										</div>
										<hr>
										<h3></h3>
										<ul id="placesList"></ul>
										<div id="pagination"></div>
									</div>
								</div>
                          	</div>
							<c:if test="${master.member_id != user.member_id && isReport == 'N'}">
							<div class="col-lg-12 text-right">
								<input id="report_btn" class="btn btn-danger" type="button" value="신고"/>
							</div>
							</c:if>
						</div>
                       	<div class="row">   
                       	<div class="col-lg-12 text-center" style="margin-bottom: 15px;">
							<div class="btn-group">
                            	<c:if test="${master.member_id == user.member_id}">
								<input class="btn btn-primary" type="button" value="수정하기"
                                	onclick="location.href='selectByIdx?party_id=${vo.party_id}&currentPage=${currentPage}&job=partyUpdate'"/>
                                <input class="btn btn-primary" type="button" value="삭제하기"
                                	onclick="location.href='selectByIdx?party_id=${vo.party_id}&currentPage=${currentPage}&job=partyDelete'"/>
                                <input id="back_btn" class="btn btn-primary" type="button" value="돌아가기"	onclick="location.href = 'list?currentPage=${currentPage}'"/>
                               	</c:if>   
							</div>
						</div>
						</div>
					</div>
				</div>
			</div>
			</div>
	       	<div class="mb-3 p-3 bg-grey">
				<!-- 신고 -->
				<form id="switch_form" action="joinInsert" method="post" onsubmit="location.href = 'list'">
				<!-- 참여 하기 -->
				
				<c:if test="${master.member_id != user.member_id}">
				<div id="join_box">
					<h4 class="text-center widget-title" style="margin-top: 8px;">참여하기</h4>
					<textarea class="form-control mb-3 bg-white"  name="contents" rows="3" placeholder="파티장에게 메세지를 보내세요." style="resize: none;"></textarea>
					<div class="text-center">
			            <input type="submit" class="btn btn-primary" value="참여 신청"/>
						<input class="btn btn-primary" type="button" value="돌아가기" onclick="location.href = 'list?currentPage=${currentPage}'"/>
					</div>
				</div>
				</c:if>
		            <input type="hidden" name="party_id" value="${vo.party_id}"/>   
		        	<input type="hidden" name="currentPage" value="${currentPage}"/>   
				</form>
				<div class="text-center">
					
				</div>
			</div>
		</div>
	</div>
  
	<!-- 왼쪽 사이드 -->
	<div class="col-lg-3 col-md-3 col-sm-12 col-xs-12">
		<div class="sidebar sidebar-right">
			<div class="sidebar-wrap mt-5 mt-lg-0">
            
            <div class="sidebar-widget about mb-5 text-center p-3">
               <div class="about-author">
                  <img src="upload/memberphoto/${master.photo}" class="img-fluid">
               </div>
               <h4 class="mb-0 mt-4">모임장</h4>
               <p>${master.member_id}</p>
            </div>
            
            <!-- fix 개수 -->
            <c:set var="count" value="${1}"/>
            <c:set var="view" value="${joinList.list}"/>
            <c:forEach var="jo" items="${view}">
               <c:if test="${jo.status == '수락'}">
                  <c:set var="count" value="${count + 1}"/>
               </c:if>
            </c:forEach>	
            
            <div class="sidebar-widget mb-5 ">
				<h4 class="text-center widget-title">신청 목록</h4>
                
                <!-- 참여자 리스트 -->
                <c:forEach var="jo" items="${view}">
                <!-- 인원제한까지만 보이게하기  (수정 필요함)-->
                <c:if test="${vo.limitNum > count}">
                <!-- 대기목록 -->
                <c:if test="${(jo.member_id == user.member_id || master.member_id == user.member_id) && jo.status == '대기'}">
					<div class="media border-bottom py-3 sidebar-post-item">
	                	<img class="mr-4" src="upload/memberphoto/${jo.photo}">
	                    <div class="media-body">
	                    	<h5 class="widget">${jo.nickname}</h5>
	                        <span class="text-muted font-sm">
	                        	<fmt:formatDate value="${jo.created_at}" pattern="MM월 dd일 HH:mm" />
							</span><br/>
	                        <span>${jo.gender}</span>
	                        <span>${jo.age}</span>
	                        <span class="font-sm letter-spacing-1">
	                        	<c:set var="contents" value="${fn:replace(jo.contents, '<', '&lt;')}"/>
                            	<c:set var="contents" value="${fn:replace(contents, '>', '&gt;')}"/>
                            	<c:set var="contents" value="${fn:replace(contents, enter, '<br/>')}"/>
								${contents}
	                        </span>
						</div>
					</div>
                </c:if>
                <!-- 방장만 보는 승인 거절 버튼 -->
                <c:if test="${master.member_id == user.member_id && jo.status== '대기'}">
                	<input class="btn btn-primary" type="button" value="승인"
                    	onclick="join('승인', ${jo.party_id}, ${currentPage}, ${jo.join_id}, ${vo.limitNum}, ${count})"/>
                  	<input class="btn btn-primary" type="button" value="거절"
                    	onclick="join('거절', ${jo.party_id}, ${currentPage}, ${jo.join_id})"/>
				</c:if>
                </c:if>
                </c:forEach>
                 <!-- 신청목록 끝 -->
                 
                 <!-- 참여목록 -->
                 	<h4 class="text-center widget-title mt-4">참여 목록</h4>
					<c:forEach var="jo" items="${view}">
                    <c:if test="${jo.status == '수락'}">
					<div class="media border-bottom py-2 sidebar-post-item">
                        <img class="mr-4" src="upload/memberphoto/${jo.photo}">
                        <div class="media-body">
	                        <h5 class="widget">${jo.nickname}</h5>
							<span class="text-muted font-sm">
								<fmt:formatDate value="${jo.created_at}" pattern="MM월 dd일 HH:mm" />
							</span><br/>	
	                        <span>${jo.gender}</span>
	                        <span>${jo.age}</span>
	                        <span class="font-sm letter-spacing-1">${jo.contents}</span>
	                        <!-- 참여자 파티 탈퇴 버튼 -->
                    	</div>
                	</div>
                	</c:if>
					</c:forEach>
				</div>
			</div>
		</div>
	</div>
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
	
	
	<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=015c269f25b33e2d52a027d53ff3a620&libraries=services"></script>
	</body>
	</html>