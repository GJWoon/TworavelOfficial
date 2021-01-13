<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/jck_main.css">
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>제목 수정해주세요.</title>
<style>
* {
	outline: none;
	padding: 0;
	margin: 0;
	border: 0;
	border-collapse: collapse;
	box-sizing: border-box;
	text-decoration: none;
}

html {
	height: 100%;
}

body {
	height: 100%;
}

.jck_wrap {
	min-height: 100%;
	position: relative;
	padding-bottom: 200px;
}

#kdy-magazine {
	display: flex;
	justify-content: center;
	width: 100%; padding: 80px 0px;
}

#magazine-wrap {
/* 	flex-direction: culumn;
 */	
}

#magazine-titleindex {
	
}
</style>
<script
	src="${pageContext.request.contextPath }/resources/js/jquery-3.5.1.js"></script>
</head>
<body>
	<div class="jck_wrap">
		<jsp:include page="header.jsp" />
		<div id="kdy-magazine">
			<div id="magazine-wrap">
				<img id="title-index" width="1000px" height="562.5px"
					src="${pageContext.request.contextPath}/resources/images/2magazinemain.png">
				<div style="width: 1000px; height: auto; margin-top: 10px;">
					<p id="introduce">
						1. 자기소개<br>
					</p>
					<p class="introduce-cont">
						먼저 자기소개를 할게 Tworavel = together travel이야<br>누구나 보면 알아차릴 쉬운
						이름이지!<br>누군가와 같이 여행할 생각에 가슴이 두근두근하지 않아 친구?
					</p>
				</div>
				<div style="width: 1000px; height: auto; margin-top: 10px;">
					<p id="concept">
						2. 여행 주제<br>
					</p>
					<p class="concept-cont">
						이번 호의 여행 주제는 길이야<br>거리의 Sequence를 따라 걸어가며<br>여행지의 거리에서
						두근거림을 느낄 수 있는 곳으로 가보자!
					</p>
				</div>
				<div style="width: 1000px; height: auto; margin-top: 10px;">
					<p id="destination" style="font-size: 24px; with: 900px;">
						3.여행지
					</p><br>
					<p class="concept-cont">
						우리나라의 멋진 길 중에서 처음은<br>한국의 수도! 서울의 익선동 한옥마을로 정했어<br>서울에서
						요즘 가장 핫한 한옥마을의 골목길로 가보자!
					</p>
					<p class="concept-cont-interactive">
						interactive 한 공간 <br>
						앞에 무엇이 오는지 알 수 없으며, 걸음에 맞춰 환경이 계속 변화하는 곳을 말한다. 즉, 공간과 사람이 상호작용을 할 수 있는 공간이다.
					</p>
					<img id="title-index" width="1000px" height="562.5px"
					src="${pageContext.request.contextPath}/resources/images/2magazinemap.png">
				<div style="width: 1000px; height: auto; margin-top: 10px;">
				</div>
			</div>
			<div id="">
				<img id="" width="" height="" src="">
				<p></p>
			</div>


		</div>
		<jsp:include page="footer.jsp" />
	</div>
</body>
</html>
