//= require_tree .

var $ = require('jquery');
require('popper.js');
require('bootstrap');

/*
 * スムーススクロール
 * 出典: http://www.matsuaz.com/matsumotojs/2011/04/13/1302687798504.html
 * スクロールした後，ページ遷移するように改造した
 */
(function($){
	$.fn.scrollAnchors = function(options) {
		var settings = { duration: 500, easing: "swing" };
		if (options) $.extend(settings,options);
		return $(this).click(function(event) {
			event.preventDefault();
			var target_offset = $("a[name="+this.hash.slice(1)+"]").offset();
			var target_top = target_offset.top;
			$('html, body').animate({scrollTop:target_top},
				settings.duration, settings.easing);
			window.location.href = this.hash; // ページを遷移させる
		});
	}
})(jQuery);

/*
 * scroll クラスを指定している a タグをスムーススクロールさせる設定
 */
$(document).ready( function() {
	$(".scroll").scrollAnchors();
});


/*
 * scroll-depth settings
 */
$(function(){
  $.scrollDepth({
    elements: ['#header', '#cover-img', '#abstract', '#projects', '#petrian', '#kamokamo', '#agri-IoT', '#KanmonGG', '#Gakufubako', '#request', '#grant', '#footnote'],
    pixelDepth: false,
    percentage: false,
  });
});
