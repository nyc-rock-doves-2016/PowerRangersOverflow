enable :sessions

get '/login' do
  erb :'sessions/login'
end

post '/login' do
  user = User.find_by(email: params[:email])
  if user && user.authenticate(params[:password])
    session[:user_id] = user.id
    session[:full_name] = user.full_name
    session[:email] = user.email

    redirect "/users/#{user.id}"
  else
    #@errors = ["Wrong login info"]
    erb :'sessions/login'
  end
end

delete '/logout' do
  session.clear
  redirect '/'
end
