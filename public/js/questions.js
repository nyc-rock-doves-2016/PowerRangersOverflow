$(document).ready(function() {


  $("#new-question").on("click", function(e){
    e.preventDefault();
    $("#question-post").show();
    $("#new-question").hide();
  });



  $("#new-question-form").on("submit", function(e){
    e.preventDefault();

    $target = $(e.target);

    $.ajax({
      url: $target.attr('action'),
      method: $target.attr('method'),
      data: $target.serialize()
    });
      debugger;
  });


});
