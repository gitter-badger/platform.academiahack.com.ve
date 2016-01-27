$(".project-widget").mouseenter(function(){
    $(this).find(".project-bg").css({'opacity': '0.1'});
    $(this).find( ".video").get(0).play();
}).mouseleave(function(){
    $(this).find(".project-bg").css({'opacity': '0.45'});
    $(this).find( ".video").get(0).pause();
});