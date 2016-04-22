get '/answers/new' do
  redirect_unless_logged_in
  erb :'answers/new'
end

post '/answers' do
  redirect_unless_logged_in
  @answer = Answer.new(params)
  if request.xhr? && @answer.save
    erb :'answers/_answer.html', locals: {answer: @answer}, layout: false
  else
    if @answer.save
      redirect "/questions/#{params[:question_id]}"
    else
      erb :'answers/new'
    end
  end
end

get '/answers/:id' do
  @answer = Answer.find(params[:id])
  erb :'answers/show'
end

get '/answers/:id/edit' do
  @answer = Answer.find(params[:id])
  redirect_unless_editing_self(@answer.user_id)
  erb :'answers/edit'
end

put '/answers/:id' do
  @answer = Answer.find(params[:id])
  redirect_unless_editing_self(@answer.user_id)
  @answer.assign_attributes(params[:answer])
  if @answer.save
    redirect "/questions/#{@answer.question_id}"
  else
    erb :'answers/edit'
  end
end

delete '/answers/:id' do
  @answer = Answer.find(params[:id])
  redirect_unless_editing_self(@answer.user_id)
  @question_id = @answer.question_id
  @answer.destroy
  redirect "/questions/#{@question_id}"
end
