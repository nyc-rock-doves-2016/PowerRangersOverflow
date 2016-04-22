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
      url:    $target.attr("action"),
      method: $target.attr("method"),
      data:   $target.serialize()
    };
    requestObject = $.ajax(requestOptions);
    requestObject.done(function(response){
      $('#answers-content').append(response);
    });
    $target.hide();
    $('#answer_button').show();
  });

});
