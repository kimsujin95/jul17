<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>board2</title>
<link rel="shortcut icon" href="./img/favicon.ico" type="image/x-icon">
<link rel="icon" href="./img/favicon.ico" type="image/x-icon">
<link rel="stylesheet" href="./css/menu.css">
<link rel="stylesheet" href="./css/board.css">
<script src="./js/jquery-3.7.0.min.js"></script>
<script type="text/javascript">
	$(function() {
		// var list = []; // 보드 내용 가져오기.
		let totalCount = 0;
		let pageNo = 1;
		// ajax호출
		ajax_call(1);
		function ajax_call(pageNo) {
			//			alert(pageNo);
			$.ajax({
				url : "./boardList2", // http://localhost/boardList2?pageNo=1
				type : "get",
				data : {
					"pageNo" : pageNo
				},
				dataType : "json",
				success : function(data) {
					totalCount = data.totalCount;
					pageNo = data.pageNo;
					let startPage = pageNo;
					let endPage = pageNo + 9;
					//				alert("정상입니다. : " + data.list[0].btitle);
					let list = data.list;
					$(".tableHead").empty();// 수정했습니다.
					$(".paging").empty();// 수정했습니다.
					let html = "";
					
					// foreach문
					$.each(list, function(index) {
						html += "<tr>";
						html += "<td>" + list[index].bno + "</td>";
						html += "<td>" + list[index].btitle + "</td>";
						html += "<td>" + list[index].m_name + "</td>";
						html += "<td>" + list[index].bdate + "</td>";
						html += "<td>" + list[index].blike + "</td>";
						html += "</tr>";
					});
					$(".tableHead").append(html);
					
					//				console.log(lists);

					//		alert(list[0].btitle);	
					// 반복문을 통해 HTML태그안에 리스트배열의 i 인덱스로부터 list.length까지 각 컬럼들의 값을 적용하였다. 

					// 페이징하기
					// $(".paging").text(data.pageNo + " : " + data.totalCount);
					let pages = totalCount / 10;
					// totalCount 나누기 10 했을 때 나머지가 있으면 pages + 1해주세요.
					if(totalCount % 10 != 0) { 
						pages += 1;
					}
					startPage = pageNo;
					endPage = startPage + 10 < pages ? startPage + 9 : pages; // 한 화면에 나올 페이지 수
					
					
					// << < 1 2 3 4 5 6 7 8 9 10 > >>

					if(pageNo - 10 > 0){
						$(".paging").append("<button class='start'>◀◀</button>");
					}else{
						$(".paging").append("<button disabled='disabled'>◀◀</button>");
					}
					if(pageNo - 1 > 0){
						$(".paging").append("<button class='backward'>◀</button>");
					}else{
						$(".paging").append("<button disabled='disabled'>◀</button>");
					}
					for (let i=startPage; i <= endPage; i++) {
						$(".paging").append("<button type='button' class='page'>" + i + "</button>");
					}
					if(pageNo + 1 < pages){						
						$(".paging").append("<button class='forward'>▶</button>");
					}else{
						$(".paging").append("<button disabled='disabled'>▶</button>");
					}
					if(pageNo + 10 < pages){
						$(".paging").append("<button class='end'>▶▶</button>");
					}else{
						$(".paging").append("<button disabled='disabled'>▶▶</button>");
					}
					
				},
				error : function(error) {
					alert("에러가 발생했습니다." + error);
				}
			}); // ajax end			
		} // ajax_call

		$(document).on("click", ".page", function() {//동적으로 생성된 버튼 클릭하기
			pageNo = $(this).text();
			ajax_call(pageNo);
		});
		$(document).on("click", ".start", function(){
			pageNo = pageNo - 10;
			ajax_call(pageNo);
		});
		$(document).on("click", ".backward", function(){
			pageNo = pageNo - 1;
			ajax_call(pageNo);
		});
		$(document).on("click", ".forward", function(){
			pageNo = pageNo + 1;
			ajax_call(pageNo);
		});
		$(document).on("click", ".end", function(){
			pageNo = pageNo + 10;
			ajax_call(pageNo);
		});
		/* const : 업데이트도, 재선언도 불가능하다.		
		         : 선언된 변수의 값이 해당 범위 내에서 동일하게 유지됨을 의미합니다.
		         
		   const로 지정한 list 변수를 배열로 0인덱스부터 9까지 각 한 행을 대입한다.
		   		 
		const list = [ {
			bno : 10,
			btitle : '제목입니다',
			m_name : '홍길동',
			bdate : '2023-08-02',
			blike : 15
		}, {
			bno : 9,
			btitle : '제목입니다',
			m_name : '홍길동',
			bdate : '2023-08-02',
			blike : 15
		}, {
			bno : 8,
			btitle : '제목입니다',
			m_name : '홍길동',
			bdate : '2023-08-02',
			blike : 15
		}, {
			bno : 7,
			btitle : '제목입니다',
			m_name : '홍길동',
			bdate : '2023-08-02',
			blike : 15
		}, {
			bno : 6,
			btitle : '제목입니다',
			m_name : '홍길동',
			bdate : '2023-08-02',
			blike : 15
		}, {
			bno : 5,
			btitle : '제목입니다',
			m_name : '홍길동',
			bdate : '2023-08-02',
			blike : 15
		}, {
			bno : 4,
			btitle : '제목입니다',
			m_name : '홍길동',
			bdate : '2023-08-02',
			blike : 15
		}, {
			bno : 3,
			btitle : '제목입니다',
			m_name : '홍길동',
			bdate : '2023-08-02',
			blike : 15
		}, {
			bno : 2,
			btitle : '제목입니다',
			m_name : '홍길동',
			bdate : '2023-08-02',
			blike : 15
		}, {
			bno : 1,
			btitle : '제목입니다',
			m_name : '홍길동',
			bdate : '2023-08-02',
			blike : 15
		} ];
		 */
	});
</script>
</head>
<body>
	<%@ include file="menu.jsp"%>
	<div class="board-div">
		<h1>보드2</h1>
		<table class="tableHead">
			<thead>
				<tr>
					<td>번호</td>
					<td>제목</td>
					<td>글쓴이</td>
					<td>날짜</td>
					<td>읽음</td>
				</tr>
			</thead>
			<tbody class="tableHead"></tbody>
		</table>
		<br>
		<div class="paging" style="text-align: center;"></div>
	</div>
</body>
</html>
