<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>먹장 - 아이디 찾기</title>

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
<script type="text/javascript" src="js/idSerch.js"></script>
<script type="text/javascript" src="js/loginCheck.js"></script>

</head>
<body>

<!-- header -->
<jsp:include page="common/header.jsp"></jsp:include>

<section class="section-padding">
	<div class="container">
		<div class="row justify-content-center">
			<div class="col-lg-6 col-md-8 col-sm-12 col-xs-12">
				<form class="comment-form mb-3 gray-bg p-5" action="idSerch" method="post" onsubmit="return idSerch()">
					<h1 class="mb-4" style="vertical-align: middle; text-align: center; font-size: 25px;">아이디 찾기</h1>
					<div class="row">
						<div class="col-lg-12">
							<input type="text" placeholder="이름" name="name" class="form-control mb-3"/><br/>
						</div>
						<div class="col-lg-6">
							<input type="text" id="jumin1" maxlength="6" value="990609" placeholder="주민번호 앞자리" class="form-control mb-3"/>
						</div>
						<div class="col-lg-6">
							<input type="password" id="jumin2" maxlength="7"  placeholder="뒷자리" value="1216019" class="form-control mb-3"/>
						</div>
					</div>
					<input type="hidden" name="jumin">
					<div class="d-grid">
						<input class="btn btn-primary btn-block mb-3" type="submit" value="아이디 찾기"/>
					</div>
				</form>
			</div>
		</div>
	</div>
</section>

<!-- footer -->
<jsp:include page="common/footer.jsp"></jsp:include>

</body>
</html>
