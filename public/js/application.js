$(document).ready(function() {
  $(".upvote").on("submit", function(e){
    e.preventDefault();
    url = $(this).attr("action")
  $.ajax({
      url: url,
      type: 'post',
    }).done(function(response){
      var vote_value = $(response).find(".vote_count" + url.split('/')[1])

      $(".vote_count" + url.split('/')[1]).html(vote_value)
    })
  }

    )
});

