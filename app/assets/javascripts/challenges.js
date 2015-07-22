//Dropzone.options.challengeUpload = false;

$(document).ready(function(){
    var dsq;
    var disqus_config;
    var myDropzone;
    var disqus_shortname;

    disqus_shortname = 'academiahack';
    dsq = document.createElement('script');
    dsq.type = 'text/javascript';
    dsq.async = true;
    dsq.src = '//' + disqus_shortname + '.disqus.com/embed.js';

    disqus_config = function () {
        this.language = "es_ES";
    };

    (document.getElementsByTagName('head')[0] || document.getElementsByTagName('body')[0]).appendChild(dsq);

    //myDropzone = new Dropzone("#challengeUpload", {
    //    url: "submit",
    //    dictDefaultMessage: "Entrega de retos (en desarrollo...)"
    //});
});
