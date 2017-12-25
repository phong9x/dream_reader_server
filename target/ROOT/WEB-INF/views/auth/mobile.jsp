<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ include file="/WEB-INF/views/layout/include.jsp" %>

  <SCRIPT type="text/javascript">
  
    function onSubmit() {
        var url_post = "/api/ajax/processPayment";
        var userId = "${user.id}";
        var paymethod = $("#paymentMethod").val();
        var money = $("input[name=P_AMT]").val();
        var point = $("input[name=point]").val();
        

        $.ajax({
          type: "POST",
          url: url_post,
          data: {
            userId: userId,
            paymethod: paymethod,
            money: money,
            point: point
          },
          success: function(response) {
        	$("#popup-select-method").modal('hide');
            if (response.status == 200) {
               inicis(response, paymethod);
            } else {
              alert("Error: " + response.message);
            }
          },
          error: function(err) {
            alert("Error: " + err.statusText);
          }
        });

      }


    function inicis(response, paymethod) {
      $('input[name=P_NOTI]').val(response.data+"|"+ $("input[name=point]").val());
      $('input[name=P_OID]').val(response.data);
      var order_form = document.ini;
      var mid = order_form.P_MID.value;
      var urlBase = "${url_base}";
      order_form.P_NEXT_URL.value = urlBase + "mobile/payment/next_card";
      order_form.P_RESERVED.value = "twotrs_isp=Y&amp;block_isp=Y&amp;twotrs_isp_noti=N&amp;apprun_check=Y";

//       if (paymethod == "wcard" || paymethod == "mobile") {
//         order_form.P_NEXT_URL.value = urlBase + "mobile/payment/next_card";
//         order_form.P_RESERVED.value = "twotrs_isp=Y&amp;block_isp=Y&amp;twotrs_isp_noti=N&amp;apprun_check=Y&amp;app_scheme=com.aimmed.hello://";
//       } 
      
      order_form.action = "https://mobile.inicis.com/smart/" + paymethod + "/";
      order_form.submit();
    }

    $(document).on('click','input[name=money]',function(){
        $("input[name=P_AMT]").val($(this).val());
        $("input[name=point]").val($(this).data("id"));
    });

  </SCRIPT>
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
      <form name="ini"  method="post" accept-charset="euc-kr">
            <input type="hidden" name="P_GOODS" value="꿈교환권 충전" />
            <input type="hidden" name="P_AMT" value="550" />
            <input type="hidden" name="P_UNAME" value="${user.username }}" />
            <input type="hidden" name="P_MOBILE" value="" />
            <input type="hidden" name="P_EMAIL" value="${user.username}" />
            <input type="hidden" name="P_MID" value="${MID}" />
            <input type="hidden" name="P_OID" value="" />
            <input type="hidden" name="P_NOTI" value="" />
            <input type="hidden" name="P_NEXT_URL" />
            <input type="hidden" name="P_RETURN_URL" />
            <input type="hidden" name="P_NOTI_URL" />
            <input type="hidden" name="P_HPP_METHOD" value="1" />
            <input type="hidden" name="P_RESERVED" value="apprun_check=Y&amp;app_scheme=com.aimmed.hello://" />
          </form>
    <div id="popup-select-method" class="modal fade" style="z-index:9999">
      <div class="modal-dialog">
        <div class="modal-content">
          <div class="modal-header"><a data-dismiss="modal" aria-label="Close" class="close-popup"><i class="fa fa-close"></i></a>
            <div class="modal-title">결제 방법 고르기</div>
          </div>
          <div class="modal-body">
			  <label for="sel1">겔제 방법을 고르십시오:</label>
			  <select class="form-control" id="paymentMethod" style="width: 30%;margin: 0 auto;margin-top: 14px;">
			    <option value="wcard">신용카드</option>
			    <option value="mobile">휴대폰</option>
			  </select>
		  </div>
          <div class="modal-footer">
          	<button class="btn-blue btn-confirm-point" onclick="onSubmit();">확인</button>
          	<button data-dismiss="modal" class="btn-gray btn-close-modal">취소</button>
          </div>
        </div>
      </div>
    </div>
    
    <script type="text/javascript">
    
    </script>