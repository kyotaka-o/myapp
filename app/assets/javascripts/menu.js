$(document).on('turbolinks:load', function() { 

  $('.menu').on('click','.menu__top__button',function(e){
    e.preventDefault();
    $('body,html').animate({
      scrollTop: 0},300);
  });

  $('.menu').on('click','.menu__bottom__button',function(e){
    e.preventDefault();
    $('body,html').animate({
      scrollTop: $(document).height()},300);
  });
});