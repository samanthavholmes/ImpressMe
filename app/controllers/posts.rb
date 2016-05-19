get '/posts' do
  @posts = Post.all
  erb :'/posts/index'
end

get '/posts/new' do
  if logged_in?
    erb :'/posts/new'
  else
    erb :'/unauthorized'
  end
end

post '/posts/new' do
  if logged_in?
    @post = Post.new(params[:post].merge(user: current_user))
    if @post.save
      @post.tags.build_from_string(params[:tag])
      redirect '/posts'
    else
      @errors = @post.errors.full_messages
      erb :'/posts/new'
    end
  else
    erb :'/unauthorized'
  end
end
