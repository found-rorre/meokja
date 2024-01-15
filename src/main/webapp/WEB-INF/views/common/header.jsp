<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>         <!-- jstl c -->
<script type="text/javascript" src="js/loginCheck.js" defer="defer"></script>

   <!-- 로그인 확인용 전역 JavaScript 변수 선언 -->
<script type="text/javascript">window.user = "${user}";</script>

<!-- 메인 상단 바 -->

<header class="header-top bg-grey justify-content-center" style="margin-bottom: 50px;">
	<nav class="navbar navbar-expand-lg navigation row" style="margin: 0 80px;">
		<!-- 왼쪽 메인 로고 -->
		<div class="col-lg-2 col-md-12 d-none d-lg-block">
			<a class="navbar-brand " href="list">
				<img src="images/logo.png" alt="메인 로고 이미지" class="img-fluid">
			</a>
		</div>
		<!-- 여백 -->
		<div class="col-lg-1 col-md-6">
		</div>
		<!-- nav  바 -->
		<div class="col-lg-6 col-md-12">
			<nav class="navbar navbar-expand-lg navigation-2 navigation">
	        	<div class="collapse navbar-collapse" id="navbar-collapse">
	            	<input type="hidden" id="loginCheck" value="${user}"/>
	            	<ul id="menu" class="menu navbar-nav mx-auto">
	                	<li class="nav-item"><a href="#" onclick="loginCheck('partyInsert')" class="nav-link" style="font-size: 20px;">파티생성</a></li>
	                    <li class="nav-item"><a href="list" class="nav-link" style="font-size: 20px;">파티목록</a></li>
	                    <li class="nav-item"><a href="#" onclick="loginCheck('mylist')" class="nav-link" style="font-size: 20px;">파티관리</a></li>
	                </ul>
	        	</div>
			</nav>
		</div>
		<!-- 여백 -->
		<div class="col-lg-1 col-md-6">
		</div>
		<!-- 로그인 로그아웃 -->
		<div class="col-lg-2 col-md-6">
			<div class="header-socials-2 text-right d-none d-lg-block">
			<c:if test="${user != null}">
				<div class="row">
					<div class="list-inline-item">
						<div class="row">
							<span>
								<a id="myProfile" href="myProfileChk">
									<img src="upload/memberphoto/${user.photo}" class="img-fluid w-100" style="height: 45px; width: 5px; border-radius: 50px;">
								</a>
							</span>&nbsp;&nbsp;
							<span class="text-center mr-3" style="font-size: 10pt; font-weight: bold; padding-top: 10px;">
								<a id="myProfile" href="myProfileChk"> ${user.nickname}</a>
							</span>
							<a id="logout-nav" href="logout" style="font-weight: bold; padding-top: 10px;"><i>로그아웃</i></a>
						</div>
					</div>
				</div>
			</c:if>
			
			<c:if test="${user == null}">
				<div style="display: inline-flex;">
					<div><a href="loginPage"style=" width: 100px;"><i>로그인</i></a></div>
					<div><a href="memberPage"style=" width: 100px;"><i>회원가입</i></a></div>
				</div>
			</c:if>
			<!-- 로그인 로그아웃 끝 -->				
			</div>
		</div>
	</nav>
</header>