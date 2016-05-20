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
  $("#commented-on-posts").hide();
  $("#liked-posts").show();
 })
 $('#original-posts-link').on("click", function(e){
  e.preventDefault();
  $("#liked-posts").hide();
  $("#commented-on-posts").hide();
  $("#original-posts").show();
 })
 $('#commented-posts-link').on("click", function(e){
  e.preventDefault();
  $("#liked-posts").hide();
  $("#original-posts").hide();
  $("#commented-on-posts").show();
 })
$('#upload-image-button').on("click", function(e){
  e.preventDefault();
  $("#text-post-form").hide();
  $("#image-form").show();
 })
$('#make-text-post-button').on("click", function(e){
  e.preventDefault();
  $("#image-form").hide();
  $("#text-post-form").show();
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
  postId = e.target.closest('div').id;
  $(e.target).hide();
  $("#comment-link-" + postId).show();
  var url = '/posts/' + postId +'/comments/new';
  var type = e.target.method
  var data = $(e.target).serialize();
  $.ajax({
    url: url,
    type: type,
    data: data
  }).done(function(comment){
    $('#comment-list-' + postId).append(comment);
  })
 })
 $('.delete-post-form').on("submit", function(e){
  e.preventDefault();
  var $delete_submit = $(this);
  var postId = this.closest('div').id;
  var url = '/posts/' + postId;
  $.ajax({
    type: "delete",
    url: url
  }).done(function(){
    alert("The post was deleted.");
    $delete_submit.closest('div').hide();
  });
 })
});
