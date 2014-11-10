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

function startGame(first){
  var first = first
  $.ajax({
    method: "POST",
    url: "/games/",
    dataType: "json",
    data: {
      first: first
    },
    success: function(json){
      var username = json.username;
      alert("Thanks for starting a new game, " + username + "!  Now you just need to get someone else to join in.");
      window.location.href="/";
    }
  });
}

$(function(){

  var $newGame = $('.new_game');
  var $firstOrSecond = $('.first_or_second')

  $newGame.on('submit', function(e){
    e.preventDefault();
    multipleGameCheck();
  });

  $firstOrSecond.on('submit', function(e){
    e.preventDefault();
    var first = $('input[name="first"]:checked').val();
    startGame(first);
  });

})
