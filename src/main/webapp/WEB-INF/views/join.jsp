<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ include file="/WEB-INF/views/layout/include.jsp" %>
<div class="join">
    		<div class="container">
    			<div class="join-content">
    				<div class="title-join">회원가입</div>
    				<form class="form-join" id="form-join"   method="POST" target="hidden_iframe" novalidate="novalidate" >
    					<iframe name="hidden_iframe" id="hidden_iframe" style="display:none;"></iframe>
    					<div class="input-item ">
    						<label class="label-input">
    							아이디(이메일)
    							<span class='error id-error'>아이디로 사용하실 이메일 주소를 입력해주세요</span>
    						</label>
    						<input type="text" name="username" onmouseover="" class="form-control" id="input1" placeholder="example@example.com">
    					</div>
    					<div class="input-item ">
    						<label class="label-input">
    							핸드폰번호
    							<span class='error phone-error'>핸드폰번호를 입력해주세요</span>
    						</label>
    						<input type="text" name="phone" onmouseover="" class="form-control" id="input1" placeholder="010-2000-1234" >
    					</div>
    					<div class="input-item">
    						<label class="label-input">
    							비밀번호<span class='error pass-error1'>비밀번호를 입력해주세요</span>
    						</label>
    						<input type="password" name="password" class="form-control" style="font-family: Arial">
    					</div>
    					<div class="input-item">
    						<label class="label-input">
    							비밀번호 확인
    						</label>
    						<input type="password" name="password2" class="form-control" id="input3" style="font-family: Arial">
    					</div>
    					
    					<div class="input-checkbox">
    						<span class="check-box-style">
    							<input type="checkbox" id="checkbox1"><label for="checkbox1" class="check"></label>
    						</span>
    						<div class="link-join">
	    						<a target="blank" href="/policy">번호드림 서비스이용약관</a>에 동의합니다.(필수) 
	    						<a target="blank" href="/policy" class="detail-link">보기</a>
    						</div>
    					</div>
    					<div class="input-checkbox">
    						<span class="check-box-style">
    							<input type="checkbox" id="checkbox2">
    							<label for="checkbox2" class="check"></label>
    						</span>
    						<div class="link-join">
    							<a target="blank" href="/privacy">개인정보취급방침</a>에 동의합니다.(필수)
    							<a href="/privacy" target="blank" class="detail-link">보기</a>
    						</div>
    					</div>
    					<div class="input-item">
    						<button id="join-submit" type="button"  class="btn btn-join disabled" disabled="disabled" onclick="register()">가입 완료</button>
    					</div>
    					<input type="hidden" name="userId"/>
    				</form>
    			</div>
    		</div>
    	</div>
	

	 <div id="popupConfirmLogin" class="modal fade">
        <div class="modal-dialog">
          <div class="modal-content">
            <div class="modal-header"><a data-dismiss="modal" aria-label="Close" class="close-popup"><i class="fa fa-close"></i></a>
            </div>
            <div class="modal-body">가입이 완료되었습니다. 꿈교환권 3장이 지급되었습니다.</div>
            <div class="modal-footer">
            	<button class="btn-blue btn-confirm-point" onclick="loginFirst();">확인</button>
            </div>
          </div>
        </div>
      </div>
      
  	  <script type="text/javascript">
		  function isValidEmailAddress(emailAddress) {
		  	    var pattern = new RegExp(/^(("[\w-\s]+")|([\w-]+(?:\.[\w-]+)*)|("[\w-\s]+")([\w-]+(?:\.[\w-]+)*))(@((?:[\w-]+\.)*\w[\w-]{0,66})\.([a-z]{2,6}(?:\.[a-z]{2})?)$)|(@\[?((25[0-5]\.|2[0-4][0-9]\.|1[0-9]{2}\.|[0-9]{1,2}\.))((25[0-5]|2[0-4][0-9]|1[0-9]{2}|[0-9]{1,2})\.){2}(25[0-5]|2[0-4][0-9]|1[0-9]{2}|[0-9]{1,2})\]?$)/i);
		  	    return pattern.test(emailAddress);
		  }
		  
		  function isValidPhone(phone) {
		  	    var pattern =  new RegExp(/[01](0|1|6|7|8|9)[-](\d{4}|\d{3})[-]\d{4}$/g);
		  	    var chkFlg = pattern.test(phone);   
		  	  	if(!chkFlg){
		  	  		return false;
		  	  	}else{
		  	  		return true;
		  	  	}
		  }
		  
		  function register() {
			  var url ="/ajax/register"
			  var username = $("input[name=username]").val();
			  var password = $("input[name=password]").val();
			  var password2 = $("input[name=password2]").val();
			  var phone = $("input[name=phone]").val();
				$.ajax({
					type: "POST",
					url: url,
					data: {username: username, password: password, password2:password2, phone:phone},
					success: function(response)
					{
						console.log(response);
						if(response.status == 200){
							$('input[name=userId]').val(response.data);
							$("#popupConfirmLogin").modal("show")
						}else{
							alert('Error when create');
						}
					},
					error : function(e) {
						alert("ERROR: "+ e);
					}
				});
		  }
		  
		  function loginFirst() {
			  var url ="/ajax/login-first"
			  var userId = $("input[name=userId]").val();
				$.ajax({
					type: "POST",
					url: url,
					data: {userId: userId},
					success: function(response)
					{
						console.log(response);
						if(response.status == 200){
							$("#popupConfirmLogin").modal("hide");
							window.location.replace("/login");
						}else{
							alert('Error when create');
						}
					},
					error : function(e) {
						alert("ERROR: "+ e);
					}
				});
		  }
		  
		  function validate() {
			    var numberNotChecked = $('input:checkbox:not(":checked")').length;
	  			if($(".error" ).length == 0 && numberNotChecked == 0){
	  				$('#join-submit').prop("disabled", false);
	  				$('#join-submit').removeClass('disabled');
	  			}else{
	  				$('#join-submit').prop("disabled", true);
	  				$('#join-submit').addClass('disabled');
	  			}
		  }
		  
		  
		  $("input:checkbox").change(function(){
			  validate()
		    });
		  
		  
	
			$("input[name=username]").keyup(function(){
		        var option = $(this).val();
		        if($(this).val().length > 1) {
		          	$('.id-error').text('');
		          	setTimeout(checkUsername(option), 1000);
		        }else{
		        	$('.id-error').removeClass('success').addClass('error');
		        	$('.id-error').text('아이디로 사용하실 이메일 주소를 입력해주세요.');
		        }
		    });
			
			function checkUsername(option){
		        if(isValidEmailAddress(option) == false){
		        	$('.id-error').removeClass('success').addClass('error');
	          		$('.id-error').text('올바르지 않은 형식입니다.');
	          	}else{
	          		$('.id-error').text('');
          			var url = "/api/ajax/check-exists-username";
          				$.ajax({
          					type: "POST",
          					url: url,
          					data: {username:option},
          					success: function(response)
          					{
          						
          						if(response.status == 100){
          							//fail
          							$('.id-error').removeClass('success').addClass('error');
          							$('.id-error').text('이미 존재하는 아이디입니다.');
          						}else{
          							//success
          							validate();
          							$('.id-error').text('사용 가능한 아이디입니다.');
          							$('.id-error').removeClass('error').addClass('success');
          						}
          					},
          					error : function(e) {
          						console.log("ERROR: ", e);
          					}
          				});
	          		
	          	}
		    };
	
		    $("input[type=password]").keyup(function(){
		        var password1 = $("input[name=password]").val();
		        var password2 = $("input[name=password2]").val();
		        if(password1.length > 1) {
		          	$('.pass-error1').text('');
		          	if(password1 != password2){
		          		$('.pass-error1').removeClass('success').addClass('error');
			        	$('.pass-error1').text('비밀번호가 일치하지 않습니다.');
		          	}else{
		          		//success
						
		          		$('.pass-error1').removeClass('error').addClass('success');
			        	$('.pass-error1').text('비밀번호 일치합니다.');
		          	}
		        }else{
		        	$('.pass-error1').removeClass('success').addClass('error');
		        	$('.pass-error1').text('비밀번호를 입력해주세요.');
		        }
		        validate();
		    });
		    
		    $("input[name=phone]").keyup(function(){
		        var phone = $("input[name=phone]").val();
		        console.log("isValidPhone(phone): "+isValidPhone(phone));
		        if(phone.length > 1) {
		        	if(phone.length ==3 || phone.length ==8){
		        		$("input[name=phone]").val(phone+'-');
		        	}
		        	if(isValidPhone(phone)){
		        		$('.phone-error').removeClass('error').addClass('success');
		        		$('.phone-error').text('사용 가능한 휴대폰번호입니다.');
		        	}else{
		        		$('.phone-error').removeClass('success').addClass('error');
		        		$('.phone-error').text('올바른 휴대폰번호가 아닙니다.');
		        	}
		        }else{
		        	$('.phone-error').removeClass('success').addClass('error');
		        	$('.phone-error').text('핸드폰번호를 입력해주세요');
		        }
		        validate();
		    });
	

		</script>  	