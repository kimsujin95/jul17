<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<style type="text/css">
@font-face {
    font-family: 'IAMAPLAYER';
    src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_2307-2@1.0/IAMAPLAYER.woff2') format('woff2');
    font-weight: normal;
    font-style: normal;
}

body {
	margin: 0;
	padding: 0;
	font-family: 'IAMAPLAYER';
}

nav {
	position: fixed;
	top: 0;
	width: 100%;
	height: 50px;
	background-color: #EDE7F6;
}

nav ul {
	margin: 0;
	padding: 0;
}

nav li {
	list-style: none; /* li앞에 원을 없애줍니다. */
	float: left; 
	width: 100px;
	height: 50px;
	line-height: 50px;
	text-align: center;	
}

nav li:hover {
	/* background-color: blue; */
	color: white;
	font-size: large;
	font-weight: bold;
}
</style>
	<nav>
		<ul>
			<li onclick="link('index')">메인</li>
			<li onclick="link('board')">게시판</li>
			<li onclick="link('board2')">게시판2</li>
			<li onclick="link('mooni')">문의사항</li>
			<li onclick="link('notice')">공지</li>
		</ul>
	</nav>
	<div style="height: 50px; width: 100%;"></div>
	<script>
	function link(url) {
		location.href="./" + url;
	}
	</script>
	