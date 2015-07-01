helpers do
  def create_doc
    @doc = Doc.new(params)
    #TODO: save doc under @user.docs
  end
end
