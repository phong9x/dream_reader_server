<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ include file="/WEB-INF/views/layout/include.jsp" %>
<div class="join find-pwd">
	<div class="container">
		<div class="join-content">
			<div class="title-join">회원가입</div>
			<p class="title-small">회원가입 때 아이디로 사용하신 이메일주소로
			<br/>임시비밀번호를 보내드립니다.</p>
			<form class="form-join">
				<div class="input-item">
					<input type="text" class="form-control" name="username" placeholder="example@example.com">
				</div>
				<div class="input-item">
					<button type="button" onclick="findpw()" class="btn btn-join">비밀번호 찾기</button>
				</div>
			</form>
		</div>
	</div>
</div>

<div id="popup-success" class="modal fade">
   <div class="modal-dialog">
     <div class="modal-content">
       <div class="modal-header"><a data-dismiss="modal" aria-label="Close" class="close-popup"><i class="fa fa-close"></i></a>
       </div>
       <div class="modal-body">회원님의 이메일 주소로 임시비밀번호가 전달되었습니다.</div>
       <div class="modal-footer">
       	<button data-dismiss="modal" class="btn-blue btn-close-modal">확인</button>
       </div>
     </div>
   </div>
 </div>
      
 <div id="popup-failure" class="modal fade">
   <div class="modal-dialog">
     <div class="modal-content">
       <div class="modal-header"><a data-dismiss="modal" aria-label="Close" class="close-popup"><i class="fa fa-close"></i></a>
       </div>
       <div class="modal-body">일치하는 정보가 없습니다.</div>
       <div class="modal-footer">
       	<button data-dismiss="modal" class="btn-blue btn-close-modal">확인</button>
       </div>
     </div>
   </div>
 </div>
<script type="text/javascript">
function findpw() {
	  var url ="/ajax/findpw"
	  var username = $("input[name=username]").val();
		$.ajax({
			type: "POST",
			url: url,
			data: {username: username},
			success: function(response)
			{
				console.log(response);
				if(response.status == 200){
					$("#popup-success").modal("show");
				}else{
					$("#popup-failure").modal("show");
				}
			},
			error : function(e) {
				alert("ERROR: "+ e);
			}
		});
}
</script>