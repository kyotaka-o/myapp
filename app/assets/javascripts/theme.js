$(document).on('turbolinks:load', function() { 
  var contents_right = function(){
    $('.contents__right').removeClass("scale-out");
  } 
  var contents_left = function(){
    $('.contents__left').removeClass("scale-out");
  } 
  var contents_center = function(){
    $('.contents__center').fadeIn(1000);
  } 
  var footer = function(){
    $('footer').removeClass("scale-out");
  } 
  var contents = function(){
    $('.contents').removeClass("dsip_none");
  } 


  var cube_position_back = function(){
    $('.cube_orgin').css("width","100px");
    $('.cube_orgin').css("height","100px");
    $('.cube_orgin div').css("width","100px");
    $('.cube_orgin div').css("height","100px");
    $('.cube_orgin .right').css("right","50px");
    $('.cube_orgin .left').css("left","50px");
    $('.cube_orgin .top').css("top","50px");
    $('.cube_orgin .bottom').css("bottom","50px");
    $('.cube_orgin .front').css("-webkit-transform","translateZ(50px)");
    $('.cube_orgin .back').css("-webkit-transform","translateZ(-50px) rotateY(180deg)");
    $('.cube_orgin div').css("line-height","100px");
    $('.cube_orgin div').css("font-size","10px");
    $('.cube_orgin').css("animation","cuberotator 180s infinite alternate");   
    setTimeout(top_theme, 1);
    setTimeout(contents, 1);
    setTimeout(contents_left, 2000);
    setTimeout(contents_center, 1);
    setTimeout(contents_right, 2000);
    setTimeout(footer, 1000);
  } 
  var top_theme = function(){
    console.log(1)
    $('.top_theme').addClass("origin");
  } 
  var theme_all = function(){
    // $('.cube_orgin .bottom').css("transition","5s all ease 0s");
    $('.cube_orgin').css("margin", "0 auto");
    cube_position_back();

  } 
  var cube_top_close = function(){
    $('.cube_orgin .bottom').css("-webkit-transform","rotateX(-90deg) rotateY(180deg) translateZ(0)");
    $('.cube_orgin .bottom').css("bottom","100px");
    $('.cube_orgin .bottom').css("transition","1.5s all ease 0s");
    setTimeout(theme_all, 2000);
  } 
  var logo_top = function(){

    $('.logo_style').removeClass("scale-out");

    setTimeout(cube_top_close, 2000);
  } 

  var cube_top = function(){
    console.log(1)
    // transition: 5s all ease 0s;
    $('.cube_orgin .bottom').css("transition","0.5s all ease 0s");
    $('.cube_orgin .top').css("transition","1.5s all ease 0s");
    $('.cube_orgin .front').css("transition","1.5s all ease 0s");
    $('.cube_orgin .back').css("transition","1.5s all ease 0s");
    $('.cube_orgin .right').css("transition","1.5s all ease 0s");
    $('.cube_orgin .left').css("transition","1.5s all ease 0s");

    $('.cube_orgin .bottom').css("bottom","200px");
    $('.cube_orgin .bottom').css("-webkit-transform","rotateX(0deg) rotateY(180deg) translateZ(100px)");
    setTimeout(logo_top, 500);
  } 
  var cube_position = function(){
    $('.cube_orgin .right').css("right","100px");


    $('.cube_orgin .left').css("left","100px");
    // $('.cube_orgin .left').css("-webkit-transform","rotateY(90deg) translateZ(0px)");

    $('.cube_orgin .top').css("top","100px");
    // $('.cube_orgin .top').css("left","0");

    $('.cube_orgin .bottom').css("bottom","100px");

    $('.cube_orgin .front').css("-webkit-transform","translateZ(100px)");
    // $('.cube_orgin .front').css("top","0px");

    $('.cube_orgin .back').css("-webkit-transform","translateZ(-100px) rotateY(180deg)");
    // $('.cube_orgin .back').css("top","0px");


    setTimeout(cube_top, 6000);
  } 
  var cube_add = function(){
    $('.cube_orgin .front').addClass("cube_front");
    $('.cube_orgin .back').addClass("cube_back");
    $('.cube_orgin .left').addClass("cube_left");
    $('.cube_orgin .right').addClass("cube_right");

    $('.cube_orgin .top').addClass("cube_top");
    $('.cube_orgin .bottom').addClass("cube_bottom");
    cube_position();
    // setTimeout(cube_position, 3000);


  } 
  setTimeout(cube_add, 1000);


});