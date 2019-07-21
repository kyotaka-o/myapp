$(document).on('turbolinks:load', function() { 
  function buildHTML(input,index) {
    var html = `<div class="post__bottom__images__view" >
                  <img src="${input}" class="post__bottom__images__image" width="300px" height="300px" >
                  <div class="bottun-close" data-add-img-num="${index}">✖︎</div>
                 </div> `
    return html;
  }

  var files_array = [];
  $("#post_images").change(function(e){
    files = e.target.files[0];
    files_array.push(files)
    var index = files_array.length-1;
    var fileReader = new FileReader();
    // ファイルが読み込まれた際に、行う動作を定義する。
    fileReader.onload = function( event ) {
    // 画像のurlを取得します。
    var loadedImageUri = event.target.result;
    // 取得したURLを利用して、ビューにHTMLを挿入する。
    var html = buildHTML(loadedImageUri,index);
    $("#post-images-view").append(html);
    };
    // ファイルの読み込みを行う。
    fileReader.readAsDataURL(files);
  });

  $('#form_box-form').on('submit', function(e){
    e.preventDefault();


    var new_files_array = files_array.filter(function(e) { return e; });
    console.log(new_files_array)
    var formData = new FormData(this);

    new_files_array.forEach(function(file){
      formData.append("image[images][]" , file)
     });
    //  for(var item of formData){
    //   console.log(item);
    // }
    var url = $(this).attr('action')
    e.stopPropagation();
    $.ajax({
      url: url,
      type: "POST",
      data: formData,
      dataType: 'json',
      processData: false,
      contentType: false
    })
    .done(function(date){
        console.log(date)
        window.location.href = `/posts/${date.id}`; 
    }) 
    .fail(function(){
      alert('error');
    })
  });

  $('#post-images-view').on('click', '.bottun-close',function(){
    var val = $(this).attr("data-add-img-num");
    console.log(val)
    files_array[0] = "";
    $(this).parent().remove();
  });
  $('#post-images-view').on('click', '.bottun-close-org',function(){
    $(this).parent().remove();
  });
});