$(document).ready(function() {
  (function(a){if(window.filepicker){return}var b=a.createElement("script");b.type="text/javascript";b.async=!0;b.src=("https:"===a.location.protocol?"https:":"http:")+"//api.filepicker.io/v1/filepicker.js";var c=a.getElementsByTagName("script")[0];c.parentNode.insertBefore(b,c);var d={};d._queue=[];var e="pick,pickMultiple,pickAndStore,read,write,writeUrl,export,convert,store,storeUrl,remove,stat,setKey,constructWidget,makeDropPane".split(",");var f=function(a,b){return function(){b.push([a,arguments])}};for(var g=0;g<e.length;g++){d[e[g]]=f(e[g],d._queue)}window.filepicker=d})(document);

  filepicker.setKey("AsiN2zoDGQFyjxhurQ88Qz");


  $('input.fp').each(function() {
    $(this).addClass('done');
    $(this).attr('type', "filepicker-dragdrop");
    if (!$(this).hasClass('done')) {
      return filepicker.constructWidget($(this));
    }
  });
});