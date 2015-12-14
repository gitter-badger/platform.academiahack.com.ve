//= require jquery
//= require jquery_ujs
//= require jquery.ui.core
//= require jquery.ui.widget
//= require jquery.ui.datepicker
//= require chosen-jquery
//= require active_admin/application


$(document).ready(function(){
    $(".chosen-input").chosen({
        allow_single_deselect: true,
        no_results_text: 'No results matched',
        width: '500px'
    });
});


