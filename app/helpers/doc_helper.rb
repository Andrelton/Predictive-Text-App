helpers do
  def create_doc
    @docs = @current_user.docs
    @doc = Doc.create!(params)
    @doc.user_id = @current_user.id
    @docs << @doc
  end
end
