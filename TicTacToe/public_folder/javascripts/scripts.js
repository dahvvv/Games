console.log(":D")

function multipleGameCheck(){
  $.ajax({
    method: "GET",
    url: "/games/multiple_game_check",
    dataType: "json",
    success: function(json){
      var check = json.check;
      if (check==="fail"){
        alert("You already have an active game!")
      } else {
        window.location.href="/games/first_or_second";
      };
    }
  });
}

$(function(){

  var $newGame = $('.new_game');

  $newGame.on('submit', function(e){
    e.preventDefault();
    multipleGameCheck();
  });

})