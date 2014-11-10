console.log(":(:(:(:(:(:(:(")


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

function selectBoardspace(position){
  var position = position;
  $.ajax({
    method: "PATCH",
    url: "/boardspaces/",
    dataType: "json",
    data: {position: position},
    success: function(json){
      var position = json.position;
      var xOFromStatus = json.xOFromStatus;
      fillInBoardspace(position, xOFromStatus);
    }
  });
}

function fillInBoardspace(position, xOFromStatus){
  var $selectedSpace = $('#' + position);
  var $xOFromStatus = xOFromStatus;
  $('#' + position)[0].firstElementChild.className = $xOFromStatus;
}

$(function(){

  var $firstOrSecond = $('.first_or_second');
  var $joinGame = $('.join_game');
  var $boardspaces = $('.boardspace');
  // var $resumeGame = $('.resume_game');

  $firstOrSecond.on('submit', function(e){
    e.preventDefault();
    var first = $('input[name="first"]:checked').val();
    startGame(first);
  });

  $boardspaces.on('click', function(e){
    var position = (this).id;
    var first = (this).classList[1];
    var occupied_spaces = 0;
    $.each($boardspaces, function(index, value){
      if (value.firstElementChild.className != "empty"){
        occupied_spaces += 1
      };
    });
    if (first==="true" && occupied_spaces % 2===0) {
      selectBoardspace(position)
    } else if (first==="false" && occupied_spaces % 2===1) {
      selectBoardspace(position)
    } else {
      return false
    };

  });

})
