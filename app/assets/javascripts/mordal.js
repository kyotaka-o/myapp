$(document).on('turbolinks:load', function() { 
  //センタリングをする関数
  function centeringModalSyncer(){

    //画面(ウィンドウ)の幅を取得し、変数[w]に格納
    var w = $(window).width();
    console.log(w)
    //画面(ウィンドウ)の高さを取得し、変数[h]に格納
    var h = $(window).height();
    console.log(h)
    //コンテンツ(#modal-content)の幅を取得し、変数[cw]に格納
    var cw = $("#modal-content").outerWidth(true);
    console.log(cw)
    //コンテンツ(#modal-content)の高さを取得し、変数[ch]に格納
    var ch = $("#modal-content").outerHeight(true);
    console.log(ch)
    //コンテンツ(#modal-content)を真ん中に配置するのに、左端から何ピクセル離せばいいか？を計算して、変数[pxleft]に格納
    var pxleft = ((w - cw)/2);

    //コンテンツ(#modal-content)を真ん中に配置するのに、上部から何ピクセル離せばいいか？を計算して、変数[pxtop]に格納
    var pxtop = ((h - ch)/2);
    console.log(pxleft)
    console.log(pxtop)
    //[#modal-content]のCSSに[left]の値(pxleft)を設定
    $("#modal-content").css({"left": pxleft + "px"});

    //[#modal-content]のCSSに[top]の値(pxtop)を設定
    $("#modal-content").css({"top": pxtop + "px"});

  }
  function mordal_close(){
    //[#modal-overlay]、または[#modal-close]をクリックしたら起こる処理
    //[#modal-overlay]と[#modal-close]をフェードアウトする
    $("#modal-content,#modal-overlay").fadeOut("slow",function(){
      //フェードアウト後、[#modal-overlay]をHTML(DOM)上から削除
      $("#modal-overlay").remove();
      $("#modal-content").remove();
    });

  }

  $(".mordal-image").click(
    function(){
      //キーボード操作などにより、オーバーレイが多重起動するのを防止する
      $(this).blur() ;	//ボタンからフォーカスを外す
      if($("#modal-overlay")[0]) return false ;		//新しくモーダルウィンドウを起動しない [下とどちらか選択]
      // if($("#modal-overlay")[0]) $("#modal-overlay").remove() ;		//現在のモーダルウィンドウを削除して新しく起動する [上とどちらか選択]

      //オーバーレイ用のHTMLコードを、[body]内の最後に生成する
      $("body").append('<div id="modal-overlay"></div>');

      //[$modal-overlay]をフェードインさせる
      $("#modal-overlay").fadeIn("slow");
      var contents = $(this).clone(true);
      contents[0].setAttribute("id","modal-content");
      contents[0].setAttribute("style","display:none");

      contents.css("width","600px");
      $("body").append(contents);
      //[$modal-content]をフェードインさせる
      $("#modal-content").fadeIn("slow");
      centeringModalSyncer();



    }
  );
  $("#modal-close").unbind().click(function(){
    mordal_close();
  
  });
  $('body').on('click','#modal-overlay',function(e){
    mordal_close();
  });

});