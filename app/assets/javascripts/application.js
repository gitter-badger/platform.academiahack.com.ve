// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or vendor/assets/javascripts of plugins, if any, can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file.
//
// Read Sprockets README (https://github.com/sstephenson/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require jquery_ujs
//= require bootstrap
//= require chosen-jquery
//= require dropzone
//= require tinymce/tinymce.min
//= require repo/repo.min
//= require jquery.diagram
//= require_tree .

$(function(){
    var $feedback;
    var $repo_preview;

    var promo_group;
    var challenge_repo;

    if($feedback = $(".feedback-alert") ) {
        $feedback.delay(5000).slideUp(1000, function(){
            $(this).alert('close');
        });
    }

    if($repo_preview = $('.repo_preview')) {
        promo_group = $repo_preview.attr('data-group');
        challenge_repo = $repo_preview.attr('data-repo');

        $repo_preview.repo({ user: promo_group, name: challenge_repo });
    }

    tinymce.init({selector:'textarea'});
});
