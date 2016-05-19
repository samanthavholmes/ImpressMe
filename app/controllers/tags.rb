get '/posts/:post_id/tags/:id' do
  @post = Post.find_by(id: params[:post_id])
  @tag = Tag.find_by(id: params[:id])
  erb :'/tags/show'
end

post 'post/:post_id/tags' do
  post = Post.find_by(id: params[:post_id])
  post.tags.build_from_string(params[:tag])
  redirect "/posts/#{post.id}"
end


