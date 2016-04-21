get '/questions/:question_id/comments/new' do
    @question = Question.find(params[:question_id])
    @comment = Comment.new

    erb :'comments/new'
end

# post '/:commentable/:commentable_id/comments' do
post '/questions/:question_id/comments' do
  @question = Question.find(params[:question_id])
  @comment = @question.comments.new(params[:comment])

  if @comment.save
    redirect "/questions/#{params[:question_id]}"
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
