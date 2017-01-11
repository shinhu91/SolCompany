$(document).ready(function(){
	$('button.userConfirm').each(function(){
		$(this).click(function(){
			var orderId = $(this).closest('tr').find('td.orderId').text();
			var status = $(this).closest('tr').find('td.confirm');
			$.post('userConfirmRequest.ym',{orderId:orderId},function(data){
				status.html("구매확정");
			});
		});
	});
	$('.updateBtn').each(function(){
		$(this).click(function(){
			var orderId = $(this).closest('tr').find('td.orderId').text();
			var status = $(this).closest('tr').find('td.status');
			$.get('updateOrderStatus.ym',{orderId:orderId},function(data){
				if(data==1){
					status.text('상품준비중');
				}else if(data==2){
					status.text('배송중');
				}else if(data==3){
					status.text('배송완료');
				}else if(data>=4&&data<90){
					status.html("관리자에 의한 구매확정<br><br><button class='btn btn-info' onclick='deleteStatus4(this);'>목록에서 제거</button>");
				}else if(data>=99){
					status.html("유저에 의한 구매확정<br><br><button class='btn btn-success' onclick='deleteStatus4(this);'>목록에서 제거</button>");
				}
			});
		});
	});
})

function deleteStatus4(e){
	var orderId = $(e).closest('tr').find('td.orderId').text();
	var row = $(e).closest('tr');
	$.get('/deleteOrderedProduct.ym',{orderId:orderId},function(){
		row.remove();
	});
}

function deleteAllStatusFour(){
	$.get('/deleteAllOrderedProduct.ym',function(data){
		$('td.status').each(function(){
			var patt1 = /구매확정/g;
			if($(this).text().match(patt1)=="구매확정"){
				var row = $(this).closest('tr');
				row.remove();
			}
		});
	});
}