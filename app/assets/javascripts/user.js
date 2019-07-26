$(document).on('turbolinks:load', function() { 
  function visibleToggle() {
    
  }
  // $('.user-toggle').on('click','.user__avater',function(e){

  //   var value=$('.user-toggle').css('visibility')
  //   if (value == "hidden"){
  //     // $('.user').css('opacity',0);     
  //     $('.user-toggle').css('visibility','visible');
  //   }else{
  //     $('.user-toggle').css('visibility','hidden');
  //   }
  // });

  // $('.user-ranking').on('click','.user-ranking__title',function(e){
  //   console.log(this)	
  //   a=$(".user-ranking__boxes").children('a');
  //   a_first = $(".user-ranking__boxes:first").children('a');
  //   if (a_first.is(":hidden")) {
  //     a.slideDown("slow");
  //   } else {
  //     a.slideUp("slow");
  //   }

  
    $('.contents__right').on('click','.user-ranking-button',function(e){
    // console.log(this)	
    ranking=$(".user-ranking");
    // a_first = $(".user-ranking__boxes:first").children('a');
    if (ranking.hasClass("scale-out")) {
      ranking.removeClass("scale-out");

    } else {
      ranking.addClass("scale-out");
      // ranking.slideUp(200);
    }
  });
});