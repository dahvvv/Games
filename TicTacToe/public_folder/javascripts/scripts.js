console.log(":D")

function multipleGameCheck(){
    $.ajax({
      method: "GET",
      url: "/games/multiplegamecheck",
      dataType: "json",
      success: function(json){
        var check = json.check;
        alert(check)
      }
    })
}

$(function(){

  var $newGame = $('.new_game');

  $newGame.on('submit', function(e){
    e.preventDefault();
    multipleGameCheck();
  });

})