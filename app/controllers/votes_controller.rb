post '/:votable_type/:votable_id/vote' do
    if params[:votable_type] == 'questions'
      @question = Question.find(params[:votable_id])
      question.votes.create
    elsif params[:votable_type] == 'answers'
      @answer = Answer.find(params[:votable_id])
    else
      @comment = Comment.find(params[:votable_id])
    end

  erb :'comments/new'
end




post '/votes' do




  @comment = Comment.new(params[:comment])
  if @comment.save
    redirect "/questions/#{@comment.commentable.question.id}"
  else
    erb :'questions/index'
  end
end
