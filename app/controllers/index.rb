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
get '/users' do
  @users = User.all
  erb :"users/index"
end

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

get '/users/:id' do
  @user = User.where(id: params[:id]).first
  @docs = @user.docs
  erb :'users/user_docs'
end

get '/users/:id/edit' do
  @user = User.where(id: params[:id]).first
  erb :'users/user_edit'
end

put '/users/:id' do
  @user = User.where(id: params[:id]).first
  @user.update_attributes(:first_name => params[:first_name], :username => params[:user_name])
  redirect "/users/#{@user.id}"
end
