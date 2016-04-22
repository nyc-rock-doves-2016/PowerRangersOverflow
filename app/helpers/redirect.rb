def redirect_unless_logged_in
  redirect '/login' unless session[:user_id]
end

def redirect_unless_editing_self(id)
  redirect "/users/#{id}" unless session[:user_id] == id
end
