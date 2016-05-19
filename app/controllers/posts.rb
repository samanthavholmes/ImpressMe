get '/posts' do
  @posts = Post.all
  erb :'/posts/index'
end

get '/posts/new' do
  erb :'/posts/new'
end

post '/posts/new' do
  if logged_in?
    @post = Post.new(params[:post].merge(user: current_user))
    if @post.save
      redirect '/posts'
    else
      @errors = @post.errors.full_messages
      erb :'/posts/new'
    end
  else
    halt 403
    erb :'/unauthorized'
  end
end
