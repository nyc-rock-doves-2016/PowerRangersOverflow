get '/:commentable_type/:commentable_id/comments/new' do
    if params[:commentable_type] == 'questions'
      @question = Question.find(params[:commentable_id])
    else
      @answer = Answer.find(params[:commentable_id])
    end
  erb :'comments/new'
end

post '/comments' do
  @comment = Comment.new(params[:comment])
  if @comment.save
    redirect "/questions/#{@comment.commentable.question.id}"
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
