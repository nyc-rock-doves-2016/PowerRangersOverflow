# get '/:commentable_type/:commentable_id/comments' do
#   @comments = Comment.find_by(commentable_id: params[:commentable_id])

#   @comments = @commentable.comments
#   erb :'comments/index'
# end

post '/comments' do
   redirect_unless_logged_in
    @comment = @commentable.comments.build(params[:answer_id])
    @comment.user_id = current_user.id
  end
  if @comment.save
    redirect '/answer/show'
  else
    erb :'comments/answer_new'
  end
end

get '/comments/:id/edit' do
  @comment = Comment.find(params[:id])
  erb :'comments/edit'
end

put '/comments/:id' do
  @comment = Comment.find(params[:id])
  @comment.assign_attributes(params[:comment])
  if @comment.save
    redirect '/comments'
  else
    erb :'comments/edit'
  end
end

delete '/comments/:id' do
  @comment = Comment.find(params[:id])
  @comment.destroy
  redirect '/comments'
end

## Likely unnecessary, using partials for forms inline instead

# get '/comments/new' do
#     @question = Question.find_by(params[:question_id])
#     @comment = Comment.new

#     erb :'comments/question_new'
# end

# post '/comments' do
#    redirect_unless_logged_in
#     @comment = @commentable.comments.build(params[:question_id])
#     @comment.user_id = current_user.id
#   end
#   if @comment.save
#     redirect '/questions/show'
#   else
#     erb :'comments/question_new'
#   end
# end

# get '/answers/:answer_id/comments/new' do
#     @answer = Answer.find_by(params[:answer_id])
#     @comment = Comment.new

#     erb :'comments/answer_new'
# end

# get '/comments/:id' do
#   @comment = Comment.find_by(params[:id])
#   @comment =  @commentable.comments.find(params[:comment])
#   erb :'comments/show'
# end
