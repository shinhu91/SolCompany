$(document).ready(function(){
	selectedCouponVal1= 0;
	selectedCouponVal2= 0;
	$('input.cnt').each(function(index){
		var sp = parseInt($(this).val())*parseInt($(this).closest('tr').find('input.bp').val());
		$(this).closest('tr').find('input.sp').val(sp);
		var spdiv = $(this).closest('tr').find('input.sp').val().replace(/\B(?=(\d{3})+(?!\d))/g, ",");
		$(this).closest('tr').find('div.spdiv').text(spdiv+"원");
	});
	setPrice();
	$('#cntVal').change(function(){
		var stock = parseInt($('#stock').text());
		var cnt = parseInt($('#cntVal').val());
		var bp = $(this).closest('tr').find('input.bp');
		var sp = $(this).closest('tr').find('input.sp');
		var spdiv = $(this).closest('tr').find('div.spdiv');
		var sum = 0;
		if(stock>=cnt && cnt>0){
			sum = parseInt(bp.val())*cnt;
			sp.val(sum);
			var spdivText = sum.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",");
			spdiv.text(spdivText+"원");
		}else if(stock<cnt){
			$('#cntVal').val(stock);
			cnt = parseInt($('#cntVal').val());
			sum = parseInt(bp.val())*cnt;
			sp.val(sum);
			var spdivText = sum.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",");
			spdiv.text(spdivText+"원");
			alert("현재 재고 : "+stock+"\n재고보다 많이 구매하실 수 없습니다.\n재고보다 많은 수량을 주문시에는 고객센터로 문의 바랍니다.");
		}else{
			alert('숫자입력');
			$('#cntVal').val(1);
			sum = parseInt(bp.val());
			sp.val(sum);
			var spdivText = sum.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",");
			spdiv.text(spdivText+"원");
		}
		setPrice();
	});
	$("#viewCoupon").click(function(){
		var memid = $('#couponData').data('memid');
		$.get('couponSelect.ym', {memid : memid}, function(re){
			viewData(re);
			if(re==""){
				$('#cartCouponModal div.modal-body').text("이용 가능한 쿠폰이 없습니다.");
			}
		});
	    $("#cartCouponModal").modal();
	});
});
function setPrice(){
	var sum = 0;
	var sp = $('input.cnt').closest('tr').find('input.sp');
	$(sp).each(function(index){sum += parseInt($( this ).val())});
	$('#total').val(sum);
	$('#amount').val(sum);
	var sumText = sum.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",");
	$('#total').val(sumText+"원");
	$('#amount').val(sumText+"원");
	var amountCoupon = 0;
	if(parseInt(selectedCouponVal1)>0 || parseInt(selectedCouponVal2)>0){
		amountCoupon = parseInt(selectedCouponVal1) + Math.round(parseInt($('#amount').val().replace(/,/g,""))*parseInt(selectedCouponVal2)/100);
	}else{
		amountCoupon = parseInt($('#amountCoupon').val().replace(/,/g,""));
	}
	if(sum<amountCoupon){
		$('#amountTotal').val(0);
		$('#amountTotalText').val(0+"원");
		$('#amountCoupon').val(amountCoupon.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",")+"원");
	}else{
		var amountTotal = sum-amountCoupon;
		var amountTotalText = amountTotal.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",");
		$('#amountTotal').val(amountTotal);
		$('#amountTotalText').val(amountTotalText+"원");
		$('#amountCoupon').val(amountCoupon.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",")+"원");
	}
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
	}else{
		var ea = $('input#cntVal').val();
		$.get('cartInsert.ym',{"memid" : memid, "bookName" : bookName, "image" : image , "price" : price, "ea" : ea}, function(data){
			var bookcnt = parseInt(data);
			if(bookcnt > 0){
				var result = confirm("이미 해당 상품이 있습니다. 장바구니로 이동하시겠습니까?");
				if(result){location.href="/cartPage.ym";}
			}else{
				var result = confirm("상품이 장바구니에 담겼습니다. 장바구니로 이동하시겠습니까?");
				if(result){location.href="/cartPage.ym";}
			}
		});
	}
}

function viewData(re){
	data = $.trim(re);
	var result = data.split(',');
	var html ="" ;
	for(var i=0; i<result.length-1;i+=3){
		html += "<button class=\"btn btn-info\" onclick=\"select('"+result[i]+"',"+result[i+1]+","+result[i+2]+")\">"+result[i]+"</button><br><br>";
	}
	$('#cartCouponModal div.modal-body').html(html);
}
function select(name,val1,val2){
	$('#selectedCouponName').val(name);
	selectedCouponVal1= val1;
	selectedCouponVal2= val2;
	setPrice();
	$("#cartCouponModal").modal("hide");
}

var amount = parseInt($('#amount').val().replace(/,/g,""));
selectedCouponVal1= val1;
selectedCouponVal2= val2;
var amountCoupon = parseInt(val1) + amount*parseInt(val2)/100;
$('#amountCoupon').val(amountCoupon);

function orderSend(theform, memid){
	if(nullCheck()){
		theform.submit();
	}
}

//주소찾기
function searchaddr() {
	var param = "dong=" + $("#dong").val();
	// if($("#dong").val()==""){
	// $("#addrresult").css("color", "#BE2457");
	// $("#addrresult").html("동을 입력하세요.");
	// return false;
	// }
	$.ajax({
		type : "post",
		url : "/searchaddr.do",
		data : param,
		success : function(data) {

			data1 = $.trim(data);
			var result = data1.split(',');
			var html = "";
			for (var i = 0; i < result.length; i++) {
				html += "<a href =\"javascript:sendaddr('" + result[i]
						+ "')\">" + result[i] + "</a><br>";
			}
			$("#addrresult").html(html);
		}
	});
}
// 찾은 주소 보내기
function sendaddr(addr) {
	$('#receiverAddr1').val(addr);
	$('#dong').val("");
	$('#addressModal').modal("hide");

}

// Null 값 체크
function nullCheck() {
	var name = $('#receiverName').val();
	var address1 = $('#receiverAddr1').val();
	var address2 = $('#receiverAddr2').val();
	var phone = $('#receiverTel').val();
	
	if(name == ""){
		alert('수취인 이름을 입력바랍니다!');
		$('#receiverName').focus();
		return false;
	}
	if(address1 == ""){
		alert('주소를 입력바랍니다!');
		$('#receiverAddr1').focus();
		return false;
	}
	if(address2 == ""){
		alert('상세주소를 입력바랍니다!');
		$('#receiverAddr2').focus();
		return false;
	}
	if(phone == ""){
		alert('연락처를 입력바랍니다!');
		$('#receiverTel').focus();
		return false;
	}
	return true;
}
