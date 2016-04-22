$(document).ready(function(){

  $('#answer_button').on('click',function(event){
    event.preventDefault();
    var $target = $(event.target)
    $target.hide();
    $('.answer-post').show();

  });

  $('#answer_new_form').on('submit', function(event){
    event.preventDefault();
    var $target = $(event.target);
    requestOptions = {
      url: $target.attr("action"),
      method: $target.attr("method"),
      data: $target.serialize()
    };
    requestObject = $.ajax(requestOptions);
    requestObject.done(function(response){
      $('.main-content').append(response);
    });
    $target.hide();
    $('#answer_button').show();
  });

});


//question show page
<div class="container">
  <div class="main-content">
    <div class="questions-content">

      <div class="votes">
        <a href="#">Up</a>
          <p class="score"><%=@question.points || 0 %></p>
        <a href="#">Down</a><br>
      </div>

      <div class="questions">
        <h1><%=@question.title%></h1>
        <p><%=@question.content%></p>
        <% if session[:user_id].to_i == @question.user_id %>
          <a href='/questions/<%=@question.id%>/edit'>Edit Post</a>
        <% end %>

      </div>

    </div>

    <div class="questions-comments">
    <% if @question.comments %>
      <% @question.comments.each do |comment|%>
        <div class="questions-comments">
          <%= comment.content %>
        <% if comment.user_id == session[:user_id].to_i %>
          <a href="/comments/<%=comment.id%>/edit">Edit Comment</a>
        <% end %>
        </div>
      <% end %>
    <% end %>
      <br>
      <a href="/questions/<%=@question.id%>/comments/new">Add a comment to post</a><br>
    </div>


  <div class="main-content">
     <% if @question.answers %>
    <div class="answer-content">

      <div class="votes">
        <a href="#">Up</a>
          <p class="score">#</p>
        <a href="#">Down</a><br>
      </div>

      <% @question.answers.each do |answer| %>
       <%= erb :'/answers/_answer.html', locals: {answer: answer}%>

      <% end %>
      <% end %>

    </div>
      <button id="answer_button" class="button center">Answer</button>
 <%= erb :'/answers/_new_form.html' %>
  </div>
</div>

