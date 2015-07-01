helpers do

  def give_token(user)
    session[:user_id] = user.id
  end

  def create
    @user = User.new(params)
    @user.password = params[:password]
  end

  def login
    if params[:password]
      @user = User.find_by(username: params[:username])
      if @user && @user.password == params[:password]
        p "*" * 50
        p "inside login if"
        give_token(@user)
        redirect "/users/#{@user.id}"
      else
        @errors = @user.errors
        erb :sign_in
      end
    else
      @errors = @user.errors
      erb :sign_in
    end
  end

  def log_out
    session[:user_id] = nil
    @current_user = nil
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


