<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ include file="/WEB-INF/views/layout/include.jsp" %>
<script type="text/javascript" src="https://service.iamport.kr/js/iamport.payment-x.y.z.js"></script>
<script language="javascript" type="text/javascript" src="https://stdpay.inicis.com/stdjs/INIStdPay.js" charset="UTF-8"></script>

  <SCRIPT type="text/javascript">
  
    function onSubmit() {
    	var isMobile = (/Mobile/i.test(navigator.userAgent));
    	$("#popup-select-method").modal('hide');
    	if(isMobile){
    		
    		inicisMobile();
    		
    	}else{
    	        var url_post = "/api/ajax/signaturePayment";
    	        var price = $("input[name=P_AMT]").val();
    	        var mid = $("input[name=mid]").val();

    	        $.ajax({
    	          type: "POST",
    	          url: url_post,
    	          data: {
    	            mid: mid,
    	            price: price
    	          },
    	          success: function(response) {
    	            if (response.status == 200) {
    	            	inicisWeb(response);
    	            } else {
    	              alert("Error: " + response.message);
    	            }
    	          },
    	          error: function(err) {
    	            alert("Error: " + err.statusText);
    	          }
    	        });
    	}
      }
    
    function inicisMobile() {
		var paymethod = $("#paymentMethod").val();
        var money = $("input[name=P_AMT]").val();
        var point = $("input[name=point]").val();
        var userId = "${user.id}";
        
        $('input[name=P_NOTI]').val(money+"-"+ $("input[name=point]").val()+"-"+paymethod);
        var order_form = document.mobile;
        var mid = order_form.P_MID.value;
        order_form.P_GOODS.value = "꿈교환권 "+point+"장";
        order_form.P_NEXT_URL.value ="${siteDomain}/auth/paymentMobile/next_card";
        order_form.P_RETURN_URL.value ="${siteDomain}/auth/paymentMobile/next_card";
        order_form.P_NOTI_URL.value ="${siteDomain}/auth/paymentMobile/next_card";
        order_form.P_RESERVED.value = "twotrs_isp=Y&block_isp=Y&twotrs_isp_noti=N&apprun_check=N";

        order_form.action = "https://mobile.inicis.com/smart/" + paymethod + "/";
        order_form.submit();
	 }
    
    function inicisWeb(response) {
    	  var point = $("input[name=point]").val();
          var money = $("input[name=P_AMT]").val();
          var point = $("input[name=point]").val();
	      var order_form = document.web;
	      
	      $("input[name=oid]").val(response.data.oid);
	      $("input[name=signature]").val(response.data.signature);
	      $("input[name=timestamp]").val(response.data.timestamp);
	      $("input[name=goodname]").val("꿈교환권 "+point+"장");
	      $("input[name=merchantData]").val($("input[name=point]").val());
	      $("input[name=gopaymethod]").val($('#paymentMethod').find(':selected').data('id'));
	      $("input[name=returnUrl]").val("${siteDomain}/auth/paymentWeb/returnUrl");
	      $("input[name=closeUrl]").val("${siteDomain}/auth/paymentWeb/close");
	      $("input[name=popupUrl]").val("${siteDomain}/auth/paymentWeb/popup");
	      INIStdPay.pay('paymentWeb');
	 }
    
    $(document).on('click','input[name=money]',function(){
        $("input[name=P_AMT]").val($(this).val());
        $("input[name=price]").val($(this).val());
        $("input[name=point]").val($(this).data("id"));
    });

  </SCRIPT>
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
      <div class="page-name">꿈교환권 구매하기</div>
    </div>
    <div class="header-content header-mobile">
      <div class="logo-container"><a href="/index" class="logo"><img src="/theme/assets/images/logo/logo-mobile.png"></a></div>
      <div class="page-name">꿈해몽 로또번호 추출하기</div>
    </div>
  </div>
</div>
      <div class="page-content pay-container">
        <div class="container">
          <div class="pay-inner row">
            <div class="col-md-4 col-sm-6 col-xs-12 col-item">
              <div class="pay-item">
                <div class="thumb-image">
                  <img src="/theme/assets/images/images-upload/img-pay-1.png"/>
                </div>
                <div class="pay-check">
                  <div class="radio-style-4 pay-check-inner">
                    <input id="radio-5" type="radio" name="money" value="550" data-id="1" checked/>
                    <label for="radio-5" class="after-checkbox">
                    </label>
                  </div>
                </div>
                
              </div>
            </div>
            <div class="col-md-4 col-sm-6 col-xs-12 col-item">
              <div class="pay-item">
                <div class="thumb-image">
                  <img src="/theme/assets/images/images-upload/img-pay-2.png"/>
                </div>
                <div class="pay-check">
                  <div class="radio-style-4 pay-check-inner">
                    <input id="radio-6" type="radio" name="money" value="2530" data-id="5">
                    <label for="radio-6" class="after-checkbox">
                    </label>
                  </div>
                </div>
               
              </div>
            </div>
            <div class="col-md-4 col-sm-6 col-xs-12 col-item">
              <div class="pay-item">
                <div class="thumb-image">
                  <img src="/theme/assets/images/images-upload/img-pay-3.png"/>
                </div>
                <div class="pay-check">
                  <div class="radio-style-4 pay-check-inner">
                    <input id="radio-7" type="radio" name="money" value="4620" data-id="10">
                    <label for="radio-7" class="after-checkbox">
                    </label>
                  </div>
                </div>
                
              </div>
            </div>
            <div class="col-md-4 col-sm-6 col-xs-12 col-item">
              <div class="pay-item">
                <div class="thumb-image">
                  <img src="/theme/assets/images/images-upload/img-pay-4.png"/>
                </div>
                <div class="pay-check">
                  <div class="radio-style-4 pay-check-inner">
                    <input id="radio-8" type="radio" name="money" value="8360" data-id="20">
                    <label for="radio-8" class="after-checkbox">
                    </label>
                  </div>
                </div>
                
              </div>
            </div>
            <div class="col-md-4 col-sm-6 col-xs-12 col-item">
              <div class="pay-item">
                <div class="thumb-image">
                  <img src="/theme/assets/images/images-upload/img-pay-5.png"/>
                </div>
                <div class="pay-check">
                  <div class="radio-style-4 pay-check-inner">
                    <input id="radio-9" type="radio" name="money" value="18700" data-id="50">
                    <label for="radio-9" class="after-checkbox">
                    </label>
                  </div>
                </div>
                
              </div>
            </div>
            <div class="col-md-4 col-sm-6 col-xs-12 col-item">
              <div class="pay-item">
                <div class="thumb-image">
                  <img src="/theme/assets/images/images-upload/img-pay-6.png"/>
                </div>
                <div class="pay-check">
                  <div class="radio-style-4 pay-check-inner">
                    <input id="radio-10" type="radio" name="money" value="33000" data-id="100">
                    <label for="radio-10" class="after-checkbox">
                    </label>
                  </div>
                </div>
              </div>
            </div>
          </div>
          <div class="button-control">
            <button type="button" class="btn-payment" data-toggle="modal" data-target="#popup-select-method">결제하기</button>
          </div>
        </div>
      </div>
      <input type="hidden" name="point" value="1"/>
      <form name="mobile"  method="post" accept-charset="euc-kr">
            <input type="hidden" name="P_GOODS" value="" />
            <input type="hidden" name="P_AMT" value="550" />
            <input type="hidden" name="P_UNAME" value="${buyername }" />
            <input type="hidden" name="P_MOBILE" value="${buyertel }" />
            <input type="hidden" name="P_EMAIL" value="${buyeremail}" />
            <input type="hidden" name="P_MID" value="dreammm645" />
            <input type="hidden" name="P_OID" value="${oid}" />
            <input type="hidden" name="P_NOTI" value="" />
            <input type="hidden" name="P_NEXT_URL" />
            <input type="hidden" name="P_RETURN_URL" />
            <input type="hidden" name="P_NOTI_URL" />
            <input type="hidden" name="P_HPP_METHOD" value="1" />
            <input type="hidden" name="P_RESERVED" value="" />
      </form>
      
      <form name="web" id="paymentWeb" method="post"  accept-charset="euc-kr">
      	   <input type="hidden" name="version" value="1.0" />
           <input type="hidden" name="mid" value="dreammm645" />
           <input type="hidden" name="goodname" value="" />
           <input type="hidden" name="oid" value="" />
           <input type="hidden" name="price" value="550" />
           <input type="hidden" name="currency" value="WON" />
           <input type="hidden" name="buyername" value="${buyername }" />
           <input type="hidden" name="buyertel" value="${buyertel}" />
           <input type="hidden" name="buyeremail" value="${buyeremail}" />
           <input type="hidden" name="signature" value="" />
           <input type="hidden" name="timestamp" value="" />
           <input type="hidden" name="mKey" value="${mKey}" />
           <input type="hidden" name="gopaymethod" value="" />
           <input type="hidden" name="merchantData" value="" />
           <input type="hidden" name="returnUrl" value="" />
           <input type="hidden" name="closeUrl" value="" />
           <input type="hidden" name="popupUrl" value="" />
           <input type="hidden" name="acceptmethod" value="HPP(1):below1000" />
      </form>
    <div id="popup-select-method" class="modal fade" style="z-index:9999">
      <div class="modal-dialog">
        <div class="modal-content">
          <div class="modal-header"><a data-dismiss="modal" aria-label="Close" class="close-popup"><i class="fa fa-close"></i></a>
            <div class="modal-title">결제 방법 고르기</div>
          </div>
          <div class="modal-body">
			  <label for="sel1">결제 방법을 고르십시오</label>
			  <select class="form-control" id="paymentMethod" style="width: 30%;margin: 0 auto;margin-top: 14px;">
			    <option value="wcard" data-id="Card">신용카드</option>
			    <option value="mobile" data-id="HPP">휴대폰</option>
			  </select>
		  </div>
          <div class="modal-footer">
          	<button class="btn-blue btn-confirm-point" onclick="onSubmit();">확인</button>
          	<button data-dismiss="modal" class="btn-gray btn-close-modal">취소</button>
          </div>
        </div>
      </div>
    </div>
    
