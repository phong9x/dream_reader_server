<!DOCTYPE HTML>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ include file="/WEB-INF/views/layout/include.jsp" %>

<html>
  <head>
    <meta charset="utf-8">
    <meta name="naver-site-verification" content="b432bc4e906941e6e9f8cabf6edefd495195a34a"/>
	<meta name="robots" content="index,follow">
	<meta name="description" content="번호드림 - 꿈해몽 꿈풀이 로또번호 맞춤제공">
	<meta property="og:type" content="website">
	<meta property="og:title" content="번호드림">
	<meta property="og:description" content="꿈해몽 꿈풀이 로또번호 맞춤제공">
	<meta property="og:url" content="http://dream645.com/theme/assets/images/logo/logo.png">
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <title><tiles:insertAttribute name="title"></tiles:insertAttribute></title>
	<link rel="shortcut icon" href="/theme/assets/images/icons/favicon.ico" type="image/x-icon">
    <!-- Web Fonts-->

    <!-- Vendor CSS-->
    <link rel="stylesheet" type="text/css" href="/theme/libs/css/bootstrap.min.css">

    <!-- Theme CSS-->
    <link rel="stylesheet" type="text/css" href="/theme/assets/css/font-awesome.min.css">
    <link rel="stylesheet" type="text/css" href="/theme/assets/css/bootstrap-none-responsive.css">
    <link rel="stylesheet" type="text/css" href="/theme/assets/css/style.css">
    <link rel="stylesheet" type="text/css" href="/theme/assets/css/style1.css">
    <script type="text/javascript" src="/theme/libs/js/jquery.min.js"></script>
	<script type="text/javascript" src="/theme/libs/js/bootstrap.min.js"></script>
    <script type="text/javascript" src='/theme/assets/js/admin.js'></script>
    <script type="text/javascript" src="http://wcs.naver.net/wcslog.js"></script>
	<script type="text/javascript">
		if(!wcs_add) var wcs_add = {};
		wcs_add["wa"] = "4bb8c27b27c5c0";
		wcs_do();
	</script>
  </head>
  <body class="join-page">
    <div class="body">
      <div class="header-mobile-container">
		  <div class="menu-header">
		    <div class="col-item col-left">
			     <c:choose>
			    	<c:when test="${sessionScope.user != null}">
			    		<a href="#" class="item-link"><i class="icon-flash"></i></a>
			    	</c:when>
			     </c:choose>
		    </div>
		    <div class="col-item col-right">
		      <ul>
			      <c:choose>
			      	<c:when test="${sessionScope.user != null}">
			      		<li style="float: left;"><a href="/auth/pay">꿈교환권 구매</a></li>
			      		<li><a href="/auth/mypage">${sessionScope.user.username} (꿈교환권 <span class="userPoint">${userPoint}</span>장)</a></li>
			      		<li class="active"><a href="/logout">로그아웃</a></li>
			      	</c:when>
			      	<c:otherwise>
			      	    <li><a href="/join" class="link-singin">아직 로그인 안하셨나요?</a></li>
			      		<li class="active"><a href="/login">로그인</a></li>
			      	</c:otherwise>
			      </c:choose>
		    	</ul>
		    </div>
		  </div>
		</div>
  	  <div class="header-container">
        <div class="nav-right">
          <ul>
	          <c:choose>
		      	<c:when test="${sessionScope.user != null}">
		      		<li><a href="/auth/pay">꿈교환권 구매</a></li>
		      		<li><a href="/auth/mypage">${sessionScope.user.username} (꿈교환권 <span class="userPoint">${userPoint}</span>장)</a></li>
		      		<li class="active"><a href="/logout">로그아웃</a></li>
		      	</c:when>
		      	<c:otherwise>
		      		<li class="active"><a href="/login">로그인</a></li>
		      	</c:otherwise>
		      </c:choose>
          </ul>
        </div>
        <div class="container">
          <div class="header-content">
            <div class="logo-container"><a href="/index" class="logo"><img src="/theme/assets/images/logo/logo.png"></a></div>
          </div>
        </div>
      </div>
      <tiles:insertAttribute name="body"></tiles:insertAttribute>
  	  <footer class="footer">
        <div class="container">
	      <div class="footer-content" style="text-align: center;">
	      	<p>번호드림의 꿈을 분석한 정보제공만을 목적으로 하며, 당첨확률 개선서비스가 아닙니다.<br><span class="font-150">ⓒ 2017 번호드림</span></p>
	      	<p>상호명 : 트램스 l 사업자번호 : 105-87-54461 l 대표자 한승상</p>
	      	<p>주소지 : 서울 마포구 성암로 189 601호 l 고객센터 : 070-4367-2965</p>
	      </div>
	    </div>
        <!-- .footer-->
      </footer>
    </div>
	
	  <!-- Gentelella Custom jQuery-->
	
	</body>
</html>