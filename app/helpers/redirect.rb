def redirect_unless_logged_in
  redirect '/' unless session['email']
end

def redirect_unless_editing_self(id)
  redirect "/" unless session[:user_id].inspect == id
end