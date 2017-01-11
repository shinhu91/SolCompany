$(document).ready(function(){
	$('input.cntVal').each(function(index){
		if($(this).val() > 0)	{$(this).closest('tr').find('input.chkBox').prop('checked', true);}
		var sp = parseInt($(this).val())*parseInt($(this).closest('tr').find('input.bp').val());
		$(this).closest('tr').find('input.sp').val(sp);
		var spdiv = $(this).closest('tr').find('input.sp').val().replace(/\B(?=(\d{3})+(?!\d))/g, ",");
		$(this).closest('tr').find('div.spdiv').text(spdiv+"원");
	});
	setPrice();
	autoCheck();
	findName();

	$('input.chkBox').each(function(){
		$(this).click(function(){
			autoCheck();
			findName();
		});
	});

	$('.cntVal').each(function(index){
		$(this).change(function(){
			var stock = parseInt($(this).closest('tr').find('td.stock').text());
			var cnt = parseInt($(this).val());
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
				$(this).val(stock);
				cnt = parseInt($(this).val());
				sum = parseInt(bp.val())*cnt;
				sp.val(sum);
				var spdivText = sum.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",");
				spdiv.text(spdivText+"원");
				alert("현재 재고 : "+stock+"\n재고보다 많이 구매하실 수 없습니다.\n재고보다 많은 수량을 주문시에는 고객센터로 문의 바랍니다.");
			}else{
				alert('1이상의 숫자를 입력하세요');
				$(this).val(1);
				sum = parseInt(bp.val());
				sp.val(sum);
				var spdivText = sum.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",");
				spdiv.text(spdivText+"원");
				
			}
			setPrice();
		});
	});
	$('#checkAll').click(function(){
		checkAll();
	});
});

function checkAll(){
	if($('#checkAll').prop('checked') == true){
		$('input.chkBox').each(function(index){
			$(this).prop('checked', true);
			setPrice();
			findName();
		});
	}
	else{
		$('input.chkBox').each(function(index){
			$(this).prop('checked', false);
			setPrice();
			findName();
		});
	}
}
function setPrice(){
		var sum = 0;
		var sp = $('input:checked').closest('tr').find('input.sp');
		$(sp).each(function(index){sum += parseInt($( this ).val())});
		var sumText = sum.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",");
		$('#total').val(sumText+"원");
		$('#amount').val(sumText+"원");
			var amountTotal = sum;
			var amountTotalText = amountTotal.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",");
			$('#amountTotal').val(amountTotal);
			$('#amountTotalText').val(amountTotalText+"원");
}


function autoCheck(){
	var n = $('input.chkBox:checked').length;
	var m = $('input.chkBox').length;
	if(n == m && n != 0){
		$('#checkAll').prop('checked', true);
	}
	else if(n != m){
		$('#checkAll').prop('checked', false);
	}
}
function deleteChecked(memid){
	$('input.chkBox:checked').each(function(index){
  		$.get('cartDelete.ym',{"memid":memid, "bookName":$(this).closest('tr').find('div.bookName').text()},function(){
  			$('input.chkBox:checked').parent().parent().remove();
  			setPrice();
  			autoCheck();
  			checkCartCount(memid);
  			findName();
  		});
	});
}

function findName(){
	var firstChkedProductName = new Array();
	var firstChkedProductImgName = new Array();
	chkedCnt = ($('input.chkBox:checked').length-1 >0) ? " 외 "+($('input.chkBox:checked').length-1) +"건" : "";
	$('input.chkBox:checked').each(function(i){
		firstChkedProductName[i] = $(this).closest('tr').find('div.bookName').text();
		firstChkedProductImgName[i]= $(this).closest('tr').find('div#imgName').text();
	});
	if($('input.chkBox:checked').length==0){
		$('#name').val("선택한 상품이 없습니다");
	}else{
		$('#name').val(firstChkedProductName[0]+" "+chkedCnt);
	}
	
	$('#productImg').val(firstChkedProductImgName[0]);
}

function dataSubmit(f)
{

    if (typeof(f.elements['chk[]'].length) == 'undefined')
    {
        if (f.elements['chk[]'].checked==false) 
        {
            f.elements['field_a[]'].disabled=true; 
            f.elements['field_b[]'].disabled=true; 
        }
    } else {
        for (i=0; i<f.elements['chk[]'].length; i++)
        {  
            if (f.elements['chk[]'][i].checked==false)
            {
                f.elements['field_a[]'][i].disabled=true;
                f.elements['field_b[]'][i].disabled=true;
            }
        }
    }
    return true;
}

function orderSend(theform, memid){
	if(nullCheck()){
		deleteChecked(memid);
		dataSubmit(theform);
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
	
	if($('input.chkBox:checked').length==0){
		alert("선택한 상품이 없습니다!");
		return false;
	}
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