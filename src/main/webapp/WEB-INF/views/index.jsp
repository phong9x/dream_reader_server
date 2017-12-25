<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ include file="/WEB-INF/views/layout/include.jsp" %>
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
    <div class="header-content header-PC">
      <div class="logo-container"><a href="/index" class="logo"><img src="/theme/assets/images/logo/logo.png"></a></div>
      <div class="page-name">꿈해몽 로또번호<br>추출하기</div>
    </div>
    <div class="header-content header-mobile">
      <div class="logo-container"><a href="/index" class="logo"><img src="/theme/assets/images/logo/logo-mobile.png"></a></div>
      <div class="page-name">꿈해몽 로또번호<br>추출하기</div>
    </div>
  </div>
</div>
<div id="main-1" class="page-content main-container">
        <div class="container">
          <div class="main-content">
            <div class="main-header">
              <div class="main-number">01</div>
              <div class="main-title">좋은꿈 꾸셨나요?</div>
              <div class="main-sub-title">잊혀지기 전에 해몽해보세요!</div>
            </div>
            <div class="list-item-content row">
            <c:forEach items="${listParent }" var="i" varStatus="loop">
	             <div class="item-dream">
	                <div class="radio-style-1">
	                  <input id="radio-parent-${loop.index}" type="radio" name="parentId" value="${i.id }"/>
	                  <label for="radio-parent-${loop.index}" class="after-checkbox">
	                  <div class="item-text">${i.categoryName }</div>
	                  </label>
	                </div>
	              </div>
            </c:forEach>
            </div>
          </div>
        </div>
      </div>
      
      <!-- Category 2-->
      
      <div id="main-2" class="page-content main-sub-1 main-container">
        <div class="container">   
          <div class="main-content">
            <div class="main-header">
              <div class="main-number">02</div>
              <div class="main-title">꿈에 무엇이 나왔나요?</div>
              <div class="main-sub-title">되도록 남에겐 얘기하지 않는 것이 좋습니다</div>
            </div>
            <div class="list-item-content row" id="step2">
            
              
            </div>
          </div>
        </div>
      </div>
      
      <!-- content-->
      <div id="main-3" class="page-content main-sub-2 main-container">
        <div class="container">   
          <div class="main-content">
            <div class="main-header">
              <div class="main-number">03</div>
              <div class="main-title">정확히 어떤 꿈이었나요?</div>
              <div class="main-sub-title">꿈 꾼 시각과 가까울수록 효과가 좋습니다</div>
            </div>
            <div class="list-item-content row" id="step3">
            

            </div>
          </div>
        </div>
      </div>
      <div id="main-4" class="page-content main-container">
        <div id="main-loadding-4">
          <div class="container">
            <div class="main-content">
              <div class="icon-loadding"><img src="/theme/assets/images/icons/loading.gif"></div>
              <div class="status-waitting">해몽 중...</div>
              <div class="notice">모든 꿈에는 운명과 가치가 있습니다 <br> 꿈이 알려주는 행운을 놓치지 마세요</div>
            </div>
          </div>
        </div>
        <div id="main-4-content">
          <div class="container">
            <div class="main-content">
              <div class="title-main-4"> <span class="text-title">꿈해몽 결과</span></div>
              <div class="content-detail">재주와 지혜가 뛰어난 사람, 부귀한 사람, 일거리, 재물, 명예, 작품 등의 상징이다.<br>기린은 전설적인 영험한 동물로 알려져 있어 당신의 명성이 천하에 떨칠 대단한 길몽이며, 미혼여성이 이 꿈을 꾸면<br>장래 큰 인물이 될 남성과 맺어지고, 임신부는 현명한 인물을 낳으며 당신 가정이 태평성대를 누리게 된다.</div>
              <div class="button-control" id="button-confirm-step4">
                <button class="btn-confirm confirm-step4" >내 꿈을 로또번호로 교환하기</button>
                <input type="hidden" name="userId" value="${sessionScope.user.id}"/>
              </div>
            </div>
          </div>
        </div>
      </div>
     
      <div id="main-5" class="page-content main-container">
        <div id="main-loadding-5">
          <div class="container">
            <div class="main-content">
              <div class="icon-loadding"><img src="/theme/assets/images/icons/loading.gif"></div>
              <div class="status-waitting">교환 중..</div>
              <div class="notice">정신을 집중해주세요.<br>꿈이 알려주는 방향의 번호를 찾고 있습니다.   </div>
            </div>
          </div>
        </div>
        <!-- result-->
        <div id="main-5-content">
          <div class="container">
            <div class="main-title">당신의 꿈에 숨어있던 로또번호</div>
            <div class="main-content">
              <div class="list-ball-number">
                <div class="item-ball " id="number1"></div>
                <div class="item-ball " id="number2"></div>
                <div class="item-ball " id="number3"></div>
                <div class="item-ball " id="number4"></div>
                <div class="item-ball " id="number5"></div>
                <div class="item-ball " id="number6"></div>
              </div>
              <div class="button-control">
                <button class="btn-gray btn-back">처음부터 다시하기</button>
              </div>
            </div>
          </div>
        </div>
      </div>
      
      <div id="popup-require-login" tabindex="-1" aria-hidden="true" data-backdrop="static" data-keyboard="false" class="modal fade">
        <div class="modal-dialog">
          <div class="modal-content">
            <div class="modal-header-complete"><a data-dismiss="modal" aria-label="Close" class="close-popup"><i class="fa fa-close"></i></a>
            </div>
            <div class="modal-body">로그인이 필요합니다.</div>
            <div class="modal-footer">
            
            <a data-dismiss="modal" aria-label="Close" class="btn-gray btn-close-modal">취소</a>
            <a href="/login" class="btn-blue btn-close-modal">확인</a>
            </div>
          </div>
        </div>
      </div>
      
      <div id="popup-not-coin" tabindex="-1" aria-hidden="true" data-backdrop="static" data-keyboard="false" class="modal fade">
        <div class="modal-dialog">
          <div class="modal-content">
            <div class="modal-header-complete"><a data-dismiss="modal" aria-label="Close" class="close-popup"><i class="fa fa-close"></i></a>
            </div>
            <div class="modal-body">꿈교환권이 부족합니다.</div>
            <div class="modal-footer"><a data-dismiss="modal" aria-label="Close" class="btn-blue btn-close-modal">확인</a></div>
          </div>
        </div>
      </div>
      
      <div id="popup-success" class="modal fade">
        <div class="modal-dialog">
          <div class="modal-content">
            <div class="modal-header"><a data-dismiss="modal" aria-label="Close" class="close-popup"><i class="fa fa-close"></i></a>
              <div class="modal-title">투표 참여 완료</div>
            </div>
            <div class="modal-body">꿈교환권 <span class="userPoint">${userPoint}</span>장 중에 1장을 사용하시겠습니까?</div>
            <div class="modal-footer">
            	<button class="btn-blue btn-confirm-point" id="btn-get-lucky-number">확인</button>
            	<a data-dismiss="modal" class="btn-gray btn-close-modal">취소</a>
            </div>
          </div>
        </div>
      </div>