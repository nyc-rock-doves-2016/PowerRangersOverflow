get '/:commentable_type/:commentable_id/comments/new' do
  redirect_unless_logged_in
    case params[:commentable_type]
      when 'Question' then @question = Question.find(params[:commentable_id])
      when 'Answer'   then @answer = Answer.find(params[:commentable_id])
    end
  erb :'comments/new'
end

post '/comments' do
  @comment = Comment.new(params[:comment])
  if @comment.save
    case params[:comment][:commentable_type]
      when "Question" then redirect "/questions/#{@comment.commentable.id}"
      when "Answer" then   redirect "/questions/#{@comment.commentable.question.id}"
    end
  else
    erb :'questions/index'
  end
end

get '/comments/:id/edit' do
  @comment = Comment.find(params[:id])
  erb :"comments/edit"
end

put '/comments/:id' do
  @comment = Comment.find(params[:id])
  @comment.assign_attributes(params[:comment])
  if @comment.save
    case @comment.commentable_type
      when "Question" then redirect "/questions/#{@comment.commentable.id}"
      when "Answer"   then redirect "/questions/#{@comment.commentable.question.id}"
    end
  else
    erb :'questions/index'
  end
end

delete '/comments/:id' do
  @comment = Comment.find(params[:id])
  case @comment.commentable_type
    when "Question" then @question = @comment.commentable
    when "Answer"   then @question = @comment.commentable.question
  end
  @comment.destroy
  redirect "/questions/#{@question.id}"
end
