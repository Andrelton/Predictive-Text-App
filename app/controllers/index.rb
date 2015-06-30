get '/' do
  erb :index
end

#-----------SESSIONS---------------
get '/sessions/new' do
  erb :sign_in
end

post '/sessions' do
  login

  #sign in user if valid
  #redirect user to erb sign in if invalid
end

#-----------USERS---------------
get '/users/new' do
  erb :sign_up

end

post '/users' do
  #create user -- use model
  #redirect to user profile page
end

#-----------DOCS---------------