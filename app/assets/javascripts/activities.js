var disqus_shortname = 'hack4geeks';

$(document).ready(function(){
	var name;
	var dsq;
	var disqus_config;
	var convert;
	var challenge;

	name = $('.day_box').first().attr('data-name');
	$('.badge-title').html(name);

	$('.day_box').hover(function(){
		name = $(this).attr('data-name');
		$('.badge-title').html(name);
	});

	$('#badges_carousel').on('slid.bs.carousel', function (e) {
		name = $('.item.active .day_box').first().attr('data-name');
		$('.badge-title').html(name);
	});

	if($(".activities.challenge").length > 0) {
		//En la pagina de challenges!
		dsq = document.createElement('script');
		dsq.type = 'text/javascript';
		dsq.async = true;
		dsq.src = '//' + disqus_shortname + '.disqus.com/embed.js';

		disqus_config = function () {
	  	this.language = "es_ES";
		};

		(document.getElementsByTagName('head')[0] || document.getElementsByTagName('body')[0]).appendChild(dsq);

		Dropzone.options.challengeUpload = {
		  paramName: "file", // The name that will be used to transfer the file
			dictDefaultMessage: "Arrastra archivos aqui para subirlos."
		};

	}


	tinymce.init({selector:'textarea'});
});
