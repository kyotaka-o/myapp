$(document).on('turbolinks:load', function() { 

  $('.post__bottom__video__view').on('click', '.bottun-close-video',function(){
    $(this).parent().remove();
  });


});