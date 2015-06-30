helpers do

  def create
    @user = User.new(params[:user])
    @user.password = params[:password]
    @user.save!
  end

  def login
    @user = User.find_by(username: params[:username])
    if @user.password == params[:password]
      given_token
    else
      redirect_to home_url
    end
  end

  # assign them a random one and mail it to them, asking them to change it
  def forgot_password
    @user = User.find_by(username: params[:username])
    random_password = Array.new(10).map { (65 + rand(58)).chr }.join
    @user.password = random_password
    @user.save!
    Mailer.create_and_deliver_password_change(@user, random_password)
  end

end
