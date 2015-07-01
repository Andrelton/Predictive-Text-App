get '/docs/new' do
  erb :"docs"
end

post '/docs' do
  #
end

get '/docs/:id' do
  # @doc = Doc.where(id: params[:id]).first
  @doc = Doc.first
  erb :"docs/show"
end

put '/docs/:id' do
  doc = Doc.where(id: params[:id]).first
  doc.content = params[:content]
  if doc.save
    content_type :json
    doc.user_id.to_json
  else
    status 500
    "Whoops! Something TERRIBLE happened... O_O"
    # error message
  end
end

