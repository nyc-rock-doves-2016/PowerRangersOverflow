get '/questions' do
  @questions = Question.all
  erb :'questions/index'
end

get '/questions/new' do
  erb :'questions/new'
end

post '/questions' do
  @question = Question.new(title: params[:entry][:title],content: params[:entry][:content], user_id: session[:user_id])
  @tag_names = params[:entry][:tags].split(' ')
  @tag_names.each do |tag_name|
    tag = Tag.find_or_create_by(content: tag_name)
    @question.tags << tag
  end
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
