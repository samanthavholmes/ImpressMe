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
  var clicked = e.target
  var postId = e.target.closest('div').id
  var url = $(e.target).attr("href")
  $.ajax({
    url: url,
  }).done(function(response){
    $(clicked).hide();
    $('#' + postId).append(response);
  })
 })
 $(".posts").on("submit", ".new-comment-form", function(e){
  e.preventDefault();
  debugger;
 $('.new-comment-form').replaceWith('.new-comment-link')
 })
});
