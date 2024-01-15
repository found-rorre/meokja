<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>			<!-- jstl c -->
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>		<!-- jstl fmt -->
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>	<!-- jstl fn -->
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

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
<script src="common/slick-carousel/slick.min.js"></script>		

<script type="text/javascript" src="js/test.js"></script>

</head>
<body>
<!-- header -->
<jsp:include page="common/header.jsp"></jsp:include>

<!-- 메인 -->
<c:set var="count" value="0"/>
<form action="score">
	<c:forEach var="list" items="${memberList.list}">
		<div>
			<input type="text" name="scoreId${count}" value="shjy177">
			<input type="text"   name="manner${count}" value="1">
			<input type="text"   name="promise${count}" value="2">
			<input type="text"   name="clean${count}" value="3">
		</div>
		<br/>
	<c:set var="count" value="${count + 1}"/>
 	</c:forEach>
 	<input type="hidden" id="count" value="${count}">
 	<button type="button" onclick="test()">asdsads</button>
  <input type="submit">
</form>
<!-- footer -->
<jsp:include page="common/footer.jsp"></jsp:include>
</body>
</html>