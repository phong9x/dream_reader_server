<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ include file="/WEB-INF/views/layout/include.jsp" %>
<div class="join">
    		<div class="container">
    			<div class="join-content mypage">
    				<div class="title-join">마이페이지</div>
    				<form class="form-join" action="/auth/mypage" id="form-mypage"   method="POST"  >
    					<div class="input-item">
    					<!-- 	<span class='error id-error'>아이디로 사용하실 이메일 주소를 입력해주세요</span> -->
    						<label class="label-input">
    							아이디 (이메일)
    							
    						</label>
    						<label class="label-input" style="float: right;margin-right: 80px">
    							${user.username }
    						</label>
    					</div>
    					<div class="input-item ">
    						<!-- <span class='error phone-error'>핸드폰번호를 입력해주세요</span> -->
    						<label class="label-input">
    							휴대폰번호
    						</label>
    						<label class="label-input" style="float: right;margin-right: 80px">
    							${user.phone }
    						</label>
    						
    					</div>
    					<div class="input-item">
    						<!-- <span class='error pass-error1'>비밀번호를 입력해주세요</span> -->
    						<label class="label-input">
    							기존 비밀번호
    						</label>
    						<input type="password" name="password" class="form-control" style="font-family: Arial">
    					</div>
    					<div class="input-item">
    						<label class="label-input">
    							새 비밀번호
    						</label>
    						<input type="password" name="newPassword" class="form-control" id="input3" style="font-family: Arial">
    					</div>
    					
    					<div class="input-item">
    						<label class="label-input">
    							새 비밀번호 확인
    						</label>
    						<input type="password" name="newPassword2" class="form-control" id="input3" style="font-family: Arial">
    					</div>

   						<p class="color-red text-center" >
   							결제취소는 고객센터(070-4367-2965)로 문의바랍니다.
   						</p>


    					<div class="input-item">
    						<button id="join-submit" type="button"  class="btn btn-join "  onclick="checkForm()">저장</button>
    					</div>
    					
    					<div class="text-center"><a href="/auth/withdraw" style="text-decoration: underline;">회원탈퇴</a></div>
    					
    					<input type="hidden" name="userId" value="${user.id }"/>
    				</form>
    			</div>
    		</div>
    	</div>
	

	 <div id="popupPasswordFail" class="modal fade">
        <div class="modal-dialog">
          <div class="modal-content">
            <div class="modal-header"><a data-dismiss="modal" aria-label="Close" class="close-popup"><i class="fa fa-close"></i></a>
            </div>
            <div class="modal-body">기존 비밀번호가 일치하지 않습니다. 다시 확인해주세요.</div>
            <div class="modal-footer">
            	<a data-dismiss="modal" class="btn-gray btn-close-modal">확인</a>
            </div>
          </div>
        </div>
      </div>
      
      <div id="popupPasswordNotMatch" class="modal fade">
        <div class="modal-dialog">
          <div class="modal-content">
            <div class="modal-header"><a data-dismiss="modal" aria-label="Close" class="close-popup"><i class="fa fa-close"></i></a>
            </div>
            <div class="modal-body">새 비밀번호가 일치하지 않습니다. 다시 입력해주세요.</div>
            <div class="modal-footer">
            	<a data-dismiss="modal" class="btn-gray btn-close-modal">확인</a>
            </div>
          </div>
        </div>
      </div>
      
      <div id="popupSuccess" class="modal fade">
        <div class="modal-dialog">
          <div class="modal-content">
            <div class="modal-header"><a data-dismiss="modal" aria-label="Close" class="close-popup"><i class="fa fa-close"></i></a>
            </div>
            <div class="modal-body">저장되었습니다.</div>
            <div class="modal-footer">
            	<a data-dismiss="modal" class="btn-gray btn-close-modal">확인</a>
            </div>
          </div>
        </div>
      </div>
      
      <c:if test="${success==1 }">
	      <script type="text/javascript">
		      setTimeout(function(){
		    	    $('#popupSuccess').modal("show");
		    	}, 100);
	      </script>
      </c:if>
  	  <script type="text/javascript">
		 
		  function checkForm() {
			  var url ="/ajax/checkPassword"
				  var userId = $("input[name=userId]").val();
				  var password = $("input[name=password]").val();
				  var newPassword = $("input[name=newPassword]").val();
				  var newPassword2 = $("input[name=newPassword2]").val();
					$.ajax({
						type: "POST",
						url: url,
						data: {userId: userId, password: password},
						success: function(response)
						{
							console.log(response);
							if(response.status == 200){
								if((newPassword == newPassword2)&& newPassword2 != ''){
									console.log(111);
									$('#form-mypage').submit();
								}else{
									$('#popupPasswordNotMatch').modal();
								}
							}else{
								$('#popupPasswordFail').modal();
							}
						},
						error : function(e) {
							alert("ERROR: "+ e);
						}
					});
		  }
		  
		  
		</script>  	