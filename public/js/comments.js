$(document).ready(function() {
  $("#new-comment").on("click", function(event){
    event.preventDefault();
     // alert("Hey your not allowed here")
    $("#comment-post").show();
    $("#new-comment").hide();
  });


  $('#new-comment-form').on('submit', function(event){
    event.preventDefault();

      var $target = $(event.target)

    $.ajax ({
      url: $target.attr('action'),
      method: $target.attr('method'),
      dataType: $target.serialize(),
    }).done(function(response){
      console.log(response)}).fail(function(error){
        console.log(error);
      });
  });
});


//this goes in question show page
// <a id="new-comment" href="/questions/<%=@question.id%>/comments/new">Add a comment to post</a><br>
//   <div id="comment-post">
//         <%= erb :'/comments/_question_comment_form' %>
//       </div>
