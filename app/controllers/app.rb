get '/docs/new' do
  current_user
  erb :"docs/new_doc"
end

post '/docs' do
  create_doc
  redirect '/users/:user_id/docs'
end

get '/docs/:id' do
  @doc = Doc.where(id: params[:id]).first
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

delete 'docs/:id' do
  doc = Doc.where(id: params[:id]).first
  doc.destroy
end
