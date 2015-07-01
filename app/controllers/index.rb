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

delete "/sessions/:user_id" do
  # @user = User.where(id: params[:user_id]).first
  current_user
  logout
  redirect '/'
end

#-----------USERS---------------
get '/users/new' do
  erb :sign_up
end

post '/users' do
  create
  if @user.save
    give_token(@user)
    redirect "/users/#{@user.id}"
  else
    erb :sign_up
  end
end

get '/users/:user_id' do
  # @user = User.where(id: params[:id]).first
  current_user
  @docs = @current_user.docs
  erb :'users/user_docs'
end

get '/users/:user_id/docs' do
  "users documents"
end
