$(document).on('turbolinks:load', function() { 

  
    $('.contents__left').on('click','.categories-bottun',function(e){
    // console.log(this)	
    category=$(".category");
    // a_first = $(".user-ranking__boxes:first").children('a');
    if (category.is(":hidden")) {
      category.slideDown(200);
      // $(this).css("left",0)
    } else {
      category.slideUp(200);
      // $(this).css("left","50px")
    }
  });
});