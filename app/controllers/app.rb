get '/docs/:id' do
  # @doc = Doc.where(id: params[:id]).first
  @doc = Doc.first
  erb :"docs/show"
end

get '/myfriends' do
  return "<h3>Oh no! You haven't go any friends... :( </h3>"
end
