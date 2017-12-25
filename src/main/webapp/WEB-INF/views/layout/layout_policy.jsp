
<!DOCTYPE HTML>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ include file="/WEB-INF/views/layout/include.jsp" %>
<html lang="en">
  <head>
    <meta charset="utf-8">
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title><tiles:insertAttribute name="title"></tiles:insertAttribute></title>
	<link rel="shortcut icon" href="/theme/assets/images/icons/favicon.ico" type="image/x-icon">
    <!-- Web Fonts-->
    <link rel="stylesheet" type="text/css" href="http://fonts.googleapis.com/earlyaccess/nanumgothic.css">

    <!-- Vendor CSS-->
    <link rel="stylesheet" type="text/css" href="/theme/libs/css/bootstrap.min.css">

    <!-- Theme CSS-->
    <link rel="stylesheet" type="text/css" href="/theme/assets/css/style.css">
    <link rel="stylesheet" type="text/css" href="/theme/assets/css/style1.css">
  </head>
  <body id="main-page" class="privacy">
    <div class="header-container">
      <div class="nav-right">
        <ul>
        </ul>
      </div>
      <div class="container">
        <div class="header-content">
          <div class="logo-container"><a href="#" class="logo"><img src="/theme/assets/images/logo/logo.png"></a></div>
        </div>
      </div>
    </div>

	<tiles:insertAttribute name="body"></tiles:insertAttribute>

    <footer class="footer">
      <div class="container">
        <div class="footer-content">
       		<p>번호드림의 꿈을 분석한 정보제공만을 목적으로 하며, 당첨확률 개선서비스가 아닙니다.<br><span class="font-150">ⓒ 2017 번호드림</span></p>
	      	<p>상호명 : 트램스 l 사업자번호 : 105-87-54461 l 대표자 한승상</p>
	      	<p>주소지 : 서울 마포구 성암로 189 601호 l 고객센터 : 070-4367-2965</p>
        </div>
      </div>
      <!-- .footer-->
      
      
    </footer>
    <!-- .popupLoginPage-->
  </body>
  <script type="text/javascript" src="/theme/libs/js/jquery.min.js"></script>
  <script type="text/javascript" src="/theme/libs/js/bootstrap.min.js"></script>
  <script type="text/javascript" src="/theme/libs/js/jquery.scrollbar.js"></script>
  <script>
    jQuery(document).ready(function(){
        jQuery('.content-privacy').scrollbar();
    });
  </script>
</html>