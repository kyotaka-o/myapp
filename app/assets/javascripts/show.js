$(document).on('turbolinks:load', function() { 

  $('.user-show').on('click','.subject',function(e){
    post=$(this).next('.posts');
    page=$(this).parents().next(".page-show");

    post.fadeToggle(300)
    page.fadeToggle(300)
  });
});