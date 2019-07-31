$(document).on('turbolinks:load', function() { 
  function buildHTML(input,index) {
    var html = `<div class="post__bottom__images__view" >
                  <img src="${input}" class="post__bottom__images__image" height="300px" >
                  <div class="bottun-close" data-add-img-num="${index}">✖︎</div>
                 </div> `
    return html;
  }
  var files_array = [];
  var total_index = 0;
  function file_input(files,index) {
    file = files[index];
    files_array.push(file);
    var fileReader = new FileReader();
    // ファイルが読み込まれた際に、行う動作を定義する。
    fileReader.onload = function( event ) {
      // 画像のurlを取得します。
      var loadedImageUri = event.target.result;
      console.log(event)
      // var index = files_array.indexOf("ぶどう");
      // 取得したURLを利用して、ビューにHTMLを挿入する。
      var html = buildHTML(loadedImageUri,total_index);
      total_index++;
      $("#post-images-view").append(html);
      if(files.length-1 > index){
        index++;
        console.log("in")
        file_input(files,index)
      }

    };
    // ファイルの読み込みを行う。
    fileReader.readAsDataURL(file);
  }


  
  $("#post_images").change(function(e){
      // files = e.target.files[0];
      // files_array.push(files);
      var index = 0;
      file_input(e.target.files,index)
  });
  $('#form_box-form').on('submit', function(e){
    e.preventDefault();


    var new_files_array = files_array.filter(function(e) { return e; });
    console.log(new_files_array)
    var formData = new FormData(this);

    new_files_array.forEach(function(file){
      formData.append("image[images][]" , file)
     });
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
    files_array[val] = "";
    $(this).parent().remove();
  });
  $('#post-images-view').on('click', '.bottun-close-org',function(){
    $(this).parent().remove();
  });

});