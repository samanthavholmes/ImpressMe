get '/posts/:post_id/likes/new' do
  @like = Like.find_or_create_by(user: current_user, post_id: params[:post_id])
  if request.xhr?
    @like.post.likes.length.to_s + " likes"
  else
    redirect '/posts'
  end
end
