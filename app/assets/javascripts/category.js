$(document).on('turbolinks:load', function() { 

  
    $('.contents__left').on('click','.categories-bottun',function(e){
    category=$(".category");
    if (category.is(":hidden")) {
      category.slideDown(200);
    } else {
      category.slideUp(200);
    }
  });
});