// Place your application-specific JavaScript functions and classes here
// This file is automatically included by javascript_include_tag :defaults

// Drop in a missing image for images that didn't load
$(window).bind('load', function() {
	$('img').each(function() {
		if ((typeof this.naturalWidth != "undefined" && this.naturalWidth == 0) || this.readyState == 'uninitialized' ) {
			$(this).attr('src', '/images/missing.gif');
		}
	});
});
