get '/answers/new' do
  # redirect_unless_logged_in NEED CHANGING!
  erb :'answers/new'
end

post '/answers' do
  # redirect_unless_logged_in NEED CHANGING!
  @answer = Answer.new(params)
  if @answer.save
    redirect '/answers'
  else
    erb :'answers/new'
  end
end

get '/answers/:id' do
  @answer = Answer.find(params[:id])
  erb :'answers/show'
end

get '/answers/:id/edit' do
  @answer = Answer.find(params[:id])
  erb :'answers/edit'
end

put '/answers/:id' do
  # redirect_unless_editing_self(id) NEED CHANGING!
  @answer = Answer.find(params[:id])
  @answer.assign_attributes(params[:answer])
  if @answer.save
    redirect '/answers'
  else
    erb :'answers/edit'
  end
end

delete '/answers/:id' do
  # redirect_unless_editing_self(id) NEED CHANGING!
  @answer = Answer.find(params[:id])
  @answer.destroy
  redirect '/answers'
end
