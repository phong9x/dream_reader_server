<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ include file="/WEB-INF/views/layout/include.jsp" %>
<div class="join">
    		<div class="container">
    			<div class="join-content ">
    				<div class="title-join">회원탈퇴</div>
    				<form class="form-join"  id="form-withdraw"   method="POST"  >
    					
    					<div class="input-item">
    						<!-- <span class='error pass-error1'>비밀번호를 입력해주세요</span> -->
    						<label class="label-input">
    							비밀번호
    						</label>
    						<input type="password" name="password" class="form-control" style="font-family: Arial">
    					</div>

   						<p class="color-red text-center" >
   							회원님의 계정정보 및 기존 꿈교환권 이용혜택이 사라집니다.
							<br/>그래도 탈퇴하시겠습니까?
   						</p>


    					<div class="input-item">
    						<button id="join-submit" type="button"  class="btn btn-join"  onclick="checkForm()">탈퇴하기</button>
    					</div>
    					<c:if test="${user != null }"><input type="hidden" name="userId" value="${user.id }"/></c:if>
    					
    					
    				</form>
    			</div>
    		</div>
    	</div>
	

	 <div id="popupPasswordFail" class="modal fade">
        <div class="modal-dialog">
          <div class="modal-content">
            <div class="modal-header"><a data-dismiss="modal" aria-label="Close" class="close-popup"><i class="fa fa-close"></i></a>
            </div>
            <div class="modal-body">비밀번호가 일치하지 않습니다.</div>
            <div class="modal-footer">
            	<a data-dismiss="modal" class="btn-gray btn-close-modal">확인</a>
            </div>
          </div>
        </div>
      </div>
      
      <div id="popupRequiredPassword" class="modal fade">
        <div class="modal-dialog">
          <div class="modal-content">
            <div class="modal-header"><a data-dismiss="modal" aria-label="Close" class="close-popup"><i class="fa fa-close"></i></a>
            </div>
            <div class="modal-body">비밀번호를 입력해주세요.</div>
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
            <div class="modal-body">탈퇴 처리되었습니다.</div>
            <div class="modal-footer">
            	<a href="/index" class="btn-gray btn-close-modal">확인</a>
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
			  var userId = $("input[name=userId]").val();
			  var password = $("input[name=password]").val();
			 
			  if(password == '' || password == null){
				  console.log(111);
				  $('#popupRequiredPassword').modal();
			  }else{
				  var url ="/ajax/checkPassword"
						$.ajax({
							type: "POST",
							url: url,
							data: {userId: userId, password: password},
							success: function(response)
							{
								console.log(response);
								if(response.status == 200){
										$('#form-withdraw').submit();
								}else{
									$('#popupPasswordFail').modal();
								}
							},
							error : function(e) {
								alert("ERROR: "+ e);
							}
						});
			  }
		  }
		  
		  
		</script>  	