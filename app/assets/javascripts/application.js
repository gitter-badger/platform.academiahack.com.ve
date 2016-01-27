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
//= require dropzone
//= require repo/repo
//= require jquery.diagram
//= require react
//= require react_ujs
//= require components
//= require chosen-jquery
//= require weeks
//= require marked
//= require highlight.pack
//= require projects

$(function(){
    var $feedback;
    var $repo_preview;

    var $requiredKnowledge;
    var $requiredKnowledgeMarked;

    var $cheatSheetMarked;
    var $cheatSheet;

    var $challengeMarked;
    var $challenge;
    var $challengeTitle;

    var promo_group;
    var challenge_repo;

    function markItem($el, value) {
        if(value) {
            $el.html(marked(value,{
                highlight : function(code){
                    return hljs.highlightAuto(code).value;
                }
            }));
        } else {
            console.log("No hay valor a marcar!");
        }
    }

    function textAreaAdjust(el) {
        if(el) {
            el.style.height = "1px";
            el.style.height = (25+el.scrollHeight)+"px";
        } else {
            console.log("No hay elemento a ajustar!");
        }
    }

    if($challenge = $(".challenge")) {
        $challengeMarked = $(".challenge-marked");
        $challengeTitle = $(".challenge-title");

        markItem($challengeMarked,$challenge.val());
        textAreaAdjust($challenge[0]);

        $challengeTitle.keyup(function(){
            var $challengeTitlePreview;

            $challengeTitlePreview = $(".challenge-title-preview");
            $challengeTitlePreview.html($(this).val());
            textAreaAdjust(this);
        });

        $challenge.keyup(function(){
            markItem($challengeMarked,$(this).val());
        });
        $challenge.keypress(function(){
            textAreaAdjust(this);
        });
    }

    if($requiredKnowledge = $(".required-knowledge")) {
        $requiredKnowledgeMarked = $(".required-knowledge-marked");
        markItem($requiredKnowledgeMarked,$requiredKnowledge.val());
        textAreaAdjust($requiredKnowledge[0]);

        $requiredKnowledge.keyup(function(){
            markItem($requiredKnowledgeMarked,$(this).val());
        });
        $requiredKnowledge.keypress(function(){
            textAreaAdjust(this);
        });
    }

    if($cheatSheet = $(".cheatsheet")) {
        $cheatSheetMarked = $(".cheatsheet-marked");
        markItem($cheatSheetMarked,$cheatSheet.val());
        textAreaAdjust($cheatSheet[0]);

        $cheatSheet.keyup(function(){
            markItem($cheatSheetMarked,$(this).val());
            textAreaAdjust(this);
        });
        $cheatSheet.keypress(function(){
            textAreaAdjust(this);
        });
    }

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

});
