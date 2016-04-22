$(document).ready(function() {
  $("#new-question-comment").on("click", function(event){
    event.preventDefault();
    $("#questions-comments-post").show();
    $('#new-question-comment').hide();
  });


  $('.question-post-form').on('submit', function(event){
    event.preventDefault();
      var $target = $(event.target);

    $.ajax ({
      url: $target.attr('action'),
      method: $target.attr('method'),
      data: $target.serialize()
    }).done(function(response){
     $('.questions-comments').append(response);
        $(".question-post-form")[0].reset();
        $("#new-question-comment").show();
        $("#questions-comments-post").hide();
      }).fail(function(error){
        console.log(error);
      });
  });



$("#new-answer-comment").on("click", function(event){
    event.preventDefault();
    $("#answers-comments-post").show();
    $('#new-answer-comment').hide();
  });


  $('.answer-post-form').on('submit', function(event){
    event.preventDefault();
      var $target = $(event.target);

    $.ajax ({
      url: $target.attr('action'),
      method: $target.attr('method'),
      data: $target.serialize()
    }).done(function(response){
     $('.answers-comments').append(response);
        $(".answer-post-form")[0].reset();
        $("#new-answer-comment").show();
        $("#answers-comments-post").hide();
      }).fail(function(error){
        console.log(error);
      });
  });

});


//this goes in question show page
// <a id="new-comment" href="/questions/<%=@question.id%>/comments/new">Add a comment to post</a><br>
//   <div id="comment-post">
//         <%= erb :'/comments/_question_comment_form' %>
//       </div>
