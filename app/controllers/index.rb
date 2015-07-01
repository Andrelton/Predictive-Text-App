get '/' do
  erb :index
end

#-----------SESSIONS---------------
get '/sessions/new' do
  erb :sign_in
end

post '/sessions' do
  login
end

#-----------USERS---------------
get '/users/new' do
  erb :sign_up
end

post '/users' do
  create
  p @user
  if @user.save
    give_token(@user)
    redirect "/users/#{@user.id}"
  else
    erb :sign_up
  end
end

get '/users/:id' do
  @user = User.where(:id => params[:id]).first
  @docs = @user.docs
  erb :'users/user_docs'
end
