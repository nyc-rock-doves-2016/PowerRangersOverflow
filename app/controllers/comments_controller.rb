get '/comments/new' do
    @question = Question.find_by(params[:question_id])
    @comment = Comment.new

    erb :'comments/new'
end

post '/comments' do
  @user = User.new(id: session[:user_id])
    @comment = @user.comments.build(params)
  if @comment.save
    redirect "/question/#{params[:question_id]}"
  else
    erb :'questions/index'
  end
end

get '/comments/:id/edit' do
  @comment = Comment.find(params[:id])
  erb :'questions/index'
end

put '/comments/:id' do
  @comment = Comment.find(params[:id])
  @comment.assign_attributes(params[:comment])
  if @comment.save
    redirect '/comments'
  else
    erb :'questions/index'
  end
end

delete '/comments/:id' do
  @comment = Comment.find(params[:id])
  @comment.destroy
  redirect '/comments'
end

