$(document).ready(function(){
	var memid = $('#couponData').data('memid');
	$('.couponImg').each(function(){
		$(this).click(function(){
			var data1 = {memid: memid, coupon_name:"상시 할인 쿠폰(1000원)", coupon_value1:"1000", coupon_value2:"0"};
			var data2 = {memid: memid, coupon_name:"상시 할인 쿠폰(3000원)", coupon_value1:"3000", coupon_value2:"0"};
			var data3 = {memid: memid, coupon_name:"상시 할인 쿠폰(5000원)", coupon_value1:"5000", coupon_value2:"0"};
			var data4 = {memid: memid, coupon_name:"상시 할인 쿠폰(장바구니5%할인)", coupon_value1:"0", coupon_value2:"5"}; 
			var data5 = {memid: memid, coupon_name:"상시 할인 쿠폰(장바구니10%할인)", coupon_value1:"0", coupon_value2:"10"}; 
			var data6 = {memid: memid, coupon_name:"상시 할인 쿠폰(장바구니15%할인)", coupon_value1:"0", coupon_value2:"15"}; 
			if(memid == ""){
				alert("로그인 후에 이용바랍니다.");
				$("#couponModal").modal("hide");
				setTimeout('$("#loginModal").modal()', 400);
			}else{
				var id = $(this).attr('id');//쿠폰1
				if(id == "coupon1"){
					$.get('couponInsert.ym', data1, function(re){
						couponAlert(re);
					});
				}else if(id == "coupon2"){
					$.get('couponInsert.ym', data2, function(re){
						couponAlert(re);
					});
				}else if(id == "coupon3"){
					$.get('couponInsert.ym', data3, function(re){
						couponAlert(re);
					});
				}else if(id == "coupon4"){
					$.get('couponInsert.ym', data4, function(re){
						couponAlert(re);
					});
				}else if(id == "coupon5"){
					$.get('couponInsert.ym', data5, function(re){
						couponAlert(re);
					});
				}else if(id == "coupon6"){
					$.get('couponInsert.ym', data6, function(re){
						couponAlert(re);
					});
				}
			}
		});
	});
	
	$("span.glyphicon.glyphicon-remove").click(function(){
		$(this).parent().slideUp(1000);
	});
    $("#login").click(function(){
        $("#loginModal").modal();
    });
    $("#topinfoText").click(function(){
        $("#couponModal").modal();
    });
    
	$.get('/cartCountCheck.ym',{memid:memid},function(data){
		var cnt = parseInt(data);
		$('.bubble').html(cnt);
	});
});

/*function btnClick(memid, result){
	var data1 = {memid: memid, coupon_name:"이벤트 쿠폰_숫자뽑기(1000원)", coupon_value1:"1000", coupon_value2:"0"};
	var data2 = {memid: memid, coupon_name:"이벤트 쿠폰_퀴즈풀기(1000원)", coupon_value1:"1000", coupon_value2:"0"};
	if(parseInt(result)>=50){
		alert('꽝');
	}else if(parseInt(result)<50){
		alert('축하드립니다! 이벤트 쿠폰에 당첨되셨습니다!!');
		$.get('couponInsert.ym', data1, function(re){
			couponAlert(re);
		});
	}
}*/

function btnClick(memid){
	var data1 = {memid: memid, coupon_name:"이벤트 쿠폰_숫자뽑기(1000원 할인)", coupon_value1:"1000", coupon_value2:"0"};
	$.get('/zz.jh',function(data){
		alert("결과:"+parseInt(data));
		$('#eventResult').text(data);
			if(parseInt(data)>=50){
				$('#eventResult').text("꽝입니다!!!");
			}else if(parseInt(data)<50){
				$('#eventResult').text("축하드립니다! 이벤트 쿠폰에 당첨되셨습니다!!!");
				$.get('couponInsert.ym', data1, function(re){
					couponAlert(re);
				});
			}
	});
	
}

function couponAlert(re){
	var couponcnt = parseInt(re);
	if(couponcnt > 0){
		var result = confirm("이미 해당 쿠폰을 받으셨습니다. 쿠폰함으로 이동하시겠습니까?");
		if(result){location.href="/couponPage.ym";}
	}else{
		var result = confirm("쿠폰이 쿠폰함에 담겼습니다. 쿠폰함으로 이동하시겠습니까?");
		if(result){location.href="/couponPage.ym";}
	}
}


function loginCheck(memid){
	if(memid != ""){
		location.href="/cartPage.ym"
	}else{
		$("#loginModal").modal();
	}
}

function loginCheckforInfo(memid){
	if(memid != ""){
		location.href="/info.do"
	}else{
		$("#loginModal").modal();
	}
}


function loginCheckforcoupon(memid){
	if(memid != ""){
		location.href="/couponPage.ym"
	}else{
		$("#loginModal").modal();
	}
}

function loginCheckforMyMusic(memid){
	if(memid != ""){
		location.href="/mymusiclist.kn"
	}else{
		$("#loginModal").modal();
	}
}

function loginCheckforOrderList(memid){
	if(memid != ""){
		location.href="/orderProgressListPage.ym"
	}else{
		$("#loginModal").modal();
	}
}

function addressModal(){
	$('#addrresult').text("");
	$("#addressModal").modal();
}

function eventOne(memid){
	if(memid==""){
		$("#loginModal").modal();
	}else{
		$("#eventModal").modal();
	}
	
}
