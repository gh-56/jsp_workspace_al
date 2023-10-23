<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<style>
	lgh{
		padding: 10px;
		display:block;
	}
	#lghId{
		color:white;
	}
	.lghClass{
		background:black;
	}
</style>
<!-- xml.jsp -->
<h1>XML Generator</h1>
<!-- custom tag 추가 -->
<jsp:element name="lgh">
	<jsp:attribute name="id">
		lghId
	</jsp:attribute>
	<jsp:attribute name="class">
		lghClass
	</jsp:attribute>
	<jsp:body>
		lgh tag를 이용한 태그 생성 lgh id속성값은 lghId 
	</jsp:body>
</jsp:element>

<br/>

<lgh id="lghId" class="lghClass">
	lgh tag를 이용한 태그 생성 lgh id속성값은 lghId
</lgh>









