<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>			<!-- jstl c -->
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>		<!-- jstl fmt -->
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>	<!-- jstl fn -->
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>먹장 - 로그인</title>

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
<script type="text/javascript" src="js/login.js"></script>
<script type="text/javascript" src="js/loginCheck.js"></script>


</head>
<body>

<!-- header -->
<jsp:include page="common/header.jsp"></jsp:include>

<!-- 메인 -->
<section class="section-padding">
	<div class="container">
		<div class="row">
			<div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
				<div class="col-lg-12">
					<div class="row mb-3">
						<div class="col-lg-2"></div>
						<div class="col-lg-8">
							<!-- <img id="output" class="img-fluid w-100"/><br/> -->
						</div>
						<div class="col-lg-2"></div>
					</div>
				<form class="comment-form mb-3 gray-bg p-5" action="login" method="post" onsubmit="return formCheck()">
					<h1 class="mb-4" style="vertical-align: middle; text-align: center; font-size: 25px;">로그인</h1>
					<div class="row">
						<!-- 로그인 입력 -->
						<div class="col-lg-12">
							<input type="text" id="userId" class="form-control mb-3" name="member_id" autocomplete="off" placeholder="아이디"/>
						</div>
						<!-- 비밀번호 입력 -->
						<div class="col-lg-12">
							<input type="password" class="form-control mb-3" name="pw" autocomplete="off" placeholder="비밀번호"/>
						</div>
					</div>
					<div>
						<label for="idSave">아이디 저장 &nbsp;</label>
						<input id="idSave" type="checkbox" name="idSave" checked="checked" /><br/>
						<div class="mb-2">
							<a href="idSerchPage">아이디 찾기</a>&nbsp;&nbsp;
							<a href="pwSerchPage">비밀번호 찾기</a>
						</div>
					</div>
					<div class="d-grid">
						<input class="btn btn-primary btn-block mb-3" type="submit" value="로그인" onclick="login()">
						<input class="btn btn-primary btn-block" type="button" value="회원가입" onclick="location.href='memberPage'">
					</div>
				</form>
			</div>
		</div>
	</div>
	</div>
</section>

<!-- footer -->
<jsp:include page="common/footer.jsp"></jsp:include>

</body>
</html>