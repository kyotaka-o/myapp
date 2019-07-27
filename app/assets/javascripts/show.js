$(document).on('turbolinks:load', function() { 

  $('.user-show').on('click','.subject',function(e){
    post=$(this).next('.posts');
    page=$(this).parents().next(".page-show");
    if (post.is(":hidden")) {
      post.slideDown(800);
      page.slideDown(800);
    } else {
      post.slideUp(800);
      page.slideUp(800);
    }
    // post.fadeToggle(300)
    // page.fadeToggle(300)
  });
});