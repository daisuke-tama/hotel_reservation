$(document).on('turbolinks:load', function() {
  
  function Search(text) {
    $(".keyword-list").each(function(index,element) {
      let keyword = $(element).text();
      if(keyword.indexOf(text) === -1) {
        $(element).parent().css("display","none");
      }
      else {
        $(element).parent().css("display","flex");
      }
    });
  }
  
  $(".input-text").on("input", function(event) {
    let text = $(".input-text").val();
    if(text === "") {
      $(".card").css("display","flex");
      }
      else {
        Search(text);
      }
    });
});
