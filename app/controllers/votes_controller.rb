post '/votes' do
  case params[:vote][:votable_type]
    when 'Question'
      @question = Question.find(params[:vote][:votable_id])
      @vote = Vote.new(params[:vote])
    when 'Answer'
      @answers = Answer.find(params[:vote][:votable_id])
      @vote = Vote.new(params[:vote])
    when 'Comment'
      @comments = Comment.find(params[:vote][:votable_id])
      @vote = Vote.new(params[:vote])
    end

  if @vote.save
    redirect "/questions/#{@vote.votable.question.id}"
  else
    erb :'questions/index'
  end
end
