
<!DOCTYPE HTML>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ include file="/WEB-INF/views/layout/include.jsp" %>

<html lang="en">
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
    <link rel="stylesheet" type="text/css" href="http://fonts.googleapis.com/earlyaccess/nanumgothic.css">
    <!-- Vendor CSS-->
    <link rel="stylesheet" type="text/css" href="/theme/assets/css/style.css">
    <link rel="stylesheet" type="text/css" href="/theme/libs/css/bootstrap.min.css">

    <!-- Theme CSS-->
    <link rel="stylesheet" type="text/css" href="/theme/assets/css/font-awesome.min.css">
    <link rel="stylesheet" type="text/css" href="/theme/assets/css/bootstrap-none-responsive.css">
    <link rel="stylesheet" type="text/css" href="/theme/assets/css/style1.css">
    <script type="text/javascript" src="/theme/libs/js/jquery.min.js"></script>
  	<script type="text/javascript" src="/theme/libs/js/bootstrap.min.js"></script>
  	<script type="text/javascript" src="/theme/assets/js/admin.js"></script>
  	<script type="text/javascript" src="http://wcs.naver.net/wcslog.js"></script>
	<script type="text/javascript">
		if(!wcs_add) var wcs_add = {};
		wcs_add["wa"] = "4bb8c27b27c5c0";
		wcs_do();
	</script>
  </head>
  
  <body id="main-page">
    <div class="body">
    	<tiles:insertAttribute name="heading"></tiles:insertAttribute>
    	<tiles:insertAttribute name="body"></tiles:insertAttribute>
      	<tiles:insertAttribute name="footer"></tiles:insertAttribute>
    </div>
    <!-- .popupLoginPage-->
  </body>
 

  <script>
    $(document).ready(function () {
      if($('#main-5-content').is(':visible')){
        $('.confirm-step4').css('display', 'none');
    
    
      }
    });
    
    $(function () {
      $(".btn-close-modal").click(function () {
        $('#popup-confirm-main4').fadeOut(200);
        $('#popup-confirm-main4').removeClass('in');
      });
    });

    $(function () {
      $(".btn-confirm-point").click(function () {
        $('#popup-confirm-main4').fadeOut(200);
        $('#popup-confirm-main4').removeClass('in');
    
        $('html, body').animate({scrollTop:$('#main-5').position().top}, 'slow');
        $("#main-loadding-5").fadeIn(300).delay(5000).fadeOut(300);
    
        $("#main-5-content").hide(0).delay(5000).show(0);
      });
    });
    
    $(document.body).on('click', '.btn-back', function(){
      window.location.replace("/index");
    });

    
  </script>

  <script type="text/javascript" src="/theme/assets/js/ajax.js"></script>
</html>