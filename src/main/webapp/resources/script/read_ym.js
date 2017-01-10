$(document).ready(function(){
	$('input.cnt').each(function(index){
		var sp = parseInt($(this).val())*parseInt($(this).parent().closest('tr').children('td').children('input.bp').val());
		$(this).parent().closest('tr').children('td').children('input.sp').val(sp);
	});
	setPrice();
	
	$('#cntVal').change(function(){
		var stock = parseInt($(this).closest('tr').find('td#stock').text());
		var cnt = parseInt($(this).val());
		if(stock>=cnt && cnt>0){
		}else if(stock<cnt){
			$(this).val(stock);
			cnt = parseInt($(this).val());
			alert("현재 재고 : "+stock+"\n재고보다 많이 구매하실 수 없습니다.\n재고보다 많은 수량을 주문시에는 고객센터로 문의 바랍니다.");
		}else{
			alert('1이상의 숫자를 입력하세요');
			$(this).val(1);
		}
	});

});

function setPrice(){
	var sum = 0;
	var sp = $('input.cnt').parent().closest('tr').children('td').children('input.sp');
	$(sp).each(function(index){sum += parseInt($( this ).val())});
	$('#total').val(sum);
	$('#amount').val(sum);
}

function checkAll(){
	if($('#checkAll').prop('checked') == true)
	{
		$('input.chkBox').each(function(index){
			$(this).prop('checked', true);
			setPrice();
		});
	}
	else
	{
		$('input.chkBox').each(function(index){
			$(this).prop('checked', false);
			setPrice();
		});
	}
}

function autoCheck(){
	var n = $('input.chkBox:checked').length;
	var m = $('input.chkBox').length;
	if(n == m)
	{
		$('#checkAll').prop('checked', true);
	}
	else if(n != m)
	{
		$('#checkAll').prop('checked', false);
	}
}

function addtoCart(memid, bookName, image, price){
	if(memid == ""){
		alert("로그인 후에 이용바랍니다.");
		$("#loginModal").modal();
	}else{
		var ea = $('input#cntVal').val();
		$.get('cartInsert.ym',{"memid" : memid, "bookName" : bookName, "image" : image , "price" : price, "ea" : ea}, function(data){
			var bookcnt = parseInt(data);
			if(bookcnt > 0){
				var result = confirm("이미 해당 상품이 있습니다. 장바구니로 이동하시겠습니까?");
				if(result){location.href="/cartPage.ym";}
			}else{
				checkCartCount(memid);
				var result = confirm("상품이 장바구니에 담겼습니다. 장바구니로 이동하시겠습니까?");
				if(result){location.href="/cartPage.ym";}
				
			}
		});
	}
}

function checkCartCount(memid){
	$.get('cartCountCheck.ym',{memid:memid},function(data){
		var cnt = parseInt(data);
		$('.bubble').html(cnt).addClass('animating');
		removeAnimation();
	});
}
function removeAnimation(){
	setTimeout(function() {
		$('.bubble').removeClass('animating')
	}, 500);			
}

function sendOrder(id, theform){
	if(id == ""){
		alert("로그인 후 이용바랍니다");
		$("#loginModal").modal();
	}else{
		theform.submit();
	}
}