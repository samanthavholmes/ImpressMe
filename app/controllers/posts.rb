get '/posts' do
  @posts = Post.all
  erb :'/posts/index'
end

get '/posts/new' do
  if logged_in?
    if request.xhr?
      erb :'/posts/new', layout: false
    else
      erb :'/posts/new'
    end
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
    @image = Image.create(url: params[:image])
    @post = Post.new(params[:post].merge(user: current_user, image: @image))
    if @post.save
      @post.tags << Tag.build_from_string(params[:tag])
      redirect '/posts'
    else
      @errors = @post.errors.full_messages
      erb :'/posts/new'
    end
  else
    erb :'/unauthorized'
  end
end

get '/posts/:id/edit' do
  @post = Post.find_by(id: params[:id])
  erb :"/posts/edit"
end

put '/posts/:post_id' do
  @post = Post.find_by(id: params[:post_id])
  @post.update_attributes(params[:post])
  redirect "/users/#{current_user.id}"
end

delete '/posts/:id' do
  @post = Post.find_by(id: params[:id])
  @post_tag = PostTag.find_by(post_id: params[:id])
  if @post.user == current_user
    @post_tag.destroy
    @post.destroy
    if request.xhr?
      params[:body]
      status 200
    else
      redirect '/posts'
    end
  else
    erb :'/unauthorized'
  end
end

post '/posts_index' do
  @tag = Tag.find_by(body: params[:body])
  erb :'/tags/show'
end

