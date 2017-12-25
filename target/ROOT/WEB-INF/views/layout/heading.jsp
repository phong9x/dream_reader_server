<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ include file="/WEB-INF/views/layout/include.jsp" %>
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

