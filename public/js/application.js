$(document).ready(function() {
 $('.like-button').on("submit", function(e){
  e.preventDefault();
  var likes = $(this).find('.like-count')
  var url = e.target.action
  $.ajax({
    url: url
  }).done(function(likeCount){
    $(likes).text(likeCount);
  })
 })
});
