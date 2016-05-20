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
      if request.xhr?
        erb :'/comments/_individual_comment', layout: false, locals: {comment: @comment}
      else
        redirect "/posts/#{@post.id}"
      end
    else
      @errors = @comment.errors.full_messages
      erb :'/comments/new', layout: false, locals: {post: @post}
    end
  else
    erb :'/unauthorized'
  end
end
