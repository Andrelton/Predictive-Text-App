helpers do

  def give_token
    session[:user_id] = user.id
  end

  def create
    @user = User.new(params[:user])
    @user.password = params[:password]
  end

  def login
    @user = User.find_by(username: params[:username])
    if @user.password == params[:password]
      given_token
      puts "*" * 80
      "inside login with password, redirect to user profile"
      redirect "/users/{@user.id}"
    else
      # redirect_to home_url
      puts "*" * 80
      puts "inside login without password"
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

end
