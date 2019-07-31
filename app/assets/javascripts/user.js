$(document).on('turbolinks:load', function() { 

  $('.contents__right').on('click','.user-ranking-button .fas',function(e){	
    ranking=$(".ranking-stage");
    if (ranking.hasClass("scale-out")) {
      ranking.removeClass("scale-out");
    } else {
      ranking.addClass("scale-out");
    }
  });

  var flag = 0;
  $('.contents__right').on('click','.user-ranking__title',function(e){
    ranking_box=$(".ranking-cube");
    result = ranking_box.css("-webkit-transform");
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