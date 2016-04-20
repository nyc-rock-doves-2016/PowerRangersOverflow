get '/questions' do
  @questions = Question.all
  erb :'questions/index'
end

get '/questions/new' do
  erb :'questions/new'
end

post '/questions' do
  @question = Question.new(params[:entry])
  if @question.save
    redirect :'questions'
  else
    erb :'questions/new'
  end
end

get '/questions/:id' do
  @question = Question.find(params[:id])
  erb :'questions/show'
end

get '/questions/:id/edit' do
  erb :'questions/edit'
end

put '/questions/:id/edit' do
  @question = Question.find(params[:id])
  @question = Question.assign_attributes(params[:entry])
  if @question.save
    redirect '/questions'
  else
    erb :'questions/edit'
  end
end

delete '/questions/:id' do
  @question = Question.find(params[:id])
  @question.destroy
  redirect '/questions'
end
