$(document).ready(function() {


  $(".new-question").on("click", function(e){
    e.preventDefault();
    $("#question-post").show();
  });



  $(".new-question-form").on("submit", function(e){
    e.preventDefault();

    $target = $(e.target);

    $.ajax({
      url: $target.attr('action'),
      method: $target.attr('method'),
      data: $target.serialize()
    }).done(function(response){
      $(".new-question").show();
      $(".main-content").append(response);
      $(".new-question-form")[0].reset();
    });
  });


});
