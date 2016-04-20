enable :sessions

get '/login' do
  erb :'sessions/new'
end

post '/login' do
  user = User.find_by(email: params[:email])
  if user && user.authenticate(password: params[:password])
    session[:user_id] = user.id
    redirect "/users/#{user.id}"
  else
    #@errors = ["Wrong login info"]
    erb :'sessions/new'
end

delete '/logout' do
  session.clear
  redirect '/'
end
