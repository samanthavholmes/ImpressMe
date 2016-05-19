get '/posts/:post_id/likes/new' do
  @like = Like.create(post_id: params[:post_id])
  if request.xhr?
    @like.post.likes.length.to_s
  else
    redirect '/posts'
  end
end
