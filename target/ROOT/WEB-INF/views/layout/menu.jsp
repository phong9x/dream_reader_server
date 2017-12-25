<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ include file="/WEB-INF/views/layout/include.jsp" %>
<div class="page-sidebar-wrapper vetical-menu">
    <div class="page-sidebar navbar-collapse collapse">
      <div class="container">
        <ul data-keep-expanded="false" data-auto-scroll="true" data-slide-speed="200" class="page-sidebar-menu">
          <li class="dropup"><a id="dropdownMenu2" href="#" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false" class="dropdown-toggle"><span class="title">사용자관리</span><i aria-hidden="true" class="fa fa-caret-down"></i></a>
            <ul aria-labelledby="dropdownMenu2" class="dropdown-menu lever1">
              <li>
              	<a href="/admin/user/general/list">일반사용자</a>
              </li>
              <li class="dropdown-submenu"><a tabindex="-1" href="#" class="menu-leve"><span class="title">전문가사용자</span><i aria-hidden="true" class="fa fa-caret-right"></i></a>
                <ul class="dropdown-menu">
                  <li><a tabindex="-1" href="/admin/user/master/request">승인요청리스트</a></li>
                  <li><a tabindex="-1" href="/admin/user/master/aprroval">승인완료리스트</a></li>
                </ul>
              </li>
              <li class="dropdown-submenu"><a tabindex="-1" href="#" class="menu-leve"><span class="title">기관사용자</span><i aria-hidden="true" class="fa fa-caret-right"></i></a>
                <ul class="dropdown-menu">
                  <li><a tabindex="-1" href="/admin/user/center/request">승인 요청 리스트</a></li>
                  <li><a tabindex="-1" href="/admin/user/center/aprroval">승인완료 리스트</a></li>
                </ul>
              </li>
            </ul>
          </li>
          
          <li class="dropup"><a id="dropdownMenu2" href="#" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false" class="dropdown-toggle"><span class="title">교육관리</span><i aria-hidden="true" class="fa fa-caret-down"></i></a>
            <ul aria-labelledby="dropdownMenu2" class="dropdown-menu lever1">
              <li>
              	<a href="/admin/education/prevention">증진 및 예방</a>
              </li>
              <li>
              	<a href="/admin/education/prevention">치료</a>
              </li>
              <li>
              	<a href="/admin/education/prevention">사후관리</a>
              </li>
              <li>
              	<a href="/admin/education/prevention">연구 및 자기계발</a>
              </li>
              <li>
              	<a href="/admin/education/prevention">행정지원</a>
              </li>
            </ul>
          </li>
          
          <li><a href="#"><span class="title">교육관리</span></a></li>

          <li><a href="#"><span class="title">서비스 관리</span></a></li>

          <li><a href="#"><span class="title">Library 관리</span></a></li>

          <li><a href="#"><span class="title">알림장 관리</span></a></li>
        </ul>
      </div>
    </div>
</div>