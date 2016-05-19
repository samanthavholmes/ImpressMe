$(document).ready(function() {
 $('.like-button').on("submit", function(e){
  e.preventDefault();
  var like_button = $(this).find('button')
  var likes = $(this).find('.like-count')
  var url = e.target.action
  $.ajax({
    url: url
  }).done(function(likeCount){
    $(like_button).hide();
    $(likes).text(likeCount);
  })
 })
});
