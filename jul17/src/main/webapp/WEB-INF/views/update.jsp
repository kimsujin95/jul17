<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>글 수정</title>
<link rel="stylesheet" href="./css/menu.css">
<link rel="stylesheet" href="./css/write.css">
<!-- include libraries(jQuery, bootstrap) -->
<link href="https://stackpath.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css" rel="stylesheet">
<script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>

<!-- include summernote css/js -->
<link href="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote.min.css" rel="stylesheet">
<script src="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote.min.js"></script>
</head>
<body>
<%@ include file="menu.jsp" %>
	<h1>글 수정</h1>
	<div class="write-div">
		<!-- action : ./update, post -->
		<form action="./update" method="post">
			<!-- value 값 체크 -->
			<input type="text" name="btitle" value="${dto.btitle }">
			<!--  bcontent 값 삽입 -->
			<textarea id="summernote" name="bcontent">${dto.bcontent }</textarea>	
			<button class="btn100" type="submit">수정</button>
			<!-- 번호 표시 -->
			<input type="hidden" name="bno" value="${dto.bno }">
		</form>	
		<!-- type="submit" => 제출버튼. 폼데이터로 데이터 전송  -->
	</div>
	
<script type="text/javascript">
/* JQuery문법 : 문서가 모두 로딩되었다면, 익명함수를 실행하세요. */
/* textarea애 서머노트를 실행해주세요. */
	$(document).ready(function() {
		$('#summernote').summernote({
			height: 400
			
		});
	});
</script>	
</body>
</html>