$(document).ready(function(){

  $('#answer_button').on('click',function(event){
    event.preventDefault();
    $(this).toggle();
    $('#answer_new_form').show();

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
      $('.answer-content').append(response);
    });
    $target.hide();
    $('#answer_new_form')[0].reset();
    $('#answer_button').toggle();
  });

});
