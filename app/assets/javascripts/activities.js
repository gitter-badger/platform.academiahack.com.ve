$(function(){
	var name;

	name = $('.day_box').first().attr('data-name');
	$('.badge-title').html(name);

	$('.day_box').hover(function(){
		name = $(this).attr('data-name');
		$('.badge-title').html(name);
	});

	$('#badges_carousel').on('slid.bs.carousel', function (e) {
		name = $('.item.active .day_box').first().attr('data-name');
		$('.badge-title').html(name);
	})
});
