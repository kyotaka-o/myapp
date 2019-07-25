$(document).on('turbolinks:load', function() { 
  function buildHTML(input,index) {
    var html = `<div class="post__bottom__images__view" >
                  <img src="${input}" class="post__bottom__images__image" height="300px" >
                  <div class="bottun-close" data-add-img-num="${index}">✖︎</div>
                 </div> `
    return html;
  }

  // $("#post_images").change(function(e){
  //   files = e.target.files[0];
  //   var fileReader = new FileReader();
  //   // ファイルが読み込まれた際に、行う動作を定義する。
  //   fileReader.onload = function( event ) {

  //     // 画像のurlを取得します。
  //     var loadedImageUri = event.target.result;
  //     // 取得したURLを利用して、ビューにHTMLを挿入する。
  //     var html = buildHTML(loadedImageUri,index);
  //     $("#post-images-view").append(html);

  //   };
  //   // ファイルの読み込みを行う。
  //   fileReader.readAsDataURL(files);
  // });

  $('.post__bottom__video__view').on('click', '.bottun-close-video',function(){
    console.log(1)
    $(this).parent().remove();
  });
  // $('#post-images-view').on('click', '.bottun-close-org',function(){
  //   $(this).parent().remove();
  // });

});