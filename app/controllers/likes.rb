get '/posts/:post_id/likes/new' do
  if !logged_in? || current_user.liked_post?(Post.find(params[:post_id])) || current_user == Post.find(params[:post_id]).user
    erb :'/unauthorized'
  else
    @like = Like.find_or_create_by(user: current_user, post_id: params[:post_id])
    if request.xhr?
      @like.post.likes.length.to_s + " likes"
    else
      redirect '/posts'
    end
  end
end
