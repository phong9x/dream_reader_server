$(document.body).on('change', '.radio-style-1 input[name="parentId"]', function(){
      var parentId = $(this).val();
      var url ="/ajax/getChildCategory"
		$.ajax({
			type: "POST",
			url: url,
			data: {parentId: parentId},
			success: function(response)
			{
				
				if(response.status == 200){
					var html="";
					for(var i = 0; i< response.data.length; i++){
						html+="<div class='item-dream item-dream-step2'>";
							html+="<div class='radio-style-2'>";
							  html+="<input id='radio-child-"+response.data[i].id+"' type='radio' name='childId' value='"+response.data[i].id+"'>";
							  html+="<label for='radio-child-"+response.data[i].id+"' class='after-checkbox'>";
								html+="<div class='item-text'>"+response.data[i].categoryName+"</div>";
							  html+="</label>";
							html+="</div>";
						html+="</div>";
						
					}
					$('#step2').html(html);
					$('#main-2').fadeOut();
					$('#main-2').fadeIn(300);
				    $('html, body').animate({scrollTop:$('#main-2').position().top}, 'slow');
				    console.log('finish');
				}else{
					alert('Error No ParentId');
				}
			},
			error : function(e) {
				alert("ERROR: "+ e);
				}
			});
});

$(document.body).on('change', '.radio-style-2 input[name="childId"]', function(){
    var childId = $(this).val();
    var url ="/ajax/getContent"
		$.ajax({
			type: "POST",
			url: url,
			data: {childId: childId},
			success: function(response)
			{
				
				if(response.status == 200){
					var html="";
					for(var i = 0; i< response.data.length; i++){
						html+="<div class='item-dream item-dream-step3'>";
							html+="<div class='radio-style-3'>";
							  html+="<input id='radio-title-"+response.data[i].id+"' type='radio' name='contentId' value='"+response.data[i].id+"'>";
							  html+="<label for='radio-title-"+response.data[i].id+"' class='after-checkbox'>";
								html+="<div class='item-text'>"+response.data[i].title+"</div>";
							  html+="</label>";
							html+="</div>";
						html+="</div>";
					}
					$('#step3').html(html);
					$('#main-3').fadeIn(300);
				    $('html, body').animate({scrollTop:$('#main-3').position().top}, 'slow');
				}else{
					alert('Error No ParentId');
				}
			},
			error : function(e) {
				alert("ERROR: "+ e);
				}
			});
  
});

$(document.body).on('change', '.radio-style-3 input[name="contentId"]', function(){
	var contentId = $(this).val();
    var url ="/ajax/getBody"
	$.ajax({
		type: "POST",
		url: url,
		data: {contentId: contentId},
		success: function(response)
		{
			if(response.status == 200){
				$('.content-detail').html(response.data.body);
				$('html, body').animate({scrollTop:$('#main-4').position().top}, 'slow');
			    $("#main-loadding-4").fadeIn(0).delay(5000).fadeOut(0);
			    $("#main-4-content").hide(0).delay(5000).show(0);
			    window.setTimeout(function(){
			    	$('html, body').animate({scrollTop:$('.footer').position().top}, 'slow');
			        },5000);
			   
			}else{
				alert('Error No ParentId');
			}
		},
		error : function(e) {
			alert("ERROR: "+ e);
			}
		});
	
    

  });

//$(document.body).on('click', '.confirm-step4', function(){
//    var point_number = 3;
//    if(point_number == 0){
//      $('#popup-confirm-main4-none').css('display', 'block');
//      $('#popup-confirm-main4-none').addClass('in');
//    }
//    else{
//      $('#popup-confirm-main4-none').css('display', 'none');
//      $('#popup-confirm-main4-none').removeClass('in');
//      $('#popup-confirm-main4').fadeIn(200);
//      $('#popup-confirm-main4').addClass('in');
//    }
//  });

$(document.body).on('click', '.confirm-step4', function(){
	var userId = $('input[name=userId]').val();
	console.log('userId:'+userId);
	if(userId == '' || userId == null){
		$("#popup-require-login").modal("show");
	}else{
		 var url ="/ajax/checkCoin"
				$.ajax({
					type: "POST",
					url: url,
					data: {userId: userId},
					success: function(response)
					{
						console.log("ajx running");
						if(response.status == 200){
							if(response.data >0){
								$("#popup-success").modal("show");
							}else{
								$("#popup-not-coin").modal("show");
								
							}
							$('#popup-confirm-main4-none').css('display', 'block');
							$('#popup-confirm-main4-none').addClass('in');
						}else{
							alert('Error No Id');
						}
					},
					error : function(e) {
						alert("ERROR: "+ e);
						}
					});
	}
	
  });


$(document.body).on('click', '#btn-get-lucky-number', function(){
 var userId = $('input[name=userId]').val();
 var url ="/ajax/getLuckyNumber";
 $('.btn-confirm.confirm-step4').remove();
 $("#popup-success").modal("hide");
		$.ajax({
			type: "POST",
			url: url,
			data: {userId: userId},
			success: function(response)
			{
				console.log("ajx running");
				console.log(response.data.userPoint);
				
				if(response.status == 200){
					for(var i = 0; i< response.data.list.length; i++){
						$('#number'+(i+1)).attr('class', 'item-ball');
						$('#number'+(i+1)).text(response.data.list[i].number);
						if(response.data.list[i].type==1){
							$('#number'+(i+1)).addClass("orange-ball");
						}
						if(response.data.list[i].type==2){
							$('#number'+(i+1)).addClass("blue-ball");
						}
						if(response.data.list[i].type==3){
							$('#number'+(i+1)).addClass("red-ball");
						}
						if(response.data.list[i].type==4){
							$('#number'+(i+1)).addClass("green-ball");
						}
						if(response.data.list[i].type==5){
							$('#number'+(i+1)).addClass("gray-ball");
						}
					}
			      $('#popup-confirm-main4-none').css('display', 'none');
			      $('#popup-confirm-main4-none').removeClass('in');
			      $('#popup-confirm-main4').fadeIn(200);
			      $('#popup-confirm-main4').addClass('in');
			      $('span.userPoint').text(response.data.userPoint);
			      window.setTimeout(function(){
				    $('html, body').animate({scrollTop:$('.footer').position().top}, 'slow');
				  },5000);
			      
				}else{
					alert('Error No Point');
				}
			},
			error : function(e) {
				alert("ERROR: "+ e);
				}
			});

  });
