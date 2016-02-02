$(document).ready(function() {
	/* Search */
	$('.button-search').bind('click', function() {
		url = $('base').attr('href') + 'tim-kiem';
				 
		var search = $('input[name=\'search\']').attr('value');
		
		if (search) {
			url += '&search=' + encodeURIComponent(search);
		}
		
		location = url;
	});
	
	$('#header input[name=\'search\']').bind('keydown', function(e) {
		if (e.keyCode == 13) {
			url = $('base').attr('href') + 'tim-kiem';
			 
			var search = $('input[name=\'search\']').attr('value');
			
			if (search) {
				url += '&search=' + encodeURIComponent(search);
			}
			
			location = url;
		}
	});
	
	/* Ajax Cart */
	$('#cart > .heading').live('click', function() {
		location = '/thanh-toan';
	});
	$('#cart > .content > .close').live('click', function() {
		$('#cart').removeClass('active');
	});	
	/* remove item cart */
	$('.remove a').live('click', function() {
		var id = $(this).attr('data-id');
		if(getURLVar('route') == 'checkout/cart' || getURLVar('route') == 'checkout/checkout') {
			location = 'index.php?route=checkout/cart&remove='+id;
		}else{
			$.ajax({
				url: 'index.php?route=module/cart&remove='+ id,
				type: 'get',
				beforeSend: function(){
					$('#messagebox').show();
				},
				success: function() {
					location.reload();
				}
			});
		}
		
	});	
	//Change quantity item
	$('.quantity select').live('change',function(){
		$.ajax({
			url: 'index.php?route=checkout/cart',
			type: 'post',
			data: $(this),
			beforeSend: function(){
				$('#messagebox').show();
			},
			success: function() {
				location.reload();
			}
		});
	})
	/* Mega Menu */
	$('#menu ul > li > a + div').each(function(index, element) {
		// IE6 & IE7 Fixes
		if ($.browser.msie && ($.browser.version == 7 || $.browser.version == 6)) {
			var category = $(element).find('a');
			var columns = $(element).find('ul').length;
			
			$(element).css('width', (columns * 143) + 'px');
			$(element).find('ul').css('float', 'left');
		}		
		
		var menu = $('#menu').offset();
		var dropdown = $(this).parent().offset();
		
		i = (dropdown.left + $(this).outerWidth()) - (menu.left + $('#menu').outerWidth());
		
		if (i > 0) {
			$(this).css('margin-left', '-' + (i + 5) + 'px');
		}
	});

	// IE6 & IE7 Fixes
	if ($.browser.msie) {
		if ($.browser.version <= 6) {
			$('#column-left + #column-right + #content, #column-left + #content').css('margin-left', '195px');
			
			$('#column-right + #content').css('margin-right', '195px');
		
			$('.box-category ul li a.active + ul').css('display', 'block');	
		}
		
		if ($.browser.version <= 7) {
			$('#menu > ul > li').bind('mouseover', function() {
				$(this).addClass('active');
			});
				
			$('#menu > ul > li').bind('mouseout', function() {
				$(this).removeClass('active');
			});	
		}
	}
	
	$('.success img, .warning img, .attention img, .information img').live('click', function() {
		$(this).parent().fadeOut('slow', function() {
			$(this).remove();
		});
	});	
	
	/*Scroll top*/
	$(function () {
		$(window).scroll(function () {
			if ($(this).scrollTop() != 0) {
				$('#scrolltop').fadeIn();
			} else {
				$('#scrolltop').fadeOut();
			}
		});
	});
	$('#scrolltop').click(function(){
		$('html, body').animate({ scrollTop: 0 }, 'slow'); 
		return false;
	});
	$(".item-tooltip").easyTooltip({tooltipId: "itemtooltip", useElement : ".product-tooltip"});
	
	$('#main_header_top .mtab li').click(function(){
		location.href = $(this).find('a').attr('href');
	});
	
	$('.expand .quote-expand').click(function(){
		$(this).closest(".expand").toggleClass('expanded');
	});
	
		$('#menu').slicknav({
			prependTo:'#menu-mobile',
			closeOnClick: true,
			label: 'DANH MỤC TOUR'
		});
		if(getWidthBrowser() < 959){
			$('#column-left').hide();
			$('#column-left .box .box-heading').click(function(){
				$(this).next().toggle();
			});
			$('.box_featured .item,.product_carousel .item,.box_featured_medium .item,.news_carousel .content_box .item_news_bottom,.product-list >div,.box_product .item,section.cate_content article,section.article-content footer .orther li').click(function(){
				var a = $(this).find('a').attr('href');
				var a = a.replace('#booking','');
				location.href = a;
			}) ;
			
			$('#column-left').insertAfter('#content');
			$('#column-left').show();
		}
		
		if(getWidthBrowser() < 767){
			$(".call_button_mobile").click(function(){
				var hcten = $('.hotline_content').html();
				var cten = '';
				cten +='<div id="dialog">';
				cten +='	<div>';
				cten +='	<div class="header">THÔNG TIN LIÊN HỆ<i class="light_close"></i></div>';
				cten +='	<div class="content"><div class="hotline_content">'+hcten+'</div></div>';
				cten +='	<div class="action"><button class="btnCancel">Đóng</button></div>';
				cten +='	</div>';
				cten +='<div>';
				$('body').append(cten);
				$('#dialog,#dialog .hotline_content').show();
				$('body #dialog .header > i, body #dialog .action > .btnCancel').bind('click',function(){
					$('body > #dialog').remove();
				})
			})
		}
		if(getWidthBrowser() < 479){
			$('.footer_top > .col > label.tit').click(function(){
				$(this).next().toggle();
			})
		}
		if(getWidthBrowser() > 767){
			var col_next = $('#content').next();
			if(col_next.attr('id')=='column-left' || col_next.attr('id')=='column-right'){
				$('#content').css({"float": "right", "width": "77%", "box-sizing": "border-box"});
			}
		}
		
});
//document.write(getWidthBrowser());


function getURLVar(key) {
	var value = [];
	
	var query = String(document.location).split('?');
	
	if (query[1]) {
		var part = query[1].split('&');

		for (i = 0; i < part.length; i++) {
			var data = part[i].split('=');
			
			if (data[0] && data[1]) {
				value[data[0]] = data[1];
			}
		}
		
		if (value[key]) {
			return value[key];
		} else {
			return '';
		}
	}
} 

function addToCart(product_id, quantity) {
	quantity = typeof(quantity) != 'undefined' ? quantity : 1;

	$.ajax({
		url: 'index.php?route=checkout/cart/add',
		type: 'post',
		data: 'product_id=' + product_id + '&quantity=' + quantity,
		dataType: 'json',
		success: function(json) {
			$('.success, .warning, .attention, .information, .error').remove();
			
			if (json['redirect']) {
				location = json['redirect'];
			}
			
			if (json['success']) {
				$('#notification').html('<div class="success" style="display: none;">' + json['success'] + '<img src="catalog/view/theme/default/image/close.png" alt="" class="close" /></div>');
				
				$('.success').fadeIn('slow');
				
				$('.cart-heading').html('<i class="fa fa-shopping-cart"></i> '+json['total']);
				
				$('html, body').animate({ scrollTop: 0 }, 'slow'); 
			}	
		}
	});
}
function addToWishList(product_id) {
	$.ajax({
		url: 'index.php?route=account/wishlist/add',
		type: 'post',
		data: 'product_id=' + product_id,
		dataType: 'json',
		success: function(json) {
			$('.success, .warning, .attention, .information').remove();
						
			if (json['success']) {
				$('#notification').html('<div class="success" style="display: none;">' + json['success'] + '<img src="catalog/view/theme/default/image/close.png" alt="" class="close" /></div>');
				
				$('.success').fadeIn('slow');
				
				$('#wishlist-total').html(json['total']);
				
				$('html, body').animate({ scrollTop: 0 }, 'slow');
			}	
		}
	});
}


function getCookie(c_name)
{
var i,x,y,ARRcookies=document.cookie.split(";");
for (i=0;i<ARRcookies.length;i++)
  {
  x=ARRcookies[i].substr(0,ARRcookies[i].indexOf("="));
  y=ARRcookies[i].substr(ARRcookies[i].indexOf("=")+1);
  x=x.replace(/^\s+|\s+$/g,"");
  if (x==c_name)
    {
    return unescape(y);
    }
  }
}
function setCookie(c_name,value,exdays)
{
var exdate=new Date();
exdate.setTime(exdate.getTime() + exdays);
var c_value=escape(value) + ((exdays==null) ? "" : "; expires="+exdate.toGMTString());
document.cookie=c_name + "=" + c_value;
}

function shuffle(array) {
  var currentIndex = array.length
	, temporaryValue
	, randomIndex
	;

  // While there remain elements to shuffle...
  while (0 !== currentIndex) {

	// Pick a remaining element...
	randomIndex = Math.floor(Math.random() * currentIndex);
	currentIndex -= 1;

	// And swap it with the current element.
	temporaryValue = array[currentIndex];
	array[currentIndex] = array[randomIndex];
	array[randomIndex] = temporaryValue;
  }

  return array;
}
$(document).ready(function() {
	var phonenum = ["6651 6366", "2240 6473", "2210 2465", "3602 2649", "2240 6474", "6651 8167"];
	var cellphonenum = ["903 550 236", "933 762 989"];
	shuffle(phonenum);
	shuffle(cellphonenum);
	//footer hotline
	f_phonenum = f_cellphonenum = '';
	$.each(phonenum, function( k, v ) {
		f_phonenum += '<li><p><i class="fa fa-phone"></i> <span>+84</span> (08) <label>'+v+'</label></p></li>';
	});
	$.each(cellphonenum, function( k, v ) {
		f_cellphonenum += '<li><p><i class="fa fa-mobile"></i> <span>+84</span> (0) <label>'+v+'</label></p></li>';
	});
	
	$('.phone_contact .tv ul').html(f_cellphonenum);
	$('.phone_contact .dt ul').html(f_phonenum);
	
	//header hotline
	h_phonenum = h_cellphonenum = '';
	h_phonenum += '<lable>ĐẶT TOUR:</lable>';
	$.each(phonenum, function( k, v ) {
		if(k <= 2){
		h_phonenum += '<li><p><i class="fa fa-phone"></i> <span class="pre">+84</span> (08) <label>'+v+'</label></p></li>';
		}
	});
	h_cellphonenum += '<span class="tuvan"><span>}</span>(7h - 21h)</span>';
	h_cellphonenum += '<lable>TƯ VẤN KHÁCH HÀNG:</lable>';
	$.each(cellphonenum, function( k, v ) {
		h_cellphonenum += '<li><p><i class="fa fa-phone"></i> <span class="pre">+84</span> (0) <label>'+v+'</label></p></li>';
	});
	h_cellphonenum += '<li><i class="fa fa-phone"></i> <span class="pre">+84</span> (0) 909 759 479 <span style="color: #c31112;">(Sau 21h)</span> </li>';
	
	$('.hotline_content ul.tv').html(h_cellphonenum);
	$('.hotline_content ul.dt').html(h_phonenum);
	
	//footer hotline
	p_phonenum = p_cellphonenum = '';
	$.each(phonenum, function( k, v ) {
		if(k <= 3){
		p_phonenum += '<li><p><i class="fa fa-phone"></i> <span>+84</span> (08) <label>'+v+'</label></p></li>';
		}
	});
	$.each(cellphonenum, function( k, v ) {
		p_cellphonenum += '<li><p><i class="fa fa-mobile"></i> <span>+84</span> (0) <label>'+v+'</label></p></li>';
	});
	
	$('.box-hotline .tv ul').html(p_cellphonenum);
	$('.box-hotline .dt ul').html(p_phonenum);
	
	
	//
	$('#tab-schedule,.category-info-footer,.category-info,.article-news')
		.bind('hover', function() {
			ondisfun(this);
		})
	$('#tab-schedule,.category-info-footer,.category-info,.article-news')
		.bind('mouseleave', function() {
			offdisfun(this);
	});
	
	$("#tab-schedule img,.category-info-footer img,.category-info img,.article-news img").bind("contextmenu",function(e){return false;}); 
	
	//
	$('marquee.mar-thongbao').marquee('pointer').mouseover(function () {
	  $(this).trigger('stop');
	}).mouseout(function () {
	  $(this).trigger('start');
	});
});
function ondisfun(e) {
    $(e).css({
            '-webkit-user-select': 'none',
            '-moz-user-select': 'none'
        });
    $(e).attr({
            'copy': 'return false',
            'onselectstart': 'return false',
            'oncut': 'return false',
            'onpaste': 'return false'
        });
}

function offdisfun(e) {
    $(e).css({
            '-webkit-user-select': '',
            '-moz-user-select': ''
        });
    $(e).removeAttr('copy')
        .removeAttr('onselectstart')
        .removeAttr('oncut')
        .removeAttr('onpaste');
}

function getWidthBrowser() {
	var myWidth;

	if( typeof( window.innerWidth ) == 'number' ) { 
		//Non-IE 
		myWidth = window.innerWidth;
		//myHeight = window.innerHeight; 
	} 
	else if( document.documentElement && ( document.documentElement.clientWidth || document.documentElement.clientHeight ) ) { 
		//IE 6+ in 'standards compliant mode' 
		myWidth = document.documentElement.clientWidth; 
		//myHeight = document.documentElement.clientHeight; 
	} 
	else if( document.body && ( document.body.clientWidth || document.body.clientHeight ) ) { 
		//IE 4 compatible 
		myWidth = document.body.clientWidth; 
		//myHeight = document.body.clientHeight; 
	}
	
	return myWidth;
}
function showNumber(val){
	
    if (isNaN(val)) return 0;
    var intPart = '';
     
    for (var i = 3, t = val.length; i < t + 3; i+= 3) {
        intPart = val.slice(-3) + '.' + intPart;
        val = val.substring(0, t-i);
    }
    val = intPart.substring(0, intPart.length-1);
     
    return val;
}

