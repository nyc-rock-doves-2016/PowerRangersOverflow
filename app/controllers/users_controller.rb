get '/users' do
  redirect_unless_logged_in
  @users = User.all
  erb :'users/index'
end

get '/users/new' do
  erb :'users/new'
end

post '/users' do
  @user = User.new(params)
  if @user.save
    redirect '/users'
  else
    erb :'users/new'
  end
end

get '/users/:id' do
  redirect_unless_logged_in
  @user = User.find(params[:id])
  erb :'users/show'
end

get '/users/:id/edit' do
  redirect_unless_editing_self(params[:id])
  @user = User.find(params[:id])
  erb :'users/edit'
end

put '/users/:id' do
  redirect_unless_editing_self(params[:id])
  @user = User.find(params[:id])
  @user.assign_attributes(params[:user])
  if @user.save
    redirect '/users'
  else
    erb :'users/edit'
  end
end

delete '/users/:id' do
  redirect_unless_editing_self(params[:id])
  session.clear
  @user = User.find(params[:id])
  @user.destroy
  redirect '/users'
end
