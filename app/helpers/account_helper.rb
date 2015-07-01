helpers do
  def current_user
    @current_user ||= User.find_by(id: session[:user_id])
  end

  def give_token(user)
    session[:user_id] = user.id
  end

  def create
    @user = User.new(params)
    @user.password = params[:password]
  end

  def login
    p "*" * 60
    p params
    if params[:password]
      @user = User.find_by(username: params[:username])
      if @user && @user.password == params[:password]
        give_token(@user)
        redirect "/users/#{@user.id}"
      else
        # @errors = @user.errors
        erb :sign_in
      end
    else
      # @errors = @user.errors
      erb :sign_in
    end
  end

  def logout
    session[:user_id] = nil
    @user = nil
  end
end

  # assign them a random one and mail it to them, asking them to change it
  # def forgot_password
  #   @user = User.find_by(username: params[:username])
  #   random_password = Array.new(10).map { (65 + rand(58)).chr }.join
  #   @user.password = random_password
  #   @user.save!
  #   Mailer.create_and_deliver_password_change(@user, random_password)
  # end
