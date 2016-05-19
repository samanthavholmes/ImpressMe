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

get '/posts/:id' do
  @post = Post.find_by(id: params[:id])
  @posts = Post.all
  erb :'/posts/index'
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

get '/posts/:post_id/edit' do
  @post = Post.find_by(id: params[:post_id])
  erb :"/posts/edit"
end

put '/posts/:post_id/edit' do
  @post = Post.find_by(id: params[:post_id])
  @post.update_attributes(params[:post])
  redirect '/users/current_user.id'
end


