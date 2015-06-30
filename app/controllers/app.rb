get '/docs/:id' do
  @message = "I can say this so many times."
  erb :"docs/show"
end

get '/myfriends' do
  return "<h3>Oh no! You haven't go any friends... :( </h3>"
end
