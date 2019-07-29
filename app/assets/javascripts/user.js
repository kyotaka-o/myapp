$(document).on('turbolinks:load', function() { 

  $('.contents__right').on('click','.user-ranking-button .fas',function(e){
    // console.log(this)	
    ranking=$(".ranking-stage");
    // a_first = $(".user-ranking__boxes:first").children('a');
    if (ranking.hasClass("scale-out")) {
      ranking.removeClass("scale-out");

    } else {
      ranking.addClass("scale-out");
      // ranking.slideUp(200);
    }
  });

  var flag = 0;
  $('.contents__right').on('click','.user-ranking__title',function(e){
    console.log(3)
    ranking_box=$(".ranking-cube");
    result = ranking_box.css("-webkit-transform");
    console.log(result)
    if (flag == 0){
      ranking_box.css("-webkit-transform","rotateY(-90deg)");
      flag = 1
    }
    else if(flag == 1){
      ranking_box.css("-webkit-transform","rotateY(-180deg)");  
      flag = 2   
    }
    else if(flag == 2){
      ranking_box.css("-webkit-transform","rotateY(-270deg)");   
      flag = 3         
    }
    else if(flag == 3){ 
      ranking_box.css("-webkit-transform","rotateY(0deg)");  
      flag = 0  
    }
  });
});