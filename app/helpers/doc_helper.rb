helpers do
  def create_doc
    @docs = @current_user.docs
    @doc = Doc.new(title: params[:title], user_id: @current_user.id)
    if @doc.save
      @docs << @doc
    else
      status 500
      "Whoops! Something TERRIBLE happened... O_O"
    end
  end
end
