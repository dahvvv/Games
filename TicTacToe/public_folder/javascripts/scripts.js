console.log(":D")

var myTurn = ""

function multipleGameCheck(starterOrJoiner, gameID){
  var starterOrJoiner = starterOrJoiner
  var gameID = gameID
  $.ajax({
    method: "GET",
    url: "/games/multiple_game_check",
    dataType: "json",
    data: {starter_or_joiner: starterOrJoiner, game_id: gameID},
    success: function(json){
      var check = json.check;
      var starterOrJoiner = json.starter_or_joiner;
      var gameID = json.game_id;
      if (check==="fail"){
        alert("You already have an active game!")
      } else if (starterOrJoiner==="starter") {
        window.location.href="/games/first_or_second";
      } else {
        joinGame(gameID);
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

function joinGame(gameID){
  var gameID = gameID;
  $.ajax({
    method: "POST",
    url: "/players/",
    dataType: "json",
    data: {game_id: gameID},
    success: function(json){
      var gameID = json.game_id;
      window.location.href="/games/" + gameID;
    }
  });
}

function selectBoardspace(position, myTurn){
  var position = position;
  var myTurn = myTurn;
  $.ajax({
    method: "PATCH",
    url: "/boardspaces/",
    dataType: "json",
    data: {position: position, my_turn: myTurn},
    success: function(json){
      var position = json.position;
      var xOrO = json.x_or_o;
      var myTurn = json.my_turn;
      fillInBoardspace(position, xOrO);
      updateTurn(myTurn);
    }
  });
}

function fillInBoardspace(position, xOrO){
  var $selectedSpace = $('#' + position);
  var $xOrO = xOrO;
  var $div = $("<div>");
  if ($xOrO==="O"){
    $div.addClass("O");
    $selectedSpace.append($div);
  } else {
    $div.addClass("XL");
    $selectedSpace.append($div);
    var $divR = $("<div>");
    $divR.addClass("XR");
    $selectedSpace.append($divR);
  }
}

function updateTurn(myTurn){
  var myTurn = myTurn;
  // $.ajax({
  //   method: "PATCH",
  //   url: "/games/",
  //   dataType: "json",
  //   success: function(json){
  //     var $myTurn = json.my_turn;
      var $span = $('span.whose_turn');
      if (myTurn==="true"){
        $span.innerHTML="it's your turn!"
      } else {
        $span[0].innerHTML="it is not your turn."
      }
    // }
  // });
}

$(function(){

  var $newGame = $('.new_game');
  var $firstOrSecond = $('.first_or_second');
  var $joinGame = $('.join_game');
  var $resumeGame = $('.resume_game');
  var $boardspaces = $('.boardspace')

  $newGame.on('submit', function(e){
    e.preventDefault();
    var starterOrJoiner = "starter";
    var game_id = "irrelevant";
    multipleGameCheck(starterOrJoiner, game_id);
  });

  $firstOrSecond.on('submit', function(e){
    e.preventDefault();
    var first = $('input[name="first"]:checked').val();
    startGame(first);
  });

  $joinGame.on('click', function(e){
    e.preventDefault();
    var starterOrJoiner = "joiner";
    var gameID = (this).id;
    multipleGameCheck(starterOrJoiner, gameID);
  });

  $boardspaces.on('click', function(e){
    var $boardspaces = $('.boardspace');
    var position = (this).id;
    var myTurn = (this).classList[1].slice(6,((this).classList[1].length));
    if (myTurn==="true"){
      selectBoardspace(position, myTurn);
      $.each($boardspaces, function(index, value){
        value.className = "boardspace myturnfalse"
      });
    } else {
      return false;
    }
  });

})
