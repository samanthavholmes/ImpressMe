get '/posts/:post_id/comments/new' do
  @post = Post.find_by(id: params[:post_id])
  if request.xhr?
    erb :"/comments/new", layout: false, locals: {post: @post}
  else
    erb :"/comments/new", layout: false, locals: {post: @post}
  end
end

post '/posts/:post_id/comments/new' do
  @post = Post.find_by(id: params[:post_id])
  if logged_in?
    @comment = Comment.new(params[:comment].merge(user: current_user, post: @post))
    if @comment.save
      redirect "/posts/#{@post.id}"
    else
      @errors = @comment.errors.full_messages
      erb :'/comments/new', layout: false, locals: {post: @post}
    end
  else
    erb :'/unauthorized'
  end
end
