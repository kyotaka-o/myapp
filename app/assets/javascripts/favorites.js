$(document).on('turbolinks:load', function() { 


  $('#favorites').on('click', '.favo-off',function(e){
    e.preventDefault();
    e.stopPropagation();
    var url = $(this).attr('href')
    var result = url.split('/');
    url=`/${result[1]}/${result[2]}/${result[3]}`
    $.ajax({
      url: url,
      type: "POST",
      data: { keyword: "" },
      dataType: 'json'
    })
    .done(function(date){
      current_num = $('#favorites p').text();
      // console.log(p)
      current_num = Number(current_num);
      current_num = current_num + 1
      $('#favorites p').text(current_num);
      $('#favorites a').removeClass("favo-off");
      $('#favorites a').addClass("favo-on");
    }) 
    .fail(function(){
      alert('error');
    })
  });

  $('#favorites').on('click', '.favo-on',function(e){
    e.preventDefault();
    e.stopPropagation();
    var url = $(this).attr('href')
    $.ajax({
      url: url,
      type: "DELETE",
      data: { keyword: "" },
      dataType: 'json'
    })
    .done(function(date){
      current_num = $('#favorites p').text();
      current_num = Number(current_num);
      current_num = current_num - 1
      $('#favorites p').text(current_num);
      $('#favorites a').removeClass("favo-on");
      $('#favorites a').addClass("favo-off");
    }) 
    .fail(function(){
      alert('error');
    })
  });


});