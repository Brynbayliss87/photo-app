$(document).ready(function(){
  $('.more-comments').click(function(){
    $(this).on('ajax:success', function(event){
      var postId = $(this).data("post-id");
      $("#comments_" + postId).html(event.detail[2].responseText);
      $("#comments_paginator-" + postId).html("show more comments");
      Append.open = true;
      Append.comment = true;
      Append.link = false;
    });
  });
});