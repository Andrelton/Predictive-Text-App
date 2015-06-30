get '/' do
  erb :index
end

get '/sessions/new' do
  erb :sign_in
end
