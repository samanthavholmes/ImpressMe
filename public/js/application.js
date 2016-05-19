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
 $('#liked-posts-link').on("click", function(e){
  e.preventDefault();
  $("#original-posts").hide();
  $("#liked-posts").show();
 })
 $('#original-posts-link').on("click", function(e){
  e.preventDefault();
  $("#liked-posts").hide();
  $("#original-posts").show();
 })
 $('.new-comment-link').on("click", function(e){
  e.preventDefault();
  var post = e.target.closest('div')
  var clicked = e.target
  var url = $(e.target).attr("href")
  $.ajax({
    url: url,
  }).done(function(response){
    $(clicked).hide();
    $(post).append(response);
  })
 })
});
