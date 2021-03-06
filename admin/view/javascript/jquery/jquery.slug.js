/**
 * jQuery's SimpleSlug Plugin
 *
 * generate a slug based on the article title, check out the following website for further information:
 * http://dingyu.me/blog/posts/view/jquery-simpleslug-plugin
 *
 * @author Felix Ding
 * @version 0.1
 * @copyright Copyright(c) 2008. Felix Ding
 * @license http://www.opensource.org/licenses/bsd-license.php The BSD License
 * @date 2009-07-06
 * @todo error & exceptions handling
 * @edit by trung hieu 
*/

(function($) {
	$.fn.slug = function(options) {
		var defaults = {
			source: 'input.simpleslug-title',
			preview: 'span.simpleslug-preview',
			replacement: '-'
		};
		
		var opts = $.extend(defaults, options);
		var element = this;

		//does 'this' and source exist?
		if(!$(element).length || !$(opts.source).length) return;
		
		//bind the events
		$(opts.source).bind('blur change focus keyup mouseup', function() {
			var title = $(opts.source).val();
			var slug = $.fn.slug.slugify(title, opts.replacement);
			
			$(element).val(slug);
			
			//preview
			if($(opts.preview).length) {
				$(opts.preview).html(slug);
			}
		});
		
		//make it chainable
		return this;
	};
	
	$.fn.slug.slugify = function(str, replacement) {
		//replace everything that is not a word character
		
        
        var unicode = {
            'a' : 'áàảãạăắặằẳẵâấầẩẫậ',
            "c" : "ç",
            'd' : 'đ',
            'e' : 'éèẻẽẹêếềểễệ',
    		'i' : 'íìỉĩị',
    		'o' : 'óòỏõọôốồổỗộơớờởỡợ',
            'u' : 'úùủũụưứừửữự',
            'y' : 'ýỳỷỹỵ'
        };
        str = str.replace(/^\s+|\s+$/g, '');
        
        str = str.toLowerCase();

        $.each(unicode, function(nonUnicode, uni) {
            for(var i = 0, l = uni.length; i < l; i++) {
                str = str.replace(new RegExp(uni.charAt(i), 'g'), nonUnicode);
            }
        });
		
        slug = str.replace(/[^0-9a-zA-Z]/g, replacement);
		//replace mutilple continous replacements
		slug = slug.replace(eval("/"+replacement+"{2,}/g"), replacement);
		
		//replace the beginning and ending replacement(s)
		slug = slug.replace(eval("/(^"+replacement+")|("+replacement+"$)/g"), '');
		//convert the slug to lower case
		slug = slug.toLowerCase();
		
		return slug + '.html';
	};
})(jQuery);