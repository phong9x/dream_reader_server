<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ include file="/WEB-INF/views/layout/include.jsp" %>
<div class="join">
    		<div class="container">
    			<div class="join-content">
    				<div class="title-join">로그인</div>
    				<form class="form-join" method="post">
    					<div class="input-item">
    						<label class="label-input">
    							아이디(이메일주소)
    						</label>
    						<input type="text" name="username" class="form-control" value="" placeholder="example@example.com">
    					</div>
    					<div class="input-item">
    						<label class="label-input">
    							비밀번호
    						</label>
    						<input type="password" name="password" class="form-control" value="" style="font-family: Arial">
    					</div>
    					<div class="input-item">
    						<button type="submit" class="btn btn-join">로그인 하기</button>
    					</div>
    					<div class="footer-join">
    						<p>
    							아직 회원이 아니세요? <a href="/join" style="color:blue">회원가입</a>
    						</p>
    						<p>
    							<a href="/findpw" style="color:blue">비밀번호 찾기</a>
    						</p>
    					</div>
    				</form>
    			</div>
    		</div>
    	</div>
    	
   <div id="popup-account-not-match" tabindex="-1" aria-hidden="true" data-backdrop="static" data-keyboard="false" class="modal fade">
        <div class="modal-dialog">
          <div class="modal-content">
            <div class="modal-header-complete"><a data-dismiss="modal" aria-label="Close" class="close-popup"><i class="fa fa-close"></i></a>
            </div>
            <div class="modal-body">아이디와 비밀번호를 다시 확인해주십시오.</div>
            <div class="modal-footer"><button data-dismiss="modal" aria-label="Close" class="btn-blue btn-close-modal">취소</button></div>
          </div>
        </div>
      </div>

      <c:if test="${login_success==0 }">
	      <script type="text/javascript">
		      setTimeout(function(){
		    	    $('#popup-account-not-match').modal("show");
		    	}, 100);
	      </script>
      </c:if>